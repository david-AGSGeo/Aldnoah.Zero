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
	
	if (adcVal > 250)
	{
		distance = 20;
	}
	else if (adcVal < 250 && adcVal >= 190)
	{
distance = 20+ (adcVal%100) ;
	}
	else if (adcVal < 190 && adcVal >= 96)
	{
		distance = 30+ (adcVal%100) ;
	}
else if (adcVal < 190 && adcVal >= 96)
	{
		distance = 40+ (adcVal%100) ;
	}
else if (adcVal < 115 && adcVal >= 96)
	{
		distance = 50+ (adcVal%100) ;
	}
else if (adcVal < 96 && adcVal >= 82)
	{
		distance = 60+ (adcVal%100) ;
	}
else if (adcVal < 82 && adcVal >= 70)
	{
		distance = 70+ (adcVal%100) ;
	}
else if (adcVal < 70 && adcVal >= 64)
	{
		distance = 80+ (adcVal%100) ;
	}
else if (adcVal < 64 && adcVal >= 56)
	{
		distance = 90+ (adcVal%100) ;
	}
else if (adcVal < 56 && adcVal >= 45)
	{
		distance = 100+ (adcVal%100) ;
	}
else if (adcVal < 45 && adcVal >= 40)
	{
		distance = 110+ (adcVal%100) ;
	}
else if (adcVal < 40 && adcVal >= 33)
	{
		distance = 120+ (adcVal%100) ;
	}
else if (adcVal < 33 )
	{
		distance = 130 + (adcVal%100) ;
	}

	

	//lcd_write_control(0b00000001); //clear display
	//lcd_set_cursor(0x00);
//	lcd_write_string("                ");
//	sprintf(adcOutput,"ADC:%d Dist:%d",adcVal, distance);
//	lcd_set_cursor(0x00);	
//	lcd_write_string(adcOutput);
}
