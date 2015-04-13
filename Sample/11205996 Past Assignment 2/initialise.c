#include "initialise.h"

void init()
{
	// initialise ADC
	//PortB all outputs
	TRISB = 0x00;

	

	

	//timer0
	OPTION_REG = 0b00000100;
	//enable timer0 interrupt
	TMR0IE = 1;
	
	//Enable all interrupts
	//GIE = 1;
	ei();
}

