#include <htc.h>

#include "robot.h"
#include "ser.h"
#include "lcd.h"

void robotMove(int distance)
{
	

	lowByte = (unsigned char) distance ;
	highByte = (unsigned char) (distance >> 8);
						ser_putch(128); 
				
		ser_putch(132); 
		ser_putch(137); //drive - opcode 1
			
				ser_putch(1); // 
			
				ser_putch(44); 
				
				ser_putch(128); 
			
				ser_putch(0); 
				
				ser_putch(156); //distance travelled - opcode 2 
				
				ser_putch(highByte); 
			
				ser_putch(lowByte); 
				
				ser_putch(137); //drive - opcode 3

				ser_putch(0); 
			
				ser_putch(0); 
		
				ser_putch(0); 
			
				ser_putch(0); 
			
}