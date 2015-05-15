/********************************  steppermotor.c  **************************************
	Group Name: Aldnoah.Zero
	
	Contains routines for moving the steppermotor   																 
																				 
	 Authors 		 Student No.		Email
----------------------------------------------------------------------------------
	David Lee  		 11055579 			David@lee42.com 
	James Bohm		 11195839			JimmyBohm@gmail.com			
    Jose  Gunawarman 11784271			jose.adhitya@gmail.com
	Navi  Gunaratne  11434305			11434305@student.uts.edu.au   			
	John  Lim		 12050326			john.lim@hotmail.com								 
																				 
**********************************************************************************/

#include <htc.h>
#include "steppermotor.h"
#include "AT25256A.h"


#define _XTAL_FREQ 20000000  //Oscillator (20MHz)
//define stepping sequence

#define STEP0 0b00111100 
#define STEP1 0b00101110 
#define STEP2 0b00101011 
#define STEP3 0b00100111 
#define STEP4 0b00110101 
#define STEP5 0b00010111 
#define STEP6 0b00011011 
#define STEP7 0b00011110

#define STEP_OFF 0b00111001 //all winding deenergised


#define		SELECT_NONE()	RC0 = 0; RC1 = 0;
#define		SELECT_EEPROM()	RC0 = 0; RC1 = 1;
#define		SELECT_RF()		RC0 = 1; RC1 = 0;
#define		SELECT_SM()		RC0 = 1; RC1 = 1;
#define 	SM_STEP()		RC2 = 1; NOP(); RC2 = 0;

#define CLOCKWISE 0
#define COUNTERCLOCKWISE 1

char current_step = STEP0;		//stores current step

/************  spi_transfer  *************/
//send a char over the SPI
unsigned char spi_transfer(unsigned char data)
{
	unsigned char temp = 0;

	SSPIF = 0;
	SSPBUF = data;

	while (SSPIF == 0);
	temp = SSPBUF;
	SSPIF = 0;

	return temp;
}

/************  rotate  *************/
//rotate the steppermotor x half steps in the chosen direction
void rotate(unsigned int numsteps, unsigned char direction)
{

	SELECT_SM();			// SPI select the Stepper M
	if (direction == 0)
		spi_transfer(0b00001011);	//for clockwise rotation 
	else
		spi_transfer(0b00001001);	//for counter-clockwise rotation 		
	SELECT_NONE();
	for (unsigned int i = 0; i < numsteps; i++)
	{
		SM_STEP();
		__delay_ms(15);  //give motor time to respond
	}
	SELECT_SM();			// SPI select the Stepper M
	spi_transfer(0b00000000);	//de-energise windings		
	SELECT_NONE();
	SM_STEP();
}

void rotateDirectional(unsigned int numsteps)
{
	if(numsteps < 0)
	{	
		numsteps = numsteps * -1;
		rotate(numsteps, 0);
	}
}