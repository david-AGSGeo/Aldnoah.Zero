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
#include "infrared.h"
#include "steppermotor.h"
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