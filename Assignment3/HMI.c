#include <htc.h>
#include "HMI.h"


#define PB_UP !RB2 //button 0 pin	
#define PB_DOWN !RB3 //button 1 pin	
#define PB_LEFT !RB4 //button 2 pin	
#define PB_RIGHT !RB5 //button 3 pin	
#define PB_CENTER !RB6 //button 4 pin	
#define DEBOUNCE_REQ_COUNT 10  //10ms debounce time

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
	
	if(UpPressed) //toggle LED0
	{
		UpPressed = 0;
		return 1;
	
	}

	if(DownPressed) // 2 half steps CounterClockwise
	{
		DownPressed = 0;
		return 2;
		
	}
		if(LeftPressed) // 2 half steps Clockwise
	{
		LeftPressed = 0;
		return 3;
		
	}
		if(RightPressed) //180 degree sweep (reverse direction each time button is pressed)
	{
		RightPressed = 0;
		return 4;
		
	}
	
	if(CenterPressed) //180 degree sweep (reverse direction each time button is pressed)
	{
		CenterPressed = 0;
		return 5;
		
	}
	return 0;
}

