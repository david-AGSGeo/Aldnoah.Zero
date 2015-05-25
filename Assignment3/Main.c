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
                                                                                 
     Authors         Student No.        Email
-----------------------------------------------------------------------------------
    David Lee        11055579           David@lee42.com 
    James Bohm       11195839           JimmyBohm@gmail.com         
    Jose  Gunawarman 11784271           jose.adhitya@gmail.com
    Navi  Gunaratne  11434305           11434305@student.uts.edu.au             
    John  Lim        12050326           john.lim@hotmail.com                                 
                                                                                 
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
#define TMR0_VAL 100         //timer0 start count

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



//define robot parameters
#define DRIVESPEED 200

//Function Prototypes
void calibrateIR(void);
int scan360(void);
void ChargeMode(void);
void RightTurn(void);
void Init_Follow_IR(void);
void FindVictim(void);
void GoHome(void);


//Global Variables


volatile unsigned char buttonPressed;   //stores button presses
unsigned char FoundVictim = 0;

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
        TMR0IF = 0;     //reset interrupt flag
        TMR0 = TMR0_VAL;    //reset timer0 value
        
        RTC_Counter++;      //increase the count
        
        //set clock flags 
        RTC_FLAG_1MS = 1;           
        if(RTC_Counter % 250 == 0)      //EVERY 250ms
        {   
            RTC_FLAG_250MS = 1;     
        }
        if(RTC_Counter % 500 == 0)      //EVERY 500ms
        {
            RTC_FLAG_500MS = 1;
            HBLED ^= 0x01;      //toggle heartbeat LED
        }
        if (buttonPressed == 0) //if no button is waiting to be responded to
        {
            buttonPressed = ReadButtons();  //chech and debounce buttons
        }
    }
    ser_int();      //serial recieve and transmit interrupt macro                   
}

/************  init  *************/
//Initialisation Routine
void init()
{   
    buttonPressed = 0; //no buttons have been pressed   
    
    TRISB = 0b11111100; //PortB all inputs except pin 0 and 1
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
	followDir = RIGHTFLW; 
	RobotPos = 0; //STARTING NODE: should be 0 for final!
	currentMenu = 0;    //display main menu
    //initialise function
    init();
    robotLoadSong();
    //Loop forever
    while(1)
    {
        if (RTC_FLAG_250MS == 1)    //4Hz refresh rate for display, IR, and reading robot values
        {
            RTC_FLAG_250MS = 0;
            robot_read(ALL);
            readAvgDistance();
			Disp2 = RobotPos;
            UpdateDisplay();
        }
        if (buttonPressed)  //if a button has been debounced, perform the 
                            //appropriate menu action and wait for next button
        {
            choice = Menu(buttonPressed);
            buttonPressed = 0;
        }


        ////////  THIS IS THE MENU ITEM SELECTIONS  ///////
        switch (choice)
        {
            case 0:     //Calibrate IR  
                calibrateIR();
                break;
            case 1:     //Scan 360 degrees
             				RobotPos = 16; //STARTING NODE: start
           					Init_Follow_IR();
							GoHome();
                break;
            case 2:     //Drive forward 2 meters
               				RobotPos = 6; //STARTING NODE: checkpoint
                							ser_putch(141); 
				ser_putch(4);
                break;
            case 3:     //Drive in an L shape
 
                				RobotPos = 12; //STARTING NODE: bump
                break;
            case 4:    //-------------------NAVIGATE MAZE-----------------
				FoundVictim = 0;
				Init_Follow_IR();
				currentMenu = 3;    //switch display to Maze Navigation
     			FindVictim();
				if (FoundVictim)
					GoHome();
				ROBOTerror = 0;	//clear any errors
                break;      
            
            case 5:     //Charge Mode
                ChargeMode();
                break;  
            default:
            
                break;
        }
        choice = 255;   //reset menu choice
    }
}

void Init_Follow_IR(void)
{
	calibrateIR();
	__delay_ms(500);
	rotate(25, CLOCKWISE);
}

void GoHome(void)
{
	switch (RobotPos)
	{
		case 7:     //victim in first dead end
			robotTurnSpeed(175,ROBOTTURNSPEED); 
			break;  		
		case 15:     //victim in second dead end
			robotTurnSpeed(175,ROBOTTURNSPEED); 
			robot_turnArc(ROBOTSPEED); 
			break;  	
	}
	while (ROBOTerror != 9)
	{ 	
       	switch (ROBOTerror)
		{
			case 0:				
				readAvgDistance();
				robotFollow(ROBOTSPEED, adcVal);
				break;
			case 1:	//bump sensor

				ROBOTerror = 9;
				break;
			case 2:	//Virtual Wall
				ser_putch(141); 
				ser_putch(0);
				ROBOTerror = 9;
				break;
			case 3:	//cliff sensor
				ROBOTerror = 9;
				break;
			case 4:	///VICTIM FOUND!
				ROBOTerror = 0; //already found !!!
				break;
			case 9:
				break;
			case 10: // ahead blocked, turn left
				RobotPos++;
				if (followDir == LEFTFLW)
					robot_turnArc(ROBOTSPEED);
				if (followDir == RIGHTFLW)
					robot_turnInPlace();
				if (RobotPos == 17) //past checkpoint
				{
					trackingDist = TotalDistTravelled;
				}		
				if (RobotPos == 21) //HOME!!
				{
					break;
				}	
				readAvgDistance();
				robotFollow(ROBOTSPEED, adcVal - 10);
				break;
			case 11://right free, turn right
				RobotPos++;
			//	if (RobotPos == 19)
			//	{
			//		robotMoveSpeed(500, ROBOTSPEED);
			//		ROBOTerror = 0;
			//		break;
			//	}
				if (followDir == LEFTFLW)
					robot_turnInPlace();
				if (followDir == RIGHTFLW)
					robot_turnArc(ROBOTSPEED);
				readAvgDistance();
				robotFollow(ROBOTSPEED, adcVal);
				break;
			default:
				readAvgDistance();
				robotFollow(ROBOTSPEED, adcVal);
			break;
		}
	}
}

void FindVictim(void)
{
while (ROBOTerror != 9)
				{ 
					
                	switch (ROBOTerror)
					{
						case 0:
							
							readAvgDistance();
							robotFollow(ROBOTSPEED, adcVal);
						break;
						case 1:	//bump sensor
							if (RobotPos == 10) //low wall
							{
								RobotDrive(-200, 0x7FFF); //back up
								__delay_ms(200);
								RobotPos++;
								ROBOTerror = 0;
								robotTurnSpeed((-(angleTurned - 75)),ROBOTTURNSPEED);    //straighten up
							}
							else
								ROBOTerror = 9;
						break;
						case 2:	//Virtual wall
							ser_putch(141); 
							ser_putch(0);
							robotTurnSpeed((180),ROBOTTURNSPEED);   //turn around
							ROBOTerror = 0;
						break;
						case 3:	//cliff sensor
								RobotPos++;
								ROBOTerror = 0;
								
								__delay_ms(1000);
								robotMoveSpeed(-200,-ROBOTSPEED);
								robotTurnSpeed((-angleTurned-10),ROBOTTURNSPEED);    //straighten up
								robotMoveSpeed(250,ROBOTSPEED);	//move forward to sense next wall
								readAvgDistance();
								robotFollow(ROBOTSPEED, adcVal - 10);
						break;
						case 4:	///VICTIM FOUND!
							RobotDrive(200, 0x7FFF); 
							__delay_ms(1000);
							ser_putch(141); 
							ser_putch(4);
							RobotPos++;
							FoundVictim = 1;
							ROBOTerror = 9;
						break;
						case 9:
							ROBOTerror = 9;
						break;
						case 10: // ahead blocked, turn left
							ser_putch(141); 
							ser_putch(2);
							RobotPos++;
							robot_turnInPlace();				
							readAvgDistance();
							robotFollow(ROBOTSPEED, adcVal - 10);
						break;
						case 11://right free, turn right
							ser_putch(141); 
							ser_putch(2);
							RobotPos++;	
							robot_turnArc(ROBOTSPEED);
							readAvgDistance();
							robotFollow(ROBOTSPEED, adcVal);

						break;
						default:
							readAvgDistance();
							robotFollow(ROBOTSPEED, adcVal);
						break;

					}
				}
}


/************  calibrateIR  *************/
//User moves steppermotor to a zero position and sets this to zero
void calibrateIR(void)
{
    currentMenu = 1;    //switch display to Calibration menu
    rotate(8, CLOCKWISE); //initialise to a known winding
	rotate(8, COUNTERCLOCKWISE);
    while (1)
    {
        if (RTC_FLAG_250MS == 1)    //4Hz refresh rate for display
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
            case LEFT:                      //half step counterclockwise
                rotate(1, COUNTERCLOCKWISE); 
                buttonPressed = 0;  
                break;
            case RIGHT:                     //half step Clockwise
                rotate(1, CLOCKWISE);
                buttonPressed = 0;
                break;      
            case CENTER:                    //zero steppermotor and exit to menu
                
				totalSteps = 0;
                buttonPressed = 0;
                currentMenu = 0;
                return;
            default:                        //should not get here
                break;
        }
    }
}

/************  ChargeMode  *************/
//Put robot into passive mode so it can charge the battery
void ChargeMode(void)
{
    
    currentMenu = 2;    //switch display to charge mode menu
    ser_putch(128); //put in passive mode
        
    while (1)
    {
        if (RTC_FLAG_250MS == 1)    //4Hz refresh rate for display
            {
                RTC_FLAG_250MS = 0;
				RobotBattRead();
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



