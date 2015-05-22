/**************  HMI.h   *****************/

#ifndef HMI_H
#define HMI_H

#include <htc.h>

volatile unsigned char currentMenu = 0;

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

#define Debounce()\
		if(PB_UP)\
		{\
			UpDebounceCount++; \
			if(UpDebounceCount >= DEBOUNCE_REQ_COUNT & UpReleased)\
			{\
				UpPressed = 1;			\
				UpReleased = 0;\
			}\
		}\
		else\
		{\
			UpDebounceCount = 0;\
			UpReleased = 1;\
		}\
		if(PB_DOWN)\
		{\
			DownDebounceCount++;\
			if(DownDebounceCount >= DEBOUNCE_REQ_COUNT & DownReleased)\
			{\
				DownPressed = 1;			\
				DownReleased = 0;\
			}\
		}\
		else\
		{\
			DownDebounceCount = 0;\
			DownReleased = 1;\
		}\
		if(PB_LEFT)\
		{\
			LeftDebounceCount++;\
			if(LeftDebounceCount >= DEBOUNCE_REQ_COUNT & LeftReleased)\
			{\
				LeftPressed = 1;			\
				LeftReleased = 0;\
			}\
		}\
		else\
		{\
			LeftDebounceCount = 0;\
			LeftReleased = 1;\
		}\
		if(PB_RIGHT)\
		{\
			RightDebounceCount++;\
			if(RightDebounceCount >= DEBOUNCE_REQ_COUNT & RightReleased)\
			{\
				RightPressed = 1;			\
				RightReleased = 0;\
			}\
		}\
		else\
		{\
			RightDebounceCount = 0;\
			RightReleased = 1;\
		}\
		if(PB_CENTER)\
		{\
			CenterDebounceCount++;\
			if(CenterDebounceCount >= DEBOUNCE_REQ_COUNT & CenterReleased)\
			{\
				CenterPressed = 1;			\
				CenterReleased = 0;\
			}\
		}\
		else\
		{\
			CenterDebounceCount = 0;\
			CenterReleased = 1;\
		}\




unsigned char ReadButtons(void);
unsigned char Menu(unsigned char input);
void UpdateDisplay(void);
int Disp1, Disp2;

#endif 