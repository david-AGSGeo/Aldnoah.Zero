#include <htc.h>


#include "robot.h"
#include "ser.h"
#include "lcd.h"

void robo_init(void)
{
		ser_putch(128); //start
				
		ser_putch(132); //full mode
}

void robotMove(int distance)
{
	

	lowByte = (unsigned char) (distance) ;
	highByte = (unsigned char) (distance >> 8);
			if (distance >= 0)
{
				ser_putch(137); //drive - opcode 1
			
				ser_putch(0); // 
			
				ser_putch(200); 
				
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
				ser_putch(156); //distance travelled - opcode 2 
				
				ser_putch(highByte); 
			
				ser_putch(lowByte); 

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