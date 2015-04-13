#include <htc.h>
#include <stdio.h>
#include "infrared.h"
#include "adc.h"
#include "lcd.h"

#define NUMREADS 10 //number of adc reads to average for IR sensor

unsigned int readAvgDistance(void)
{
	unsigned int fullval = 0, averageval;
	char adcOutput[16] = "";
	
	for (int i = 0; i < NUMREADS; i++)
{
	fullval += adc_read_channel(0);
	
}
	averageval = fullval / NUMREADS;
	sprintf(adcOutput,"Adc Value: %d", averageval);
	//lcd_set_cursor(0x00);
	//lcd_write_control(0b00000001); //clear display
	//lcd_write_string(adcOutput);
	return averageval;
}

unsigned int readDistance(void)
{
	unsigned int fullval ;

	char adcOutput[16] = "";

	fullval = adc_read_channel(0); //channel 0 not reading properly?
	//lcd_write_control(0b00000001); //clear display
	sprintf(adcOutput,"Adc Value: %d", fullval);
	lcd_set_cursor(0x00);
	lcd_write_string(adcOutput);
	lcd_set_cursor(0x40);
	lcd_write_3_digit_bcd(fullval);
	return fullval;
}

void ADCconvert(unsigned int adcVal)
{
	char adcOutput[16] = "";
	unsigned int distance;
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

	

	lcd_write_control(0b00000001); //clear display
	sprintf(adcOutput,"Distance: %dcm", distance);
	lcd_set_cursor(0x40);
	
	lcd_write_string(adcOutput);
}
