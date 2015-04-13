#include <htc.h>
#include "steppermotor.h"

#define _XTAL_FREQ 20000000  //Oscillator (20MHz)
//define stepping sequence

#define STEP0 0b00111100 
#define STEP1 0b00101110 
#define STEP2 0b00101011 
#define STEP3 0b00100111 
#define STEP4 0b00110101 
#define STEP5 0b00010111 
#define STEP6 0b00011011 
#define STEP7 0b00011110

#define STEP_OFF 0b00111001 //all winding deenergised

#define CLOCKWISE 0
#define COUNTERCLOCKWISE 1

char current_step = STEP0;		//stores current step



void rotate(unsigned char steps, unsigned char direction)  //rotate "steps" half steps in "direction" direction - each half step is .9 degrees
{

	
	for(;steps!=0;--steps) 
	{
		if (direction == CLOCKWISE)
		{
			switch(current_step)
			{
				case STEP0:	PORTC = STEP1; current_step = STEP1;		
					break;
				case STEP1:	PORTC = STEP2; current_step = STEP2;		
					break;
				case STEP2:	PORTC = STEP3; current_step = STEP3;		
					break;
				case STEP3:	PORTC = STEP4; current_step = STEP4;		
					break;
				case STEP4:	PORTC = STEP5; current_step = STEP5;		
					break;
				case STEP5:	PORTC = STEP6; current_step = STEP6;		
					break;
				case STEP6:	PORTC = STEP7; current_step = STEP7;		
					break;
				case STEP7:	PORTC = STEP0; current_step = STEP0;		
					break;
	
				default: PORTC = STEP_OFF;	
					 break;
			}
		}
		else if (direction == COUNTERCLOCKWISE) //reverse step order
		{
			switch(current_step)
			{
				case STEP0:	PORTC = STEP7; current_step = STEP7;		
					break;
				case STEP1:	PORTC = STEP0; current_step = STEP0;		
					break;
				case STEP2:	PORTC = STEP1; current_step = STEP1;		
					break;
				case STEP3:	PORTC = STEP2; current_step = STEP2;		
					break;
				case STEP4:	PORTC = STEP3; current_step = STEP3;		
					break;
				case STEP5:	PORTC = STEP4; current_step = STEP4;		
					break;
				case STEP6:	PORTC = STEP5; current_step = STEP5;		
					break;
				case STEP7:	PORTC = STEP6; current_step = STEP6;		
					break;
	
				default: PORTC = STEP_OFF;	
					 break;
			}
		}
		else 
		{
			//unknown direction - do nothing
		}
		
		__delay_ms(15);  //give motor time to respond
	}
	
	PORTC = STEP_OFF; //deactivate windings after finished turning
}