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


	


void robotMove(int distance)
{
	distTravelled =0;

			if (distance >= 0)
{
				ser_putch(137); //drive - opcode 1
			
				ser_putch(0); // speed high byte
			
				ser_putch(50); //speed low byte
				
				ser_putch(128); 
			
				ser_putch(0); 
}
else
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
			break;
		distTravelled += DistLowByte;
		UpdateDisplay();
	}

				ser_putch(137); //drive - opcode 3

				ser_putch(0); 
			
				ser_putch(0); 
		
				ser_putch(0); 
			
				ser_putch(0); 
			
}

void robotTurn(int distance)
{
	

	turnlowByte = (unsigned char) (distance) ;
	turnhighByte = (unsigned char) (distance >> 8);				
	if (distance >= 0)
{
				ser_putch(137); //drive - opcode 1
			
				ser_putch(0); // 
			
				ser_putch(100); 
				
				ser_putch(0); 
			
				ser_putch(1);
}
else
{
				ser_putch(137); //drive - opcode 1
			
				ser_putch(0); // 
			
				ser_putch(100); 
				
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