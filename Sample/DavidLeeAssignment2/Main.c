/*********************************************************************************
	Description: Assignment 1 submission. 
		-2Hz heartbeat
		-Toggleabe LED with debounced button
		-steppermotor initialisation and control with 
		3 push buttons (2 half steps Counterclockwise, 2 clockwise, 180 degree sweep)       			 
	Uses: DSX Experimenter board + Mechatronics Peripheral module																			 
	Connections: 
    Port B0 - Heartbeat LED 
	Port B1 - Toggleable LED 
	Ports B2-B5 - buttons PB0-3
	Port C - Steppermotor Controller         																 
																				 
	Author: David LEE 
	S/N 11055579
	Email: David@lee42.com         																 
																				 
**********************************************************************************/

#include <htc.h>
#include <stdio.h>
#include "adc.h"
#include "lcd.h"
//check htc.h version

#if (_HTC_VER_MAJOR_ < 9 && _HTC_VER_MINOR_ < 81)
	__CONFIG(HS & WDTDIS & PWRTEN & BOREN & LVPDIS & DUNPROT & WRTEN & UNPROTECT);
#else
	__CONFIG(FOSC_HS &  WDTE_OFF & CP_OFF & BOREN_OFF & PWRTE_ON & WRT_OFF & LVP_OFF & CPD_OFF);
#endif

#define _XTAL_FREQ 20000000  //Oscillator (20MHz)
#define TMR0_VAL 100	     //timer0 start count

#define HBLED RB0 //Heartbeat LED
#define LED0 RB1 //led for toggling
#define PB0 !RB2 //button 0 pin	
#define PB1 !RB3 //button 1 pin	
#define PB2 !RB4 //button 2 pin	
#define PB3 !RB5 //button 3 pin	
#define DEBOUNCE_REQ_COUNT 10  //10ms debounce time


#define STEPS180  200	//half steps for a 180 degree rotation (using 200 step/rev steppermotor)


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

#define NUMREADS 10 //number of adc reads to average for IR sensor

//Function Prototypes:
unsigned int readDistance(void);
unsigned int readAvgDistance(void);
void ADCconvert(unsigned int adcVal);

char current_step = STEP0;		//stores current step

unsigned char current_direction = CLOCKWISE; //stores the direction of the sweep

//set up debounce variables 

volatile bit pb0Pressed = 0;
volatile bit pb0Released = 0;
volatile unsigned char pb0DebounceCount = 0;

volatile bit pb1Pressed = 0;
volatile bit pb1Released = 0;
volatile unsigned char pb1DebounceCount = 0;

volatile bit pb2Pressed = 0;
volatile bit pb2Released = 0;
volatile unsigned char pb2DebounceCount = 0;

volatile bit pb3Pressed = 0;
volatile bit pb3Released = 0;
volatile unsigned char pb3DebounceCount = 0;

//set up flags for timer0 (currently not used))
volatile bit RTC_FLAG_1MS = 0;
volatile bit RTC_FLAG_10MS = 0;
volatile bit RTC_FLAG_50MS = 0;
volatile bit RTC_FLAG_250MS = 0;
volatile bit RTC_FLAG_500MS = 0;

//global counter for timer0
volatile unsigned int RTC_Counter = 0;

// Interrupt service routine
void interrupt isr1(void) 
{
	//Timer 1
	if(TMR0IF)  //interrupt from timer0
	{
		TMR0IF = 0;		//reset interrupt flag
		TMR0 = TMR0_VAL;	//reset timer0 value

		RTC_Counter++;		//increase the count
		//set clock flags (unused0
		RTC_FLAG_1MS = 1;	
		if(RTC_Counter % 10 == 0) RTC_FLAG_10MS = 1;	
		if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
		if(RTC_Counter % 250 == 0) 		//EVERY 250ms
		{
			ADCconvert(readAvgDistance());
			//readDistance();
			RTC_FLAG_250MS = 1;

		}
		if(RTC_Counter % 500 == 0) 		//EVERY 500ms
		{
			RTC_FLAG_500MS = 1;
			RTC_Counter = 0;	//reset RTC Counter
			HBLED ^= 0x01;		//toggle heartbeat LED
		}

		//Debounce PB0
		if(PB0)
		{
			pb0DebounceCount++; //count 10 ms, and then wait for release 
			if(pb0DebounceCount >= DEBOUNCE_REQ_COUNT & pb0Released)
			{
				pb0Pressed = 1;			
				pb0Released = 0;
			}
		}
		else
		{
			pb0DebounceCount = 0;
			pb0Released = 1;
		}

		//Debounce PB1
		if(PB1)
		{
			pb1DebounceCount++;
			if(pb1DebounceCount >= DEBOUNCE_REQ_COUNT & pb1Released)
			{
				pb1Pressed = 1;			
				pb1Released = 0;
			}
		}
		else
		{
			pb1DebounceCount = 0;
			pb1Released = 1;
		}
		//Debounce PB2
		if(PB2)
		{
			pb2DebounceCount++;
			if(pb2DebounceCount >= DEBOUNCE_REQ_COUNT & pb2Released)
			{
				pb2Pressed = 1;			
				pb2Released = 0;
			}
		}
		else
		{
			pb2DebounceCount = 0;
			pb2Released = 1;
		}
		//Debounce PB3
		if(PB3)
		{
			pb3DebounceCount++;
			if(pb3DebounceCount >= DEBOUNCE_REQ_COUNT & pb3Released)
			{
				pb3Pressed = 1;			
				pb3Released = 0;
			}
		}
		else
		{
			pb3DebounceCount = 0;
			pb3Released = 1;
		}
	}
}

void init()
{
	init_adc();
	lcd_init();
	//PortB all inputs except pin 0 and 1
	TRISB = 0b11111100;

	//PortC all Output
	TRISC = 0x00;

	//timer0 prescalar set
	OPTION_REG = 0b00000100;

	//enable timer0 interrupt
	TMR0IE = 1;
	
	//Enable all interrupts
	ei();
}



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

unsigned int readDistance(void)
{
	unsigned int fullval ;

	char adcOutput[16] = "";

	fullval = adc_read_channel(0); //channel 0 not reading properly?
	lcd_write_control(0b00000001); //clear display
	sprintf(adcOutput,"Adc Value: %d", fullval);
	lcd_set_cursor(0x00);
	lcd_write_string(adcOutput);
	lcd_set_cursor(0x40);
	lcd_write_3_digit_bcd(fullval);
	return fullval;
}

unsigned int readAvgDistance(void)
{
	unsigned int fullval = 0, averageval;
	char adcOutput[16] = "";
	
	for (int i = 0; i < NUMREADS; i++)
{
	fullval += adc_read_channel(0);
	
}
	averageval = fullval / NUMREADS;
	sprintf(adcOutput,"Adc Value: %d", averageval);
	lcd_set_cursor(0x00);
	lcd_write_control(0b00000001); //clear display
	lcd_write_string(adcOutput);
	return averageval;
}

void ADCconvert(unsigned int adcVal)
{
	char adcOutput[16] = "";
	unsigned int distance;
	if (adcVal > 250)
	{
		distance = 20;
	}
	else if (adcVal < 250 && adcVal >= 190)
	{
distance = 20+ (adcVal%100) ;
	}
	else if (adcVal < 190 && adcVal >= 96)
	{
		distance = 30+ (adcVal%100) ;
	}
else if (adcVal < 190 && adcVal >= 96)
	{
		distance = 40+ (adcVal%100) ;
	}
else if (adcVal < 115 && adcVal >= 96)
	{
		distance = 50+ (adcVal%100) ;
	}
else if (adcVal < 96 && adcVal >= 82)
	{
		distance = 60+ (adcVal%100) ;
	}
else if (adcVal < 82 && adcVal >= 70)
	{
		distance = 70+ (adcVal%100) ;
	}
else if (adcVal < 70 && adcVal >= 64)
	{
		distance = 80+ (adcVal%100) ;
	}
else if (adcVal < 64 && adcVal >= 56)
	{
		distance = 90+ (adcVal%100) ;
	}
else if (adcVal < 56 && adcVal >= 45)
	{
		distance = 100+ (adcVal%100) ;
	}
else if (adcVal < 45 && adcVal >= 40)
	{
		distance = 110+ (adcVal%100) ;
	}
else if (adcVal < 40 && adcVal >= 33)
	{
		distance = 120+ (adcVal%100) ;
	}
else if (adcVal < 33 )
	{
		distance = 130 + (adcVal%100) ;
	}

	


	sprintf(adcOutput,"Distance: %dcm", distance);
	lcd_set_cursor(0x40);
	
	lcd_write_string(adcOutput);
}


void main(void)
{

	
	
	//initialise function
	init();
	//initialise stepper motor to known winding
	rotate(8, CLOCKWISE);

	//Loop forever
	while(1)
	{
		if(pb0Pressed) //toggle LED0
		{
			pb0Pressed = 0;
			
			
			LED0 ^= 0x01;
						
			
		}

		if(pb1Pressed) // 2 half steps CounterClockwise
		{
			pb1Pressed = 0;
			
			rotate(2, COUNTERCLOCKWISE);
		}

		if(pb2Pressed) // 2 half steps Clockwise
		{
			pb2Pressed = 0;
			
			rotate(2, CLOCKWISE);
		}

		if(pb3Pressed) //180 degree sweep (reverse direction each time button is pressed)
		{
			pb3Pressed = 0;
			
			rotate(STEPS180, current_direction);
			current_direction ^= 0x01;
		}
	}
}