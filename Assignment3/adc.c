/********************************  adc.c  **************************************
	Group Name: Aldnoah.Zero
	
	Contains routines for reading the analog to digital converter   																 
																				 
	 Authors 		 Student No.		Email
----------------------------------------------------------------------------------
	David Lee  		 11055579 			David@lee42.com 
	James Bohm		 11195839			JimmyBohm@gmail.com			
    Jose  Gunawarman 11784271			jose.adhitya@gmail.com
	Navi  Gunaratne  11434305			11434305@student.uts.edu.au   			
	John  Lim		 12050326			john.lim@hotmail.com								 
																				 
**********************************************************************************/

#include "adc.h"
#define _XTAL_FREQ 20000000  //Oscillator (20MHz)

unsigned char adc_read_channel(unsigned char channel)
{
	switch(channel)
	{
		case 0: 
				CHS0 = 0;
				CHS1 = 0;
				CHS2 = 0;
				break;
		case 1: 
				CHS0 = 1;
				CHS1 = 0;
				CHS2 = 0;
				break;
		case 2: 
				CHS0 = 0;
				CHS1 = 1;
				CHS2 = 0;
				break;
		case 3: 
				CHS0 = 1;
				CHS1 = 1;
				CHS2 = 0;
				break;
		case 4: 
				CHS0 = 0;
				CHS1 = 0;
				CHS2 = 1;
				break;


		default: 
				return 0;
	}

	__delay_us(50);		
	
	return adc_read();

}

void init_adc(void)
{
	//set ports
	PORTA = 0;
	TRISA = 0b00111111;		//all inputs

	//set control registers
	ADCON0 = 0b10100001;	//Fosc/32, Channel 4, ADC on
	ADCON1 = 0b0000010;	//left justified, PortE Digital, PortA Analogue

	__delay_us(50);						// Delay for ADC aquisition

}

//get an adc result from the selected channel
unsigned int adc_read(void)
{
	volatile unsigned int adc_value;

	ADRESH	=	0; 	 	// Reset the ADRES value register 

	GO = 1;				  			// Staring the ADC process 					
  	while(GO) continue;			   	// Wait for conversion complete 			
	asm("nop");
	asm("nop");
	asm("nop");		
		

	adc_value	=	 ADRESH;	
	adc_value <<= 1;
	adc_value |= (ADRESL >> 15);


  	return (adc_value);     				// Return the value of the ADC process
}  