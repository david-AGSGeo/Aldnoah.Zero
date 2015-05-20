/********************************  HMI.c  **************************************
	Group Name: Aldnoah.Zero
	
	Contains the Human Machine Interface  																 
																				 
	 Authors 		 Student No.		Email
----------------------------------------------------------------------------------
	David Lee  		 11055579 			David@lee42.com 
	James Bohm		 11195839			JimmyBohm@gmail.com			
    Jose  Gunawarman 11784271			jose.adhitya@gmail.com
	Navi  Gunaratne  11434305			11434305@student.uts.edu.au   			
	John  Lim		 12050326			john.lim@hotmail.com								 
																				 
**********************************************************************************/

#include <htc.h>
#include <stdio.h>
#include "HMI.h"
#include "lcd.h"
#include "infrared.h"
#include "robot.h"

//button direction assignments
#define UP 1
#define DOWN 2
#define LEFT 3
#define RIGHT 4
#define CENTER 5

//pin assignments for the buttons
#define PB_UP !RB2 //button 0 pin	
#define PB_DOWN !RB3 //button 1 pin	
#define PB_LEFT !RB4 //button 2 pin	
#define PB_RIGHT !RB5 //button 3 pin	
#define PB_CENTER !RB6 //button 4 pin	
#define DEBOUNCE_REQ_COUNT 10  //10ms debounce time

#define MENULEFT 0x40
#define MENUCENTER 0x44
#define MENURIGHT 0x4D

#define MENUITEMS 6  //number of items on the menu: change if items added or removed

//menu position
int pos = 0;


//display strings for the main menu
const char* menuStrings[] = {"Calib_IR", "Scan_360", "Drive_2m", "Drive_L", "Flw_Wall", " Charge "}; 
const char* shortMenuStrings[] = {"Cal", "Scn", "Dr2", "DrL", "Flw", "Chg"};

//set up debounce variables 
volatile bit UpPressed = 0;
volatile bit UpReleased = 0;
volatile unsigned char UpDebounceCount = 0;

volatile bit DownPressed = 0;
volatile bit DownReleased = 0;
volatile unsigned char DownDebounceCount = 0;

volatile bit LeftPressed = 0;
volatile bit LeftReleased = 0;
volatile unsigned char LeftDebounceCount = 0;

volatile bit RightPressed = 0;
volatile bit RightReleased = 0;
volatile unsigned char RightDebounceCount = 0;

volatile bit CenterPressed = 0;
volatile bit CenterReleased = 0;
volatile unsigned char CenterDebounceCount = 0;


/************  Debounce  *************/
//debounces the buttons
void Debounce(void)
{
		//Debounce PB0
		if(PB_UP)
		{
			UpDebounceCount++; //count 10 ms, and then wait for release 
			if(UpDebounceCount >= DEBOUNCE_REQ_COUNT & UpReleased)
			{
				UpPressed = 1;			
				UpReleased = 0;
			}
		}
		else	//button has been released
		{
			UpDebounceCount = 0;
			UpReleased = 1;
		}

		//Debounce PB1
		if(PB_DOWN)
		{
			DownDebounceCount++;
			if(DownDebounceCount >= DEBOUNCE_REQ_COUNT & DownReleased)
			{
				DownPressed = 1;			
				DownReleased = 0;
			}
		}
		else
		{
			DownDebounceCount = 0;
			DownReleased = 1;
		}
		//Debounce PB2
		if(PB_LEFT)
		{
			LeftDebounceCount++;
			if(LeftDebounceCount >= DEBOUNCE_REQ_COUNT & LeftReleased)
			{
				LeftPressed = 1;			
				LeftReleased = 0;
			}
		}
		else
		{
			LeftDebounceCount = 0;
			LeftReleased = 1;
		}
		//Debounce PB3
		if(PB_RIGHT)
		{
			RightDebounceCount++;
			if(RightDebounceCount >= DEBOUNCE_REQ_COUNT & RightReleased)
			{
				RightPressed = 1;			
				RightReleased = 0;
			}
		}
		else
		{
			RightDebounceCount = 0;
			RightReleased = 1;
		}
		//Debounce PB3
		if(PB_CENTER)
		{
			CenterDebounceCount++;
			if(CenterDebounceCount >= DEBOUNCE_REQ_COUNT & CenterReleased)
			{
				CenterPressed = 1;			
				CenterReleased = 0;
			}
		}
		else
		{
			CenterDebounceCount = 0;
			CenterReleased = 1;
		}
}

/************  ReadButtons  *************/
// read and debounce the buttons, and return the button that is pressed
unsigned char ReadButtons(void)
{
	
	Debounce();
	
	if(UpPressed) 
	{
		UpPressed = 0;
		return UP;
	
	}

	if(DownPressed) 
	{
		DownPressed = 0;
		return DOWN;
		
	}
		if(LeftPressed) 
	{
		LeftPressed = 0;
		return LEFT;
		
	}
		if(RightPressed) 
	{
		RightPressed = 0;
		return RIGHT;
		
	}
	
	if(CenterPressed) 
	{
		CenterPressed = 0;
		return CENTER;
		
	}
	return 0;// no button pressed
}

/************  Menu  *************/
//move the menu positions based on the button pressed 
unsigned char Menu(unsigned char BTN_input)
{
	switch (BTN_input)
		{
			case UP:
			
			break;
			case DOWN:
			
			break;
			case LEFT:
			pos--;
			if (pos < 0)
				pos = MENUITEMS - 1;
				
			break;
			case RIGHT:
			pos++;		
			if (pos == MENUITEMS)
				pos = 0;	
			
			break;
			case CENTER:
			return pos;	//return the selected menu item position
			

			default:
			
			break;
		}
	return 255; //no choice selected
}

/************  UpdateDisplay  *************/
//draw the display based on the current menu selected
void UpdateDisplay(void)
{
	char LCDOutput[16] = "";				
	switch (currentMenu)		//which Menu are we on
	{
		case 0: //main menu
			lcd_write_control(0b00000001); //clear display	
			sprintf(LCDOutput,"IR:%dcm D:%d",Disp1, Disp2);
			lcd_set_cursor(0x00);	
			lcd_write_string(LCDOutput);				
			lcd_set_cursor(MENULEFT);	
			if (pos > 0)
				lcd_write_string(shortMenuStrings[pos - 1]);
			else
				lcd_write_string(shortMenuStrings[pos + MENUITEMS - 1]);
			lcd_set_cursor(MENUCENTER);	
			lcd_write_string(menuStrings[pos]);
			lcd_set_cursor(MENURIGHT);	
			lcd_write_string(shortMenuStrings[(pos + 1) % MENUITEMS]);
			break;
		case 1:	//calibration Menu
			lcd_write_control(0b00000001); //clear display	
			lcd_set_cursor(0x00);	
			lcd_write_string("Zero Step_Motor");
			lcd_set_cursor(MENULEFT);	
			lcd_write_string("<<<");
			lcd_set_cursor(MENUCENTER);	
			lcd_write_string("CONFIRM");
			lcd_set_cursor(MENURIGHT);	
			lcd_write_string(">>>");
			break;
		case 2:	//Charge Menu
			lcd_write_control(0b00000001); //clear display	
			lcd_set_cursor(0x00);	
			lcd_write_string(" Charging Mode ");
			lcd_set_cursor(MENULEFT);
			sprintf(LCDOutput,"%dmA", BattCharge);	
			lcd_write_string(LCDOutput);
			lcd_set_cursor(MENURIGHT);	
				switch(BattState)
				{
					case 0:
						lcd_write_string("NC");
						break;
					case 1:
						lcd_write_string("RC");
						break;
					case 2:
						lcd_write_string("FC");
						break;
					case 3:
						lcd_write_string("TC");
						break;
					case 4:
						lcd_write_string("Wa");
						break;
					case 5:
						lcd_write_string("FC");
						break;
				}
				
			lcd_set_cursor(MENUCENTER);	
			lcd_write_string("  EXIT  ");
			break;
		default:	//unknown menu	
			break;	
	}
}

