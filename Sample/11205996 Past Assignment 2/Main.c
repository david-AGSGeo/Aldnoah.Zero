#include "initialise.h"

__CONFIG(FOSC_HS &  WDTE_OFF & CP_OFF & BOREN_OFF & PWRTE_ON & WRT_OFF & LVP_OFF & CPD_OFF);


#define _XTAL_FREQ 20000000  //Osillator (Hz)
#define TMR0_VAL 100	     //timer0 start count

#define LED0 RB0			//Interrupt LED

volatile bit RTC_FLAG_1MS = 0;
volatile bit RTC_FLAG_10MS = 0;
volatile bit RTC_FLAG_50MS = 0;
volatile bit RTC_FLAG_125MS = 0;
volatile bit RTC_FLAG_500MS = 0;



//global variables
volatile unsigned int RTC_Counter = 0;

// Interrupt service routine
void interrupt isr1(void) 
{
	//Timer 1
	if(TMR0IF)
	{
		TMR0IF = 0;
		TMR0 = TMR0_VAL;

		RTC_Counter++;
		//set clock flags
		RTC_FLAG_1MS = 1;
		if(RTC_Counter % 10 == 0) RTC_FLAG_10MS = 1;
		if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
		if(RTC_Counter % 125 == 0) RTC_FLAG_125MS = 1;
		if(RTC_Counter % 500 == 0) 
		{
			RTC_FLAG_500MS = 1;
			RTC_Counter = 0;	//reset RTC Counter
			LED0 ^= 0x01;
		}
	}
}

void infrared()
{
	double adcVals = 0;
	double total = 0;
	int i;
	i = 0;		

	while (RTC_FLAG_125MS == 0)
	{
		i++;
		total = total + adc_read_channel(0);
	}
	
	RTC_FLAG_125MS = 0;
	total = total/i;
	adcVals = total;
	
	total = total/202;

	
	
	if (total >= 2.5 && total < 3)
	{
		total = 20 - 20*(total - 2.5);
	}	
	else if (total >= 2 && total < 2.5)
	{
		total = 30 - 20*(total - 2);
	}
	else if (total >= 1.5 && total < 2)
	{
		total = 40 - 20*(total - 1.5);
	}	
	else if (total >= 1.25 && total < 1.5)
	{
		total = 50 - 40*(total - 1.25);
	}	
	else if (total >= 0.9 && total < 1.25)
	{
		total = 70 - 40*(total - 0.9);
	}	
	else if (total >= 0.65 && total < 0.9)
	{
		total = 100 - (30/0.25)*(total - 0.65);
	}	
	else if (total >= 0.5 && total < 0.65)
	{
		total = 140 - (40/0.15)*(total - 0.5);
	}	
	
	
	
	RTC_FLAG_500MS = 0;
	lcd_set_cursor(0);
	lcd_write_string("Distance: ");

	lcd_set_cursor(10);
	lcd_write_4_digit_bcd(total);

	lcd_set_cursor(0x40);
	lcd_write_string("ADC: ");

	lcd_set_cursor(0x4A);
	lcd_write_4_digit_bcd(adcVals);
}


void main(void)
{
	init();
	init_adc();
	lcd_init();

	while(1)
	{
		infrared();
	
	}
}