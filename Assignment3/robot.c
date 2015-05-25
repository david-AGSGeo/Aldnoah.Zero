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
#include "steppermotor.h"


#define DIST 0
#define ANGLE 1
#define ALL 2


//Radii
#define STRAIGHT 0x7FFF
#define LEFT -1700
#define RIGHT 1700
#define ARCRIGHT -400
#define ARCLEFT 400

#define IDEAL 100	//target distance for IR wall follow

#define TRACKINGDIST 2050

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
	ser_putch(10);  // Cliff R Sensor Packet ID
	//__delay_ms(5);
	CliffSensors = ser_getch();

	ser_putch(142); // Sensor Setup
	ser_putch(11);  // Cliff L Sensor Packet ID
	//__delay_ms(5);
	CliffSensors += ser_getch();
	//if (CliffSensors)
	//	return;
	
	ser_putch(142); // Sensor Setup
	ser_putch(7);  // Bump Sensor Packet ID
	//__delay_ms(5);
	BumpSensors = ser_getch();

	ser_putch(142); // Sensor Setup
	ser_putch(13);  // Virtual Wall Sensor Packet ID
	//__delay_ms(5);
	VwallSensor = ser_getch();
	
	ser_putch(142); // Sensor Setup
	ser_putch(17);  // Virtual Wall Sensor Packet ID
	//__delay_ms(5);
	VictimSensor = ser_getch();

	
	
	if (readType == DIST)
	{
		ser_putch(142); // Sensor Setup
		ser_putch(19);  // Distance Sensor Packet ID
		//__delay_ms(5);
		DistHighByte = ser_getch();
		DistLowByte = ser_getch();
	}
	else if (readType == ANGLE)
	{	
		ser_putch(142); // Sensor Setup
		ser_putch(20);  // Angle Sensor Packet ID
		//__delay_ms(5);
		AngleHighByte = ser_getch();
		AngleLowByte = ser_getch();
	}
	else if (readType == ALL)
	{	
		//read all sensors here
		ser_putch(142); // Sensor Setup
		ser_putch(19);  // Distance Sensor Packet ID
		//__delay_ms(5);
		DistHighByte = ser_getch();
		DistLowByte = ser_getch();
		ser_putch(142); // Sensor Setup
		ser_putch(20);  // Angle Sensor Packet ID
		//__delay_ms(5);
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
void robotFollow(int speed, int AdcTarget)
{
	distTravelled = 0;
	int temp1;
	unsigned char hysterysis = 20;
	RobotDrive(speed, STRAIGHT);	//start robot moving
	ROBOTerror = 0;	//no errors yet :)
	
	//keep going :)
	while (1)	
	{	
		if (AdcTarget > 185) // too close to wall!
		{
			ser_putch(141); 
			ser_putch(0);
			robotTurnSpeed(70,400);
			robotMoveSpeed(100,ROBOTSPEED);	//move forward to sense next wall
			robotTurnSpeed(-70,400);
			readAvgDistance();
			ROBOTerror = 0;
			break;
		}
			/*if (AdcTarget < 30) // too far from wall!
		{
			ser_putch(141); 
			ser_putch(0);

			robotTurnSpeed(-10,400);
			readAvgDistance();
			ROBOTerror = 0;
			break;
		}*/
		if (AdcTarget > IDEAL)	// veer toward ideal distance 
			AdcTarget--;
		if (AdcTarget < IDEAL)
			AdcTarget++;
		readAvgDistance();
		if (adcVal > (AdcTarget) && adcVal < (AdcTarget + hysterysis)) //correct right
		{
			if (followDir == LEFTFLW)
				RobotDrive(speed, LEFT);
			if (followDir == RIGHTFLW)
				RobotDrive(speed, RIGHT);
				
		}
		else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - hysterysis)) //correct left
		{
			if (followDir == LEFTFLW)
				RobotDrive(speed, RIGHT);
			if (followDir == RIGHTFLW)
				RobotDrive(speed, LEFT);
		}
		else if (adcVal <= (AdcTarget - hysterysis) || adcVal >= (AdcTarget + hysterysis))	//corner detected
		{
			if (followDir == RIGHTFLW)
			{
				rotate(10,COUNTERCLOCKWISE);
				readAvgDistance();
				rotate(10,CLOCKWISE);
			}
			else
			{
				rotate(10,CLOCKWISE);
				readAvgDistance();
				rotate(10,COUNTERCLOCKWISE);
			}
			if (adcVal < 50)
				ROBOTerror = 11;	//signal Right turn
			else
				ROBOTerror = 10;	//signal Left turn
			
			break;
		}
		else
		{
			RobotDrive(speed, STRAIGHT);
		}
		robot_read(DIST);
		if (BumpSensors)	//hit wall or lifted
		{
			RobotDrive(0, STRAIGHT);	//stop robot
			ROBOTerror = 1;	//signal an error
			break;
		}
		if (VwallSensor)	//lifted
		{
			RobotDrive(0, STRAIGHT);	//stop robot
			ROBOTerror = 2;	//signal an error
			break;
		}
		if (CliffSensors)	//cliff
		{
			RobotDrive(-200, 0x7FFF); //reverse robot!
			ROBOTerror = 3;	//signal an error
			break;
		}
		if (VictimSensor != 255)	//victim
		{
			RobotDrive(0, STRAIGHT);	//stop robot
			ROBOTerror = 4;	//signal an error
			break;
		}
		temp1 = DistHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += DistLowByte;
		distTravelled += temp1;
		TotalDistTravelled += temp1;
		if (trackingDist > 0 && trackingDist <= TotalDistTravelled - TRACKINGDIST )	//victim
		{
			
			robotTurnSpeed(80,400); 
			robotMoveSpeed(400, ROBOTSPEED);
			trackingDist = 0;
			RobotPos++;
			break;
		}		
		Disp2 = RobotPos;
		UpdateDisplay();	//show distance travelled
	}

	Disp2 = RobotPos;
	UpdateDisplay(); //show error code	
}

void robot_turnInPlace()
{
	switch (RobotPos)
	{
		case 8:
			robotTurnSpeed(160,400); 
			RobotPos++;
			break;
		case 12:
			robotTurnSpeed(80,400); 
			break;
		case 14:
			robotTurnSpeed(80,400); 
			ser_putch(141); 
			ser_putch(3);
			break;

		case 15:
			robotTurnSpeed(160,400); 
			RobotPos++;
			break;
		case 16:
			robotTurnSpeed(70,400); 
			break;
		case 17:
			robotTurnSpeed(80,400); 
			break;
		case 21:
			//home!!!!!
			RobotDrive(0, STRAIGHT);	//stop robot
			ser_putch(141); 
			ser_putch(2);
			ROBOTerror = 9;
			
			break;
		default:
				if (followDir == LEFTFLW)
					robotTurnSpeed(-80,400);    //Right
				if (followDir == RIGHTFLW)
					robotTurnSpeed(80,400);    //Left
			
			break;
	}
}

void robot_turnArc(int speed)
{
	
	angleTurned = 0;
	int temp1;
	int turnTarget = 0; 
	RobotDrive(speed, STRAIGHT);	//start robot moving
	ROBOTerror = 0;	//no errors yet :)
	if (followDir == RIGHTFLW)
	{
		rotate(25,CLOCKWISE);
	}
	else
	{
		rotate(25,COUNTERCLOCKWISE);
	}	
	readAvgDistance();
	int AdcTarget = adcVal;
	//keep going :)
	while (1)	
	{
		readAvgDistance();
		if (adcVal > (AdcTarget) && adcVal < (AdcTarget + 15)) //correct right
		{
			RobotDrive(speed, RIGHT);	
		}
		else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - 15)) //correct left
		{
			RobotDrive(speed, LEFT);
		}
			else if (adcVal <= (AdcTarget - 50) || adcVal >= (AdcTarget + 15))	//corner detected
		{
				break;
		}
			
		else
		{
			RobotDrive(speed, STRAIGHT);
		}
		robot_read(ALL);
		if (BumpSensors)	//hit wall or lifted
		{
			RobotDrive(0, STRAIGHT);	//stop robot
			ROBOTerror = 1;	//signal an error
			break;
		}
		if (VwallSensor)	//lifted
		{
			RobotDrive(0, STRAIGHT);	//stop robot
			ROBOTerror = 2;	//signal an error
			break;
		}
		if (CliffSensors)	//cliff
		{
			RobotDrive(-200, 0x7FFF); //reverse robot!
			ROBOTerror = 3;	//signal an error
			break;
		}
		if (VictimSensor != 255)	//victim
		{
			RobotDrive(0, STRAIGHT);	//stop robot
			ROBOTerror = 4;	//signal an error
			break;
		}
		temp1 = DistHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += DistLowByte;
		distTravelled += temp1;
		TotalDistTravelled += temp1;
		temp1 = AngleHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += AngleLowByte;
		angleTurned += temp1;
		Disp2 = RobotPos;
		UpdateDisplay();	//show distance travelled
	}
	
	angleTurned = 0;
	switch (RobotPos)
	{
		case 3:
			RobotDrive((speed /3), ARCRIGHT);	//start robot moving
			turnTarget = -100;
			break;

		case 7:
			RobotDrive((speed), ARCRIGHT-100);	//start robot moving
			turnTarget = -185;
			break;
		case 10:
			RobotDrive((speed), ARCRIGHT );	//start robot moving
			turnTarget = -90;
			break;
		case 11:
			RobotDrive((speed), ARCRIGHT - 100);	//start robot moving
			turnTarget = -190;
			break;
		case 12:
			RobotDrive((speed), ARCRIGHT - 50);	//start robot moving
			turnTarget = -185;

			break;
		case 15:
			RobotDrive((speed), ARCRIGHT - 100);	//start robot moving
			turnTarget = -190;
			break;
		case 19: //skip over turn
			robotMoveSpeed(600, ROBOTSPEED);
			turnTarget = 0;
			break;
		case 20: //FINAL TURN
			RobotDrive((speed), ARCRIGHT - 100);	//start robot moving
			turnTarget = -190;
			break;
		default:
				if (followDir == LEFTFLW)
{
					RobotDrive((speed), ARCLEFT);	//start robot moving
					turnTarget = 75;
}
				if (followDir == RIGHTFLW)
{
					RobotDrive((speed), ARCRIGHT);	//start robot moving
					turnTarget = -75;
}			
			
			break;
	}
	if (followDir == RIGHTFLW)
	{
		rotate(25,COUNTERCLOCKWISE);
	}
	else
	{
		rotate(25,CLOCKWISE);
	}	
	
	while (abs(angleTurned) < abs(turnTarget))	
	{
		robot_read(ALL);
		if (BumpSensors)	//hit wall or lifted
		{
			RobotDrive(0, STRAIGHT);	//stop robot
			ROBOTerror = 1;	//signal an error
			break;
		}
		if (VwallSensor)	//lifted
		{
			RobotDrive(0, STRAIGHT);	//stop robot
			ROBOTerror = 2;	//signal an error
			break;
		}
		if (CliffSensors)	//cliff
		{
			
			ROBOTerror = 3;	//signal an error
			break;
		}
		if (VictimSensor != 255)	//victim
		{
			RobotDrive(0, STRAIGHT);	//stop robot
			ROBOTerror = 4;	//signal an error
			break;
		}
		temp1 = AngleHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += AngleLowByte;
		angleTurned += temp1;
		temp1 = DistHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += DistLowByte;
		distTravelled += temp1;
		TotalDistTravelled += temp1;
		
		UpdateDisplay();
	}
	Disp2 = ROBOTerror;
	UpdateDisplay(); //show error code
	

}

/************  robotMoveSpeed  *************/
//move forward the requested distance at the requested speed
void robotMoveSpeed(int distance, int speed)
{
	robot_read(ALL);
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
		if (VictimSensor != 255)	//victim
		{
			ROBOTerror = 4;	//signal an error
			break;
		}
		temp1 = DistHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += DistLowByte;
		distTravelled += temp1;
		TotalDistTravelled += temp1;
		Disp2 = distTravelled;
		UpdateDisplay();
	}
	Disp2 = ROBOTerror;
		UpdateDisplay();
	RobotDrive(0, STRAIGHT);	//stop robot

}


/************  robotTurnSpeed  *************/
//turns the robot x degrees at selected speed

void robotTurnSpeed(int angle, int speed)
{
	robot_read(ALL);
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

void RobotBattRead(void)
{
	int temp1 = 0;
	ser_putch(142); // Sensor Setup
	ser_putch(25);  // Distance Sensor Packet ID
	__delay_ms(5);
	DistHighByte = ser_getch();
	DistLowByte = ser_getch();
	ser_putch(142); // Sensor Setup
	ser_putch(21);  // Angle Sensor Packet ID
	__delay_ms(5);
	BattState = ser_getch();
	

	temp1 = DistHighByte;	//add bytes together
	temp1 = temp1 << 8;
	temp1 += DistLowByte;
	BattCharge = temp1;
	}

/************  abs  *************/
//return the absolute value of the input
int abs(int v)
{
	return  (v * ((v > 0) - (v < 0))); //gets absolute value by multiplying by 1 or -1   
}


void robotLoadSong(void)
{
	ser_putch(140); //error 1
		ser_putch(0); 
		ser_putch(2); 

		ser_putch(72); 
		ser_putch(16);
		ser_putch(84); 
		ser_putch(16);

	ser_putch(140); //error 2
		ser_putch(1); 
		ser_putch(2); 

		ser_putch(84); 
		ser_putch(16);
		ser_putch(72); 
		ser_putch(16);

	ser_putch(140); //JAWS THEME START
		ser_putch(2); 
		ser_putch(2); 

		ser_putch(48); 
		ser_putch(48);
		ser_putch(49); 
		ser_putch(16);

ser_putch(140); //JAWS THEME cont
		ser_putch(3); 
		ser_putch(16); 

		ser_putch(48); 
		ser_putch(16);
		ser_putch(49); 
		ser_putch(16);
		ser_putch(48); 
		ser_putch(16);
		ser_putch(49); 
		ser_putch(16);
		ser_putch(48); 
		ser_putch(16);
		ser_putch(49); 
		ser_putch(16);	
		ser_putch(48); 
		ser_putch(16);
		ser_putch(49); 
		ser_putch(16);	
		ser_putch(48); 
		ser_putch(16);
		ser_putch(49); 
		ser_putch(16);	
		ser_putch(48); 
		ser_putch(16);
		ser_putch(49); 
		ser_putch(16);
		ser_putch(48); 
		ser_putch(16);
		ser_putch(49); 
		ser_putch(16);	
		ser_putch(48); 
		ser_putch(16);
		ser_putch(49); 
		ser_putch(16);

ser_putch(140); //JAWS THEME cont
		ser_putch(4); 
		ser_putch(6); 
	
		ser_putch(63); 
		ser_putch(8);	
		ser_putch(67); 
		ser_putch(8);	
		ser_putch(73); 
		ser_putch(48);	
				
		ser_putch(63); 
		ser_putch(8);	
		ser_putch(67); 
		ser_putch(8);	
		ser_putch(75); 
		ser_putch(64);	
	
	
	
	
}