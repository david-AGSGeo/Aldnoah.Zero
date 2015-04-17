/*********************************************************************************
	Description: Controls stepper motor from debounced buttons
				 Button 1 - 4 steps CW
				 Button 2 - 4 steps CCW
				 Button 3 - 180 degree rotation CW and CCW alternatively       			 
	Uses: DSX Experimenter board and SMPM																			 
	Connections: Port B0 - LED, Port B1-2 - push button1 to push button 3
				 Port C - stepper motor via the SMPM                																 
																				 
	Author: Buddhi Wijerathna                																 
																				 
**********************************************************************************/
#include <htc.h>


#if (_HTC_VER_MAJOR_ < 9 && _HTC_VER_MINOR_ < 81)
 __CONFIG(HS & WDTDIS & PWRTEN & BOREN & LVPDIS & DUNPROT & WRTEN & UNPROTECT);
#else
 __CONFIG(FOSC_HS &  WDTE_OFF & CP_OFF & BOREN_OFF & PWRTE_ON & WRT_OFF & LVP_OFF & CPD_OFF);
#endif

//Defines
//Osillator (Hz)
#define _XTAL_FREQ 20000000

#define TMR0_VAL 100	//timer0 start count
#define STEPS180  48	//half steps for a 180 degree rotation


#define		SELECT_NONE()	RC0 = 0; RC1 = 0;
#define		SELECT_EEPROM()	RC0 = 0; RC1 = 1;
#define		SELECT_RF()		RC0 = 1; RC1 = 0;
#define		SELECT_SM()		RC0 = 1; RC1 = 1;
#define 	SM_STEP()		RC2 = 1; NOP(); RC2 = 0;
							

volatile unsigned int time_count;
volatile bit FLAG_500MS;

//Function prototypes
void init(void);
unsigned char spi_transfer(unsigned char data);



// Interrupt service routine
interrupt isr() 
{
	//Timer 1
	if(TMR0IF)
	{
		TMR0IF = 0;
		TMR0 = TMR0_VAL;

		time_count++;

		if(time_count % 10 == 0) 
		{
			//FLAG_10MS = 1;
			time_count = 0;	//reset RTC Counter
			SM_STEP();
		}
			
	}
}




void init(void)
{
	//PortB 
	TRISB =  0b00001110;
	TRISC &= 0b10010000;			//set pin 6 to output for USART TX, pins for SPI and CS pins

	SSPSTAT = 0b01000000;
	SSPCON = 0b10100001; 

	//timer0
	OPTION_REG = 0b00000100;
	//enable timer0 interrupt
	TMR0IE = 1;

	//Enable all interrupts
	ei();
}

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

void main(void)
{

	//initialise function
	init();

	//Loop forever
while(1)
	{

	__delay_ms(50);           	// delay not to flood the channel  
	SELECT_SM();			// SPI select the Stepper M
	spi_transfer(0b00001111);	//for clockwise rotation 
	SELECT_NONE();			//release the SPI channel
	}
}
