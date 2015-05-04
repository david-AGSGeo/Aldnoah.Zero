#include <htc.h>
#include <stdio.h>
#include "infrared.h"
#include "adc.h"
#include "lcd.h"

#define NUMREADS 8 //number of adc reads to average for IR sensor

void readAvgDistance(void)
{
	unsigned int fullval = 0, tempIR = 0; 
	int j = 0;
	
	for (int i = 0; i < NUMREADS; i++)
{
	tempIR = readDistance();
	if (tempIR <= 1000)	
		{
			fullval += tempIR;
			j++;
		}
}
	adcVal = fullval / j;
	ADCconvert();
}

unsigned int readDistance(void)
{
	unsigned int readVal ;

	readVal = adc_read_channel(0); 
	
	return readVal;
}

void ADCconvert(void)
{	
//No room for error included
//Errors evolve with increasing distance
// limited to voltage range: 0.5<v<0.75, 
// corresponding distance range: 0.15m<dist<1.3m

if (adcVal >= 213 && adcVal < 234)
	{
		IRdistance = 15 + ((20-15)*(234-adcVal))/(234-213);
	}	
	else if (adcVal >= 170 && adcVal < 213)
	{
		IRdistance = 20 + ((30-20)*(213-adcVal))/(213-170);
	}
	else if (adcVal >= 128 && adcVal < 170)
	{
		IRdistance = 30 + ((40-30)*(170-adcVal))/(170-128);
	}	
	else if (adcVal >= 107 && adcVal < 128)
	{
		IRdistance = 40 + ((50-40)*(128-adcVal))/(128-107);
	}	
	else if (adcVal >= 77 && adcVal < 107)
	{
		IRdistance = 50 + ((60-50)*(107-adcVal))/(107-77);
	}	
	else if (adcVal >= 56 && adcVal < 77)
	{
		IRdistance = 60 + ((70-60)*(77-adcVal))/(77-56);
	}	
	else if (adcVal >= 43 && adcVal < 56)
	{
		IRdistance = 70 + ((80-70)*(56-adcVal))/(56-43);
	}
}
