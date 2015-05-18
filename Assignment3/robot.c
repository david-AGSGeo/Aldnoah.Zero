/********************************  robot.c  **************************************
	Group Name: Aldnoah.Zero
	
	Contains routines for robot sensing and movement   																 
																				 
	 Authors 		 Student No.		Email
----------------------------------------------------------------------------------
	David Lee  		 11055579 			David@lee42.com 
	James Bohm		 11195839			JimmyBohm@gmail.com			
    Jose  Gunawarman 11784271			jose.adhitya@gmail.com
	Navi  Gunaratne  11434305			11434305@student.uts.edu.au   			
	John  Lim		 12050326			john.lim@hotmail.com								 
																				 
**********************************************************************************/

#include <htc.h>

#include "robot.h"
#include "ser.h"
#include "lcd.h"
#include "HMI.h"
#include "infrared.h"

#define DIST 0
#define ANGLE 1
#define ALL 2

//Radii
#define STRAIGHT 0x7FFF
#define LEFT -1800
#define RIGHT 1800

/************  robo_init  *************/
//initialise the robot to full mode
void robo_init(void)
{
	ser_putch(128); //start
	ser_putch(132); //full mode
	ser_putch(150);	// stop and sensor read requests
	ser_putch(0);
}

/************  robot_read  *************/
//reads the robot sensors specified
void robot_read(unsigned char readType)
{
	ser_putch(142); // Sensor Setup
	ser_putch(7);  // Bump Sensor Packet ID
	__delay_ms(5);
	BumpSensors = ser_getch();

	ser_putch(142); // Sensor Setup
	ser_putch(13);  // Virtual Wall Sensor Packet ID
	__delay_ms(5);
	VwallSensor = ser_getch();

	ser_putch(142); // Sensor Setup
	ser_putch(10);  // Cliff R Sensor Packet ID
	__delay_ms(5);
	CliffSensors = ser_getch();

	ser_putch(142); // Sensor Setup
	ser_putch(11);  // Cliff L Sensor Packet ID
	__delay_ms(5);
	CliffSensors += ser_getch();
	
	if (readType == DIST)
	{
		ser_putch(142); // Sensor Setup
		ser_putch(19);  // Distance Sensor Packet ID
		__delay_ms(5);
		DistHighByte = ser_getch();
		DistLowByte = ser_getch();
	}
	else if (readType == ANGLE)
	{	
		ser_putch(142); // Sensor Setup
		ser_putch(20);  // Angle Sensor Packet ID
		__delay_ms(5);
		AngleHighByte = ser_getch();
		AngleLowByte = ser_getch();
	}
	else if (readType == ALL)
	{	
		//read all sensors here
		ser_putch(142); // Sensor Setup
		ser_putch(19);  // Distance Sensor Packet ID
		__delay_ms(5);
		DistHighByte = ser_getch();
		DistLowByte = ser_getch();
		ser_putch(142); // Sensor Setup
		ser_putch(20);  // Angle Sensor Packet ID
		__delay_ms(5);
		AngleHighByte = ser_getch();
		AngleLowByte = ser_getch();
	}
}

/************  RobotDrive  *************/
//Moves the robot forward at the requested speed
void RobotDrive(int speed, int radius)
{
	//split speed into high and low byte
	unsigned char speedlowByte = (unsigned char)(speed);	
	unsigned char speedhighByte = (unsigned char)(speed >> 8);
	unsigned char radiuslowByte = (unsigned char)(radius);	
	unsigned char radiushighByte = (unsigned char)(radius >> 8);

	ser_putch(137); //drive - opcode 1

	ser_putch(speedhighByte); // speed high byte

	ser_putch(speedlowByte); //speed low byte

	ser_putch(radiushighByte); //128 is straight

	ser_putch(radiuslowByte);
}



void robotTurn(int angle)
{
	
	if (angle > 0)		//counter clockwise
	{
		ser_putch(137); 

		ser_putch(0);  

		ser_putch(200);

		ser_putch(0);

		ser_putch(1);
	}
	else if (angle < 0)						//clockwise
	{
		ser_putch(137); 

		ser_putch(0);  

		ser_putch(200);

		ser_putch(255);

		ser_putch(255);
	}
	else
	{
		ser_putch(137); 

		ser_putch(0);  

		ser_putch(0);

		ser_putch(0);

		ser_putch(0);
	}
}


/************  robotFollow  *************/
//
void robotFollow(int distance, int speed, int AdcTarget)
{
	distTravelled = 0;
	int temp1;
	RobotDrive(speed, STRAIGHT);	//start robot moving
	ROBOTerror = 0;	//no errors yet :)

	//keep going till requested distance is reached (absolute value used for negative distances)
	while (abs(distTravelled) < abs(distance))	
	{
		
		readAvgDistance();
		if (adcVal > (AdcTarget + 5) && adcVal < (AdcTarget + 30)) //correct right
		{
			RobotDrive(speed, RIGHT);	
		}
		else if (adcVal < (AdcTarget - 5) && adcVal > (AdcTarget - 30)) //correct left
		{
			RobotDrive(speed, LEFT);
		}
		else if (adcVal <= (AdcTarget - 30))	//turn right
		{
			ROBOTerror = 10;	//signal right turn
			break;
		}
		else if (adcVal >= (AdcTarget + 30))	//turn left
		{
			ROBOTerror = 11;	//signal a left turn
			break; 
		}
		else
		{
			RobotDrive(speed, STRAIGHT);
		}
		robot_read(DIST);
		if (BumpSensors)	//hit wall or lifted
		{
			ROBOTerror = 1;	//signal an error
			break;
		}
		if (VwallSensor)	//lifted
		{
			ROBOTerror = 2;	//signal an error
			break;
		}
		if (CliffSensors)	//cliff
		{
			ROBOTerror = 3;	//signal an error
			break;
		}
		temp1 = DistHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += DistLowByte;
		distTravelled += temp1;
		TotalDistTravelled += temp1;
		Disp2 = distTravelled;
		UpdateDisplay();
	//	float remaining = abs(distance) - abs(distTravelled) ;
	//	if ( remaining < 100)
	//	{
	//		RobotDrive(speed * (remaining/100.0), STRAIGHT);	//slow robot down
	//}
	}
	Disp2 = ROBOTerror;
		UpdateDisplay();
	RobotDrive(0, STRAIGHT);	//stop robot

}



/************  robotMoveSpeed  *************/
//move forward the requested distance at the requested speed
void robotMoveSpeed(int distance, int speed)
{
	distTravelled = 0;
	int temp1;
	RobotDrive(speed, STRAIGHT);	//start robot moving

	//keep going till requested distance is reached (absolute value used for negative distances)
	while (abs(distTravelled) < abs(distance))	
	{
		robot_read(DIST);
		if (BumpSensors)	//hit wall or lifted
		{
			ROBOTerror = 1;	//signal an error
			break;
		}
		if (VwallSensor)	//lifted
		{
			ROBOTerror = 2;	//signal an error
			break;
		}
		if (CliffSensors)	//cliff
		{
			ROBOTerror = 3;	//signal an error
			break;
		}
		temp1 = DistHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += DistLowByte;
		distTravelled += temp1;
		TotalDistTravelled += temp1;
		Disp2 = distTravelled;
		UpdateDisplay();
		//float remaining = abs(distance) - abs(distTravelled) ;
		//if ( remaining < 100)
		//{
	//		RobotDrive(speed * (remaining/100.0), STRAIGHT);	//slow robot down
	//	}
	}
	Disp2 = ROBOTerror;
		UpdateDisplay();
	RobotDrive(0, STRAIGHT);	//stop robot

}


/************  robotTurnSpeed  *************/
//turns the robot x degrees at selected speed

void robotTurnSpeed(int angle, int speed)
{
	angleTurned = 0;
	int temp1 = 0;

	robotTurn(angle);	//start robot turning

	//keep going till requested distance is reached (absolute value used for negative distances)
	while (abs(angleTurned) < abs(angle))	
	{
		robot_read(ANGLE);
		if (BumpSensors || VwallSensor)	//hit wall or lifted
		{
			ROBOTerror = 1;	//signal an error
			break;
		}
		temp1 = AngleHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += AngleLowByte;
		angleTurned += temp1;
		Disp2 = angleTurned;
		UpdateDisplay();
	}

	robotTurn(0);	//stop robot
}

/************  abs  *************/
//return the absolute value of the input
int abs(int v)
{
	return  (v * ((v > 0) - (v < 0))); //gets absolute value by multiplying by 1 or -1   
}