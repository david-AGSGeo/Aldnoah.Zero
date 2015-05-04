#include <htc.h>
#include <stdio.h>
#include "HMI.h"
#include "lcd.h"
#include "infrared.h"
#include "robot.h"
#include <limits.h>

#define UP 1
#define DOWN 2
#define LEFT 3
#define RIGHT 4
#define CENTER 5


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
		else
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

unsigned char ReadButtons(void)
{
	
	Debounce();
	
	if(UpPressed) 
	{
		UpPressed = 0;
		return 1;
	
	}

	if(DownPressed) 
	{
		DownPressed = 0;
		return 2;
		
	}
		if(LeftPressed) 
	{
		LeftPressed = 0;
		return 3;
		
	}
		if(RightPressed) 
	{
		RightPressed = 0;
		return 4;
		
	}
	
	if(CenterPressed) 
	{
		CenterPressed = 0;
		return 5;
		
	}
	return 0;
}

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
			return pos;
			

			default:
			
			break;
		}
	return 255; //no choice selected
}



void UpdateDisplay(void)
{
	char adcOutput[16] = "";				
	switch (currentMenu)
		{

						case 0: //main menu
					
				
				lcd_write_control(0b00000001); //clear display	
				
				sprintf(adcOutput,"ADC:%d Dist:%d",BumpSensors, distTravelled);
			//	sprintf(adcOutput,"ADC:%d Dist:%d",highByte, lowByte);
				
				lcd_set_cursor(0x00);	
				lcd_write_string(adcOutput);				
				
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
				sprintf(adcOutput,"ADC:%d Dist:%d",BumpSensors, distTravelled);
				lcd_set_cursor(0x00);	
				lcd_write_string("Zero Step_Motor");
								
				
								//lcd_set_cursor(MENULEFT);	
				//lcd_write_string("                    ");
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
								


				lcd_set_cursor(MENUCENTER);	
				lcd_write_string("  EXIT  ");

			break;
			case 3:	//Straight Line
				lcd_write_control(0b00000001); //clear display	
				sprintf(adcOutput,"AS:%dDT:%d",assignedSpeed, distTravelled);

				lcd_set_cursor(0x00);	
				lcd_write_string(adcOutput);
								


				lcd_set_cursor(MENUCENTER);	
				lcd_write_string("  EXIT  ");

			break;

						case 4:	//Straight Line
				lcd_write_control(0b00000001); //clear display	
				sprintf(adcOutput,"D:%d D:%d",d2travel, distTravelled);

				lcd_set_cursor(0x00);	
				lcd_write_string(adcOutput);
								


				lcd_set_cursor(MENUCENTER);	
				lcd_write_string("  EXIT  ");

			break;
			default:
			break;
			

		}
}

