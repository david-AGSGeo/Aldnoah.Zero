/*********************************************************************************
	Description: Assignment 3 submission. 
		-2Hz heartbeat
		-Toggleabe LED with debounced button
		-steppermotor initialisation and control with 
		3 push buttons (2 half steps Counterclockwise, 2 clockwise, 180 degree sweep)       			 
	Uses: DSX Experimenter board + Mechatronics Peripheral module																			 
	Connections: 
    Port B0 - Heartbeat LED 
	Port B1 - Toggleable LED 
	Ports B2-B5 - buttons PB0-3
	Port C - blah         																 
																				 
	Authors: David LEE 
	S/N 11055579
	Email: David@lee42.com         																 
																				 
**********************************************************************************/

#include <htc.h>
#include <stdio.h>
#include "adc.h"
#include "lcd.h"
#include "infrared.h"
#include "steppermotor.h"
#include "ser.h"
#include "HMI.h"
#include "robot.h"

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

#define UP 1
#define DOWN 2
#define LEFT 3
#define RIGHT 4
#define CENTER 5

#define STEPS180  200	//half steps for a 180 degree rotation (using 200 step/rev steppermotor)


//define stepping sequence
#define CLOCKWISE 0
#define COUNTERCLOCKWISE 1


#define		SELECT_NONE()	RC0 = 0; RC1 = 0;
#define		SELECT_EEPROM()	RC0 = 0; RC1 = 1;
#define		SELECT_RF()		RC0 = 1; RC1 = 0;
#define		SELECT_SM()		RC0 = 1; RC1 = 1;
#define 	SM_STEP()		RC2 = 1; NOP(); RC2 = 0;

#define SER_BUFFER_SIZE		16
		
#define SER_FIFO_MASK 		(SER_BUFFER_SIZE-1)


void calibrateIR(void);
int scan360(void);

unsigned char current_direction = CLOCKWISE; //stores the direction of the sweep
int totalSteps = 0; 


volatile unsigned char buttonPressed;
volatile unsigned char serialInput = 0;


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
	
	
	
	if(TMR0IF)  //interrupt from timer0
	{
		TMR0IF = 0;		//reset interrupt flag
		TMR0 = TMR0_VAL;	//reset timer0 value
		
		RTC_Counter++;		//increase the count
		//set clock flags 
		RTC_FLAG_1MS = 1;	
		if(RTC_Counter % 10 == 0) 
		{
			RTC_FLAG_10MS = 1;
		
			
		}
		if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
		if(RTC_Counter % 250 == 0) 		//EVERY 250ms
		{
			
			RTC_FLAG_250MS = 1;
			
		}
		if(RTC_Counter % 500 == 0) 		//EVERY 500ms
		{
			RTC_FLAG_500MS = 1;
			HBLED ^= 0x01;		//toggle heartbeat LED

		}
		if (buttonPressed == 0)
		{
			
			buttonPressed = ReadButtons();

		}
	}
	ser_int();							
}

void init()
{
	
	
	buttonPressed = 0;
	
	//PortB all inputs except pin 0 and 1
	
	TRISC &= 0b10010000;
	
	SSPSTAT = 0b01000000;
	SSPCON = 0b10100001; 
	//timer0 prescalar set
	OPTION_REG = 0b00000100;
	ser_init();	
	init_adc();
	lcd_init();
	robo_init();
	TRISB = 0b11111100;	//PortB all inputs except pin 0 and 1
	//enable timer0 interrupt
	TMR0IE = 1;
	PEIE=1;		//enable peripheral interrupts 
	//Enable all interrupts
	ei();
}



void calibrateIR(void)
{
	
	currentMenu = 1;
	rotate(8, CLOCKWISE);
	while (1)
	{
		if (RTC_FLAG_250MS == 1)
			{
				RTC_FLAG_250MS = 0;
				UpdateDisplay();
			}
		switch (buttonPressed)
		{
			case UP:
			
			
			buttonPressed = 0;
			
			break;
			case DOWN:
			
			
			buttonPressed = 0;
			
			break;
			case LEFT:
			rotate(1, COUNTERCLOCKWISE);
			
			buttonPressed = 0;
			
			break;
			case RIGHT:
			rotate(1, CLOCKWISE);
			
			buttonPressed = 0;
			
			break;
			case CENTER:
			totalSteps = 0;
			
			buttonPressed = 0;
			currentMenu = 0;
			return;

			default:
			
			break;
		}
	}
}
void ChargeMode(void)
{
	
	currentMenu = 2;
	ser_putch(128); //put in passive mode
		
	while (1)
	{
		if (RTC_FLAG_250MS == 1)
			{
				RTC_FLAG_250MS = 0;
				UpdateDisplay();
			}
		switch (buttonPressed)
		{
			case UP:
			
			
			buttonPressed = 0;
			
			break;
			case DOWN:
			
			
			buttonPressed = 0;
			
			break;
			case LEFT:
			
			
			buttonPressed = 0;
			
			break;
			case RIGHT:
		
			
			buttonPressed = 0;
			
			break;
			case CENTER:
			ser_putch(132); //full mode
			
			buttonPressed = 0;
			currentMenu = 0;
			return;

			default:
			buttonPressed = 0;
			break;
		}
	}
}


int scan360(void)
{
	int lowestVal = 0, lowestSteps = 0;

	for (int steps = 0; steps < 400; steps++)
	{
		readAvgDistance();
		if (adcVal > lowestVal)
		{
			lowestVal = adcVal;
			lowestSteps = steps;
			
		}
		rotate(1, COUNTERCLOCKWISE);
			
		if (RTC_FLAG_250MS == 1)
			{
				RTC_FLAG_250MS = 0;
				UpdateDisplay();
			}
		test = lowestSteps;
	} 

	return lowestSteps;
}




void main(void)
{
		unsigned char choice = 255;	
		int shortwall = 0;				
	
	
	//initialise function
	init();
	
		
	//Loop forever

	while(1)
	{


		if (RTC_FLAG_250MS == 1)
			{
				RTC_FLAG_250MS = 0;
				
				readAvgDistance();
				UpdateDisplay();
			}
		
		switch (buttonPressed)
		{
			case UP:
			Menu(UP);
			
			buttonPressed = 0;
			
			break;
			case DOWN:
			Menu(DOWN);
			
			buttonPressed = 0;
			
			break;
			case LEFT:
			Menu(LEFT);
			
			buttonPressed = 0;
			
			break;
			case RIGHT:
			Menu(RIGHT);
			
			buttonPressed = 0;
			
			break;
			case CENTER:
			choice = Menu(CENTER);
			
			buttonPressed = 0;
			
			break;
			default:
			buttonPressed = 0;
			break;
		}

		////////  THIS IS THE MENU ITEM SELECTIONS
		switch (choice)
		{
			case 0:		//Calibrate IR	
				calibrateIR();
			break;
			case 1:		//Scan 360 degrees
			 	shortwall = scan360();
				rotate((400 - shortwall), CLOCKWISE);
			break;
			case 2:		//Drive forward 2 meters
				__delay_ms(100);
				robotMove(200);///////CHange to 2000
					
			
			break;
			case 3:		//Drive in an L shape
				__delay_ms(100);
				robotMove(1000);
				robotTurn(-90);
				robotMove(1000);
			break;
			case 4:		//Follow wall
				robot_read();
			break;		
			
			case 5:		//Charge Mode
				ChargeMode();
			break;	
			default:
			
			break;
		}
		choice = 255;
	}
}