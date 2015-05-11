/*********************  MAIN.c   **************************************************
	Description: Assignment 3 submission. 
	Group Name: Aldnoah.Zero
	
	SPECS:
		-1Hz heartbeat
		-LCD Displaying continuous IR distance
		-LCD Menu for chosing options
		-Steppermotor Calibration
		-Charging Mode
		-360 IR Scan
		-2m Straight Line Robot manoeuvre
		-1m/side Robot L manoeuvre
		-Wall follow manoeuvre
     			 
	Uses: DSX Experimenter board + iRobot Create + iRobot - DSX interface Board																			 
	Connections: 

	Port A0 - IR Sensor ADC
    Port B0 - Heartbeat LED 
	Port B1 - Toggleable LED 
	Ports B2-B5 - 4way joystick button
	Port C - SPI and Serial   
	Port D - LCD
	Port E - LCD      																 
																				 
	 Authors 		 Student No.		Email
-----------------------------------------------------------------------------------
	David Lee  		 11055579 			David@lee42.com 
	James Bohm		 11195839			JimmyBohm@gmail.com			
    Jose  Gunawarman 11784271			jose.adhitya@gmail.com
	Navi  Gunaratne  11434305			11434305@student.uts.edu.au   			
	John  Lim		 12050326			john.lim@hotmail.com								 
																				 
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

//Menu Defines
#define UP 1
#define DOWN 2
#define LEFT 3
#define RIGHT 4
#define CENTER 5

//robot read types
#define DIST 0
#define ANGLE 1
#define ALL 2

//define stepping sequence directions
#define CLOCKWISE 0
#define COUNTERCLOCKWISE 1

//define robot parameters
#define DRIVESPEED 200

//Function Prototypes
void calibrateIR(void);
int scan360(void);
void ChargeMode(void);
void FollowWall(void);


//Global Variables
int totalSteps = 0; //stores steppermotor direction

volatile unsigned char buttonPressed;	//stores button presses



//set up flags for timer0 (currently not used))
volatile bit RTC_FLAG_1MS = 0;
//volatile bit RTC_FLAG_10MS = 0;
//volatile bit RTC_FLAG_50MS = 0;
volatile bit RTC_FLAG_250MS = 0;
volatile bit RTC_FLAG_500MS = 0;


//global counter for timer0
volatile unsigned int RTC_Counter = 0;

/************  isr1  *************/
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
		if(RTC_Counter % 250 == 0) 		//EVERY 250ms
		{	
			RTC_FLAG_250MS = 1;		
		}
		if(RTC_Counter % 500 == 0) 		//EVERY 500ms
		{
			RTC_FLAG_500MS = 1;
			HBLED ^= 0x01;		//toggle heartbeat LED
		}
		if (buttonPressed == 0)	//if no button is waiting to be responded to
		{
			buttonPressed = ReadButtons();	//chech and debounce buttons
		}
	}
	ser_int();		//serial recieve and transmit interrupt macro					
}

/************  init  *************/
//Initialisation Routine
void init()
{	
	buttonPressed = 0; //no buttons have been pressed	
	
	TRISB = 0b11111100;	//PortB all inputs except pin 0 and 1
	TRISC &= 0b10010000; //force PortC to output except 4 and 7
	
	//spi registers
	SSPSTAT = 0b01000000;
	SSPCON = 0b10100001; 

	//timer0 prescalar set
	OPTION_REG = 0b00000100;
	
	//Module Initialisations
	ser_init();	
	init_adc();
	lcd_init();
	robo_init();
	

	//enable timer0 interrupt
	TMR0IE = 1;
	//enable peripheral interrupts 
	PEIE=1;		
	//Enable all interrupts
	ei();
}


/*******************************************************************/
/*******************************MAIN********************************/
/*******************************************************************/
void main(void)
{
	unsigned char choice = 255;	
	int shortwall = 0;				

	//initialise function
	init();
		
	//Loop forever
	while(1)
	{
		if (RTC_FLAG_250MS == 1)	//4Hz refresh rate for display, IR, and reading robot values
		{
			RTC_FLAG_250MS = 0;
			robot_read(ALL);
			readAvgDistance();
			UpdateDisplay();
		}
		if (buttonPressed)	//if a button has been debounced, perform the 
							//appropriate menu action and wait for next button
		{
			choice = Menu(buttonPressed);
			buttonPressed = 0;
		}


		////////  THIS IS THE MENU ITEM SELECTIONS	///////
		switch (choice)
		{
			case 0:		//Calibrate IR	
				calibrateIR();
				break;
			case 1:		//Scan 360 degrees
			 	shortwall = scan360() - 13;	//find the closest wall
				rotate((200 - shortwall), CLOCKWISE);	//turn IR to face the closest wall
				break;
			case 2:		//Drive forward 2 meters
				//robotTurnSpeed(-90, 1); //turn clockwise 90 degrees				
				robotMoveSpeed(500, DRIVESPEED);
				break;
			case 3:		//Drive in an L shape
				robotTurnSpeed(90, 1); //turn clockwise 90 degrees		
				break;
			case 4:		//Follow wall
				TotalDistTravelled = 0;
				while(!ROBOTerror)
				{
					int shortwall = scan360(); 
					int RT2P = 0; //RT2P = Robot Turn to Position
					int direction1 = 0; // Cw (0) or ccw (1) flag
					if (shortwall > 200)	// If the wall is on right, turn 90deg ccw infront of wall.
				 		RT2P = shortwall + 100;
				 	if (shortwall < 200)	// If the wall is on the left, turn 90deg cw infront of wall.
				 		RT2P = shortwall - 100; 
				
				 	if (RT2P >= 400 && RT2P < 500 )	//calculate the correct turn in steppermotor steps
					{	
				 		RT2P = RT2P - 400;
						direction1 = 1;
					}
				 	if (RT2P >= 200 && RT2P < 400)
					{ 	
						RT2P = 400 - RT2P;
						RT2P = RT2P * -1;
						direction1 = 0;
					}
				 	if (RT2P < 200 && RT2P >= 0)
					{ 
						direction1 = 1;
					}
				 	if (RT2P < 0 && RT2P >= -200)
					{
						direction1 = 0;
					}
					if(RT2P < -200 || RT2P >500)	//an error has occured
					{
						break;
					}
 
					rotate((400 - shortwall ), CLOCKWISE); //IR sensor
					__delay_ms(100); 


					int RT2A= RT2P * (36.0/40.0);	//convert from steppermotor steps to degrees
					robotTurn(RT2A);
					__delay_ms(100);
					rotate(shortwall,CLOCKWISE);
					__delay_ms(100);
					robotMoveSpeed(500, DRIVESPEED);
				}		
		
				break;		
			
			case 5:		//Charge Mode
				ChargeMode();
				break;	
			default:
			
				break;
		}
		choice = 255;	//reset menu choice
	}
}


/************  calibrateIR  *************/
//User moves steppermotor to a zero position and sets this to zero
void calibrateIR(void)
{
	currentMenu = 1;	//switch display to Calibration menu
	rotate(8, CLOCKWISE); //initialise to a known winding
	while (1)
	{
		if (RTC_FLAG_250MS == 1)	//4Hz refresh rate for display
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
			case LEFT: 						//half step counterclockwise
				rotate(1, COUNTERCLOCKWISE); 
				buttonPressed = 0;	
				break;
			case RIGHT:						//half step Clockwise
				rotate(1, CLOCKWISE);
				buttonPressed = 0;
				break;		
			case CENTER:					//zero steppermotor and exit to menu
				totalSteps = 0;
				buttonPressed = 0;
				currentMenu = 0;
				return;
			default:						//should not get here
				break;
		}
	}
}

/************  ChargeMode  *************/
//Put robot into passive mode so it can charge the battery
void ChargeMode(void)
{
	
	currentMenu = 2;	//switch display to charge mode menu
	ser_putch(128); //put in passive mode
		
	while (1)
	{
		if (RTC_FLAG_250MS == 1)	//4Hz refresh rate for display
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
				ser_putch(132); //put robot into full mode and exit to menu
				buttonPressed = 0;
				currentMenu = 0;
				return;
			default:
				buttonPressed = 0;
				break;
		}
	}
}

/************  scan360  *************/
//Do a 360 degree scan with the steppermotor and return the step value of the closest wall
int scan360(void)
{
	int lowestVal = 0, lowestSteps = 0;

	for (int steps = 0; steps < 200; steps+= 2) //step through 360 degrees
	{
		readAvgDistance();
		if (adcVal > lowestVal)			//compare current value to lowest value (done using raw data to speed up process
		{
			lowestVal = adcVal;
			lowestSteps = steps;
			
		}
		rotate(2, COUNTERCLOCKWISE);	
			
		if (RTC_FLAG_250MS == 1)	//4Hz refresh rate for display
			{
				RTC_FLAG_250MS = 0;
				UpdateDisplay();
			}		
	} 

	return lowestSteps;
}
