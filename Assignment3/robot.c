#include <htc.h>


#include "robot.h"
#include "ser.h"
#include "lcd.h"
#include "HMI.h"

void robo_init(void)
{
		ser_putch(128); //start
		ser_putch(132); //full mode
		ser_putch(150);
		ser_putch(0);
}

void robot_read(void)
{




	ser_putch (142); // Sensor Setup
	ser_putch (7);  // Distance Sensor Packet ID
	__delay_ms(5);
	BumpSensors = ser_getch();
	ser_putch (142); // Sensor Setup
	ser_putch (19);  // Distance Sensor Packet ID
	__delay_ms(5);
	DistHighByte = ser_getch();//ignored for now
	DistLowByte = ser_getch();
//	distTravelled =DistLowByte;
}

void RobotDrive(int speed)
{
		unsigned char speedlowByte = (unsigned char) (speed) ;
		unsigned char speedhighByte = (unsigned char) (speed >> 8);	

				ser_putch(137); //drive - opcode 1
			
				ser_putch(speedhighByte); // speed high byte
			
				ser_putch(speedlowByte); //speed low byte
				
				ser_putch(128); 
			
				ser_putch(0); 
}


	
void robotMoveSpeed(int distance, int speed)
{
	distTravelled =	0;
	int temp1;
	RobotDrive(speed);

	while (abs(distTravelled) <= abs(distance))
	{
		robot_read();
		if (BumpSensors)	//hit wall or lifted
		{	
			ROBOTerror = 1;
			break;
		}
		temp1 = DistHighByte;
		temp1 = temp1 << 8;
		temp1 += DistLowByte;		
		distTravelled += temp1;
		TotalDistTravelled += temp1;
		UpdateDisplay();
	}

	RobotDrive(0);
	
}

void robotMove(int distance)
{

	distTravelled =0;

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

void robotTurn(int degrees)
{
	

	turnlowByte = (unsigned char) (degrees) ;
	turnhighByte = (unsigned char) (degrees >> 8);				
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

int abs(int v) 
{
  return  (v * ((v>0) - (v<0))); //gets absolute value by multiplying by 1 or -1   
}