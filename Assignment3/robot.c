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
void robot_read(void)
{
	ser_putch(142); // Sensor Setup
	ser_putch(7);  // Bump Sensor Packet ID
	__delay_ms(5);
	BumpSensors = ser_getch();
	ser_putch(142); // Sensor Setup
	ser_putch(19);  // Distance Sensor Packet ID
	__delay_ms(5);
	DistHighByte = ser_getch();
	DistLowByte = ser_getch();

}

/************  RobotDrive  *************/
//Moves the robot forward at the requested speed
void RobotDrive(int speed)
{
	//split speed into high and low byte
	unsigned char speedlowByte = (unsigned char)(speed);	
	unsigned char speedhighByte = (unsigned char)(speed >> 8);

	ser_putch(137); //drive - opcode 1

	ser_putch(speedhighByte); // speed high byte

	ser_putch(speedlowByte); //speed low byte

	ser_putch(128);

	ser_putch(0);
}

/************  robotMoveSpeed  *************/
//move forward the requested distance at the requested speed
void robotMoveSpeed(int distance, int speed)
{
	distTravelled = 0;
	int temp1;
	RobotDrive(speed);	//start robot moving

	//keep going till requested distance is reached (absolute value used for negative distances)
	while (abs(distTravelled) <= abs(distance))	
	{
		robot_read();
		if (BumpSensors)	//hit wall or lifted
		{
			ROBOTerror = 1;	//signal an error
			break;
		}
		temp1 = DistHighByte;	//add bytes together
		temp1 = temp1 << 8;
		temp1 += DistLowByte;
		distTravelled += temp1;
		TotalDistTravelled += temp1;
		UpdateDisplay();
	}

	RobotDrive(0);	//stop robot

}

/************  robotMove  *************/
//move forward the requested distance at a set speed (not used currently)
void robotMove(int distance)
{

	distTravelled = 0;

	if (distance >= 0)	//forward
	{
		ser_putch(137); //drive - opcode 1

		ser_putch(0); // speed high byte

		ser_putch(50); //speed low byte

		ser_putch(128);

		ser_putch(0);
	}
	else							//backward
	{
		ser_putch(137); //drive - opcode 1

		ser_putch(0xff); // 

		ser_putch(0x38);

		ser_putch(128);

		ser_putch(0);
	}


	while (distTravelled <= distance)
	{
		robot_read();
		if (BumpSensors)	//hit wall or lifted
		{
			ROBOTerror = 1;
			break;
		}
		distTravelled += DistLowByte;
		TotalDistTravelled += DistLowByte;
		UpdateDisplay();
	}

	ser_putch(137); //drive - opcode 3

	ser_putch(0);

	ser_putch(0);

	ser_putch(0);

	ser_putch(0);

}

/************  robotTurn  *************/
//turns the robot x degrees
void robotTurn(int degrees)
{

	//split the degrees into high and low bytes
	turnlowByte = (unsigned char)(degrees);
	turnhighByte = (unsigned char)(degrees >> 8);
	if (degrees >= 0)		//ccounter clockwise
	{
		ser_putch(137); //drive - opcode 1

		ser_putch(0); // 

		ser_putch(50);

		ser_putch(0);

		ser_putch(1);
	}
	else						//clockwise
	{
		ser_putch(137); //drive - opcode 1

		ser_putch(0); // 

		ser_putch(50);

		ser_putch(255);

		ser_putch(255);
	}
	ser_putch(157); //angle travelled - opcode 2 

	ser_putch(turnhighByte);

	ser_putch(turnlowByte);

	ser_putch(137); //drive - opcode 3

	ser_putch(0);

	ser_putch(0);

	ser_putch(0);

	ser_putch(0);
}

/************  abs  *************/
//return the absolute value of the input
int abs(int v)
{
	return  (v * ((v > 0) - (v < 0))); //gets absolute value by multiplying by 1 or -1   
}