#include <htc.h>
#include <stdio.h>
#include "infrared.h"
#include "adc.h"
#include "lcd.h"

#define NUMREADS 10 //number of adc reads to average for IR sensor

void readAvgDistance(void)
{
	unsigned int fullval = 0; 
	
	
	for (int i = 0; i < NUMREADS; i++)
{
	fullval += readDistance();
	
}
	adcVal = fullval / NUMREADS;
	ADCconvert();
}

unsigned int readDistance(void)
{
	unsigned int fullval ;

	fullval = adc_read_channel(0); 
	
	return fullval;
}

void ADCconvert(void)
{	
//No room for error included
//Errors evolve with increasing distance
// limited to voltage range: 0.5<v<0.75, 
// corresponding distance range: 0.15m<dist<1.3m

if (adcVal >= 2.5 && adcVal < 2.75)
	{
		distance = 15 + ((20-15)*(2.75-adcVal))/(20-15);
	}	
	else if (adcVal >= 2 && adcVal < 2.5)
	{
		distance = 20 + ((30-20)*(2.5-adcVal))/(30-20);
	}
	else if (adcVal >= 1.5 && adcVal < 2)
	{
		distance = 30 + ((40-30)*(2-adcVal))/(40-30);
	}	
	else if (adcVal >= 1.25 && adcVal < 1.5)
	{
		distance = 40 + ((50-40)*(1.5-adcVal))/(50-40);
	}	
	else if (adcVal >= 0.9 && adcVal < 1.25)
	{
		distance = 50 + ((60-50)*(1.25-adcVal))/(30-20);
	}	
	else if (adcVal >= 0.65 && adcVal < 0.9)
	{
		distance = 60 + ((70-60)*(0.9-adcVal))/(30-20);
	}	
	else if (adcVal >= 0.5 && adcVal < 0.65)
	{
		distance = 70 + ((80-70)*(0.65-adcVal))/(30-20);
	}
}
