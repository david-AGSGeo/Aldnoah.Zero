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

//Global Variables


volatile unsigned char buttonPressed;   //stores button presses



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
    int shortwall = 0;              

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
               // shortwall = scan360();  //find the closest wall
               // rotate((200 - shortwall), CLOCKWISE);   //turn IR to face the closest wall
                
               //robotTurn(shortwall*36/40)
           		ser_putch(141); 

				ser_putch(0); 
                break;
            case 2:     //Drive forward 2 meters
               
                robotMoveSpeed(-200,-200);
                break;
            case 3:     //Drive in an L shape
 
                robotTurnSpeed(-70,400);
				__delay_ms(1000);
				robotTurnSpeed(-80,400);
				__delay_ms(1000);
				robotTurnSpeed(-90,400);
				__delay_ms(1000);
				robotTurnSpeed(-100,400);    //Left
                break;
            case 4:    
				Init_Follow_IR();
     			while (ROBOTerror != 1)
				{ 
                	switch (ROBOTerror)
					{
						case 0:
							readAvgDistance();
							robotFollow(200, adcVal);
						break;
						case 1:
							ROBOTerror = 1;
						break;
						case 2:
							ROBOTerror = 1;
						break;
						case 3:
								ROBOTerror = 0;
								RobotDrive(-200, 0x7FFF);
								__delay_ms(1000);
								robotMoveSpeed(-200,-200);
								robotTurnSpeed(-angleTurned,400);    //straighten up
								robotMoveSpeed(300,200);	//move forward to sense next wall
								readAvgDistance();
								robotFollow(200, adcVal - 10);
						break;
						case 10: // ahead blocked, turn left
							//robotMoveSpeed(700,200);
							robotTurnSpeed(80,400);    //Left
							
							readAvgDistance();
							robotFollow(200, adcVal - 10);
						break;
						case 11://right free, turn right
						
							rotate(25, CLOCKWISE);
							readAvgDistance();
							robot_turnRight(200, adcVal);
							rotate(25, COUNTERCLOCKWISE);
							readAvgDistance();
							robotFollow(200, adcVal);
							//RightTurn();
							//__delay_ms(1000);
							//robotMoveSpeed(700,200);
							//__delay_ms(1000);
							//robotTurnSpeed(-80,400);  
							
							//__delay_ms(1000);
							//robotMoveSpeed(100,200);
							//__delay_ms(1000);  
							//readAvgDistance();
							//robotFollow(200, adcVal - 10);
						break;
						default:
							readAvgDistance();
							robotFollow(200, adcVal);
						break;

					}
				}
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

void RightTurn(void)
{
	rotate(25, CLOCKWISE);
	readAvgDistance();
	robot_turnRight(200, adcVal);
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

/************  scan360  *************/
//Do a 360 degree scan with the steppermotor and return the step value of the closest wall
int scan360(void)
{
    int lowestVal = 0, lowestSteps = 0;

    for (int steps = 0; steps < 200; steps+= 2) //step through 360 degrees
    {
        readAvgDistance();
        if (adcVal > lowestVal)         //compare current value to lowest value (done using raw data to speed up process
        {
            lowestVal = adcVal;
            lowestSteps = steps;
            
        }
        rotate(2, COUNTERCLOCKWISE);    
            
        if (RTC_FLAG_250MS == 1)    //4Hz refresh rate for display
            {
                RTC_FLAG_250MS = 0;
                UpdateDisplay();
            }       
    } 

    return lowestSteps;
}

