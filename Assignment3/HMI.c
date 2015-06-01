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
			sprintf(LCDOutput,"IR:%3dcm D:%3d",Disp1, Disp2);
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
			sprintf(LCDOutput,"%dmA", BattCharge);	//display current charege in mA and current charging mode
			lcd_write_string(LCDOutput);
			lcd_set_cursor(MENURIGHT);	
				switch(BattState)
				{
					case 0:
						lcd_write_string("NC"); //not charging
						break;
					case 1:
						lcd_write_string("RC"); //rest charge (battery too hot for full charge)
						break;
					case 2:
						lcd_write_string("FC"); //full charge
						break;
					case 3:
						lcd_write_string("TC"); //trickle charge
						break;
					case 4:
						lcd_write_string("Wa"); //warning
						break;
					case 5:
						lcd_write_string("FC"); //fully charged?
						break;
				}
				
			lcd_set_cursor(MENUCENTER);	
			lcd_write_string("  EXIT  ");
			break;
		case 3: //Maze Navigation Menu
			lcd_write_control(0b00000001); //clear display	
			sprintf(LCDOutput,"IR:%3dcm CP:%3d",adcVal, RobotPos); //top line to display IR value (raw, and current checkpoint 
			lcd_set_cursor(0x00);	
			lcd_write_string(LCDOutput);				
			int tempDist = (TotalDistTravelled/ 10);			
	
			sprintf(LCDOutput,"D:%4dcm AT:%3d",tempDist, angleTurned);// dbottom line to display total dist travvelled and measured angle turned (for troubleshooting)
			lcd_set_cursor(MENULEFT);
			lcd_write_string(LCDOutput);
			break;
		default:	//unknown menu	
			break;	
	}
}

