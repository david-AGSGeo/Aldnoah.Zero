/*********************************************************************************
	Description: Makes the irobot make some noise by serial communication
				       			 
	Uses: iRobot Create, DSX Experimenter board and SPI addon module																											
												
	Author: Buddhi Wijerathna           																 
					 
**********************************************************************************/


#include <htc.h>
#include "ser.h"


__CONFIG(FOSC_HS &  WDTE_OFF & CP_OFF & BOREN_OFF & PWRTE_ON & WRT_OFF & LVP_OFF & CPD_OFF);


//Defines
//Osillator (Hz)
#define _XTAL_FREQ 20000000



// Interrupt service routine
void interrupt isr1(void) 
{

	ser_int();
}


void init()
{
	//TRISC &= 0b10010000;	//set pin 6 to output for USART TX, pins for SPI and CS pins

	ser_init(); 		//initialize UART

	//Enable all interrupts
	PEIE = 1;	
	GIE  = 1;

}


void main(void)
{
	
	//initialise function
	init();


		ser_putch(128); 
		__delay_ms(100);
		ser_putch(132); 
		__delay_ms(100);
		ser_putch(140); 
		__delay_ms(100);
		ser_putch(0); 
		__delay_ms(100);
		ser_putch(4); 
		__delay_ms(100);
		ser_putch(62); 
		__delay_ms(100);
		ser_putch(12); 
		__delay_ms(100);
		ser_putch(66); 
		__delay_ms(100);
		ser_putch(12); 
		__delay_ms(100);
		ser_putch(69); 
		__delay_ms(100);
		ser_putch(12); 
		__delay_ms(100);
		ser_putch(74); 
		__delay_ms(100);
		ser_putch(36); 
		__delay_ms(100);
		ser_putch(141); 
		__delay_ms(100);
		ser_putch(0); 
		__delay_ms(100);


	
__delay_ms(10000);
}