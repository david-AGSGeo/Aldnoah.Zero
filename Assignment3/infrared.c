/********************************  infrared.c  **************************************
	Group Name: Aldnoah.Zero
	
	Contains routines for reading the IR sensor   																 
																				 
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
#include "infrared.h"
#include "adc.h"
#include "lcd.h"
#include "HMI.h"

#define NUMREADS 7 //number of adc reads to average for IR sensor

/************  readAvgDistance  *************/
//takes a number of reads of the IR and stores the average in adcVal
void readAvgDistance(void)
{
	unsigned int fullval = 0, tempIR = 0;
	int j = 0;
	unsigned int values[NUMREADS];

	for (unsigned char i = 0; i < NUMREADS; i++)	// take the readings
	{
		values[i] = readDistance();
	}
    for (i = 0; i < n; ++i)
    {
        for (j = i + 1; j < n; ++j)
        {
            if (values[i] > values[j])
            {
                a =  values[i];
                values[i] = values[j];
                values[j] = a;
           }
        }
    }
	adcVal = values[NUMREADS/2];	//divide to get average
	ADCconvert();			//convert to distance in cm
	Disp1 = adcVal;
}

/************  readDistance  *************/
//returns the current adc value
unsigned int readDistance(void)
{
	unsigned int readVal;

	readVal = adc_read_channel(0);

	return readVal;
}

/************  ADCconvert  *************/
//converts the adcVal to a distance and stores it in IRdistance
void ADCconvert(void)
{
	//No room for error included
	//Errors evolve with increasing distance
	// limited to voltage range: 0.5<v<0.75, 
	// corresponding distance range: 0.15m<dist<1.3m

	if (adcVal >= 213 && adcVal < 234)
	{
		IRdistance = 15 + ((20 - 15)*(234 - adcVal)) / (234 - 213);
	}
	else if (adcVal >= 170 && adcVal < 213)
	{
		IRdistance = 20 + ((30 - 20)*(213 - adcVal)) / (213 - 170);
	}
	else if (adcVal >= 128 && adcVal < 170)
	{
		IRdistance = 30 + ((40 - 30)*(170 - adcVal)) / (170 - 128);
	}
	else if (adcVal >= 107 && adcVal < 128)
	{
		IRdistance = 40 + ((50 - 40)*(128 - adcVal)) / (128 - 107);
	}
	else if (adcVal >= 77 && adcVal < 107)
	{
		IRdistance = 50 + ((60 - 50)*(107 - adcVal)) / (107 - 77);
	}
	else if (adcVal >= 56 && adcVal < 77)
	{
		IRdistance = 60 + ((70 - 60)*(77 - adcVal)) / (77 - 56);
	}
	else if (adcVal >= 43 && adcVal < 56)
	{
		IRdistance = 70 + ((80 - 70)*(56 - adcVal)) / (56 - 43);
	}
}
