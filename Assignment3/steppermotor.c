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

#define STEP_OFF 0b00111001 //all winding deenergised


#define		SELECT_NONE()	RC0 = 0; RC1 = 0;
#define		SELECT_EEPROM()	RC0 = 0; RC1 = 1;
#define		SELECT_RF()		RC0 = 1; RC1 = 0;
#define		SELECT_SM()		RC0 = 1; RC1 = 1;
#define 	SM_STEP()		RC2 = 1; NOP(); RC2 = 0;

#define CLOCKWISE 0
#define COUNTERCLOCKWISE 1



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
		if (direction)
			totalSteps++;
		else
			totalSteps--;
		__delay_ms(15);  //give motor time to respond
	}
	SELECT_SM();			// SPI select the Stepper M
	spi_transfer(0b00000000);	//de-energise windings		
	SELECT_NONE();
	SM_STEP();
}

