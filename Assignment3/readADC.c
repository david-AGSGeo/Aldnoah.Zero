
/*********************************************************************************
	Description: Read the IR sonsor signal and when an object comes close
			to the sensor, an LED turns on.
				       			 
	Uses: DSX Experimenter board and IR sensor																		 
	Connections: 	Power up the IR sensor
			Analog channel4 - IR sensor signal pin
			RB0 to an LED															 
																				 
	Author: Buddhi Wijerathna           																 
																				 
**********************************************************************************/


#include <htc.h>

//my includes
#include "adc.h"



//not sure what versions break config - so just for anything less than current for now
#if (_HTC_VER_MAJOR_ < 9 && _HTC_VER_MINOR_ < 81)
	__CONFIG(HS & WDTDIS & PWRTEN & BOREN & LVPDIS & DUNPROT & WRTEN & UNPROTECT);
#else
	__CONFIG(FOSC_HS &  WDTE_OFF & CP_OFF & BOREN_OFF & PWRTE_ON & WRT_OFF & LVP_OFF & CPD_OFF);
#endif



//Defines
#define _XTAL_FREQ 20000000 //Osillator (Hz)
#define TMR0_VAL 100	//timer0 start count

//global variables
volatile unsigned char rtcCounter = 0;

//functions
void init()
{
	//adc
	init_adc();

	//PortB all outputs
	TRISB = 0x00;
	PORTB = 0b00000000;
}


void main(void)
{
	//initialise function
	init();
	unsigned int fullval;
	//Loop forever
	while(1)
	{	
			fullval = adc_read() ; //Read the ADC value
			if (fullval > 500)
			PORTB = 0xFF;
			else
			PORTB = 0x00;
	}
}