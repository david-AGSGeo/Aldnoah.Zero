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
	Port C - Steppermotor Controller         																 
																				 
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


void calibrateIR(void);
int scan360(void);

unsigned char current_direction = CLOCKWISE; //stores the direction of the sweep
int totalSteps = 0; 
unsigned char SCAN_FLAG = 0;

volatile unsigned char buttonPressed = 0;
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
	//Timer 1
	ser_int();
	

	if(TMR0IF)  //interrupt from timer0
	{
		TMR0IF = 0;		//reset interrupt flag
		TMR0 = TMR0_VAL;	//reset timer0 value

		RTC_Counter++;		//increase the count
		//set clock flags (unused0
		RTC_FLAG_1MS = 1;	
		if(RTC_Counter % 10 == 0) 
		{
			RTC_FLAG_10MS = 1;
		
			
		}
		if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
		if(RTC_Counter % 250 == 0) 		//EVERY 250ms
		{
			if (SCAN_FLAG == 0)
			{
				readAvgDistance();
				UpdateDisplay(serialInput);
			}
			RTC_FLAG_250MS = 1;

		}
		if(RTC_Counter % 500 == 0) 		//EVERY 500ms
		{
			RTC_FLAG_500MS = 1;
			RTC_Counter = 0;	//reset RTC Counter
			HBLED ^= 0x01;		//toggle heartbeat LED
		}
		
		if (buttonPressed == 0)
			{
			buttonPressed = ReadButtons();
			}
	}
}

void init()
{
	init_adc();
	lcd_init();
	ser_init();
	robo_init();
	//PortB all inputs except pin 0 and 1
	TRISB = 0b11111100;
	
	TRISC &= 0b10010000;			//set pin 6 to output for USART TX, pins for SPI and CS pins

	SSPSTAT = 0b01000000;
	SSPCON = 0b10100001; 
	//timer0 prescalar set
	OPTION_REG = 0b00000100;
	
	//enable timer0 interrupt
	TMR0IE = 1;
	
	//Enable all interrupts
	ei();
}



void calibrateIR(void)
{
	
	currentMenu = 1;
	rotate(8, CLOCKWISE);
	while (1)
	{
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
			return;
			break;
			default:
			
			break;
		}
	}
}

int scan360(void)
{
	int lowestVal = 0, lowestSteps = 0;
	SCAN_FLAG = 1;
	for (int steps = 0; steps < 400; steps++)
	{
		readAvgDistance();
		if (adcVal > lowestVal)
		{
			lowestVal = adcVal;
			lowestSteps = steps;
			
		}
		rotate(1, COUNTERCLOCKWISE);
		UpdateDisplay(serialInput);
		test = lowestSteps;
	} 
	SCAN_FLAG = 0;
	return lowestSteps;
}




void main(void)
{

	
	
	//initialise function
	init();
	//initialise stepper motor to known winding
	//rotate(8, CLOCKWISE);
		
	//Loop forever

	while(1)
	{
		unsigned char choice = 255;
		int shortwall = 0;
		currentMenu = 0;
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
				robotMove(2000);

			
			break;
			case 3:		//Drive in an L shape
				__delay_ms(100);
				robotMove(1000);
				robotTurn(-90);
				robotMove(1000);
			break;
			case 4:		//Follow wall

			break;		
			

			default:
			
			break;
		}
		choice = 255;

/*		if(pb0Pressed) //toggle LED0
		{
			pb0Pressed = 0;
			
			
			LED0 ^= 0x01;
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
			
//***************
				ser_putch(128);  // Start
				__delay_ms(100);
				ser_putch(132); // Full mode
				__delay_ms(100);
				ser_putch(152); // drive
				__delay_ms(100);
				ser_putch(13); // script length
				__delay_ms(100); 
				ser_putch(137); //drive - opcode 1
				__delay_ms(100);
				ser_putch(1); // 
				__delay_ms(100);
				ser_putch(44); 
				__delay_ms(100);
				ser_putch(128); 
				__delay_ms(100);
				ser_putch(0); 
				__delay_ms(100);
				ser_putch(156); //distance travelled - opcode 2 
				__delay_ms(100);
				ser_putch(1); 
				__delay_ms(100);
				ser_putch(144); 
				__delay_ms(100);
				ser_putch(137); drive - opcode 3
				__delay_ms(100);
				ser_putch(0); 
				__delay_ms(100);
				ser_putch(0); 
				__delay_ms(100);
				ser_putch(0); 
				__delay_ms(100);
				ser_putch(0); 
				__delay_ms(100);
		}

		if(pb1Pressed) // 2 half steps CounterClockwise
		{
			pb1Pressed = 0;
			
			//rotate(2, COUNTERCLOCKWISE);
		}

		if(pb2Pressed) // 2 half steps Clockwise
		{
			pb2Pressed = 0;
			
			//rotate(2, CLOCKWISE);
		}

		if(pb3Pressed) //180 degree sweep (reverse direction each time button is pressed)
		{
			pb3Pressed = 0;
			
			//rotate(STEPS180, current_direction);
			current_direction ^= 0x01;
		}


	switch (choice)
		{
			case 0:			
				SELECT_SM();			// SPI select the Stepper M
				spi_transfer(0b00001011);	//for clockwise rotation 
				SELECT_NONE();
				SM_STEP();
			break;
			case 1:
			  
				SELECT_SM();			// SPI select the Stepper M
				spi_transfer(0b00001001);	//for clockwise rotation 
				SELECT_NONE();
				SM_STEP();
			break;
			case 2:
				SELECT_SM();			// SPI select the Stepper M
				spi_transfer(0b00001111);	//for clockwise rotation 
				SELECT_NONE();
				SM_STEP();
			
			break;
			case 3:
				SELECT_SM();			// SPI select the Stepper M
				spi_transfer(0b00001101);	//for clockwise rotation 
				SELECT_NONE();
				SM_STEP();
			
			break;
			case 4:
				ser_putch(128); 
				__delay_ms(100);
				ser_putch(132); 
				__delay_ms(100);
ser_putch(137); 
				__delay_ms(100);

ser_putch(0); 
				__delay_ms(100);
ser_putch(0); 
				__delay_ms(100);
ser_putch(255); 
				__delay_ms(100);
ser_putch(255); 
				__delay_ms(100);
			break;
			default:
			
			break;
		}
		*/
	}
}