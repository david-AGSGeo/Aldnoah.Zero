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

#define NUMREADS 8 //number of adc reads to average for IR sensor



void readAvgDistance(void)
{
	unsigned int fullval = 0, tempIR = 0;
	int j = 0;

	for (int i = 0; i < NUMREADS; i++)	// take the readings
	{
		tempIR = readDistance();
		if (tempIR <= 1000)	//ignore any spikes!
		{
			fullval += tempIR;	//add the readings together
			j++;
		}
	}
	adcVal = fullval / j;	//divide to get average

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

