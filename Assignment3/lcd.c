#include <htc.h>
#include "lcd.h"


//defines
//#define RS RE0			//LCD Register Select
//#define RW RE1			//LCD Read Write
//#define EN RE2			//LCD Enable
//#define LCD_DATA PORTD	//LCD data pins are connected to Port D
#define _XTAL_FREQ 20000000




//functions
//write controls to LCD
void lcd_write_control(unsigned char databyte)
{
	EN = 0;
	RW = 0;
	RS = 0;
	LCD_DATA = databyte;
	EN = 1;
	EN = 0;
	__delay_ms(2);
}

//write data to LCD
void lcd_write_data(unsigned char databyte)
{
	EN = 0;
	RW = 0;
	RS = 1;
	LCD_DATA = databyte;
	EN = 1;
	EN = 0;
	__delay_ms(1);
}

//move the LCD cursor to a particular location
void lcd_set_cursor(unsigned char address)
{
	address |= 0b10000000;		//format address command using mask
	lcd_write_control(address);	//write address command
}

void lcd_write_string(char * s)
{
	// write characters
	while(*s) lcd_write_data(*s++);
}

//function accepts char between 0 and 99 and writes it to lcd display in 2 digits
void lcd_write_2_digit_bcd(unsigned char data)
{
	unsigned char OnesDigit, TensDigit;

	//load number to be converted into OnesDigit and clear TensDigit
	OnesDigit = data;
	TensDigit = 0;

	//Perform a BCD Conversion	
	while (OnesDigit >= 10)
	{
		OnesDigit = OnesDigit - 10;
		TensDigit++;
	}
	
	lcd_write_data((unsigned char)TensDigit + 48);
	lcd_write_data((unsigned char)OnesDigit + 48);
}

void lcd_write_3_digit_bcd(unsigned int data)
{
	unsigned int OnesDigit, TensDigit, HundredsDigit;

	//load number to be converted into OnesDigit and clear TensDigit
	OnesDigit = data;
	TensDigit = 0;
	HundredsDigit = 0;

	//Perform a BCD Conversion	
	while (OnesDigit >= 10)
	{
		OnesDigit = OnesDigit - 10;
		TensDigit++;
	}
	while (TensDigit >= 10)
	{
		TensDigit -= 10;
		HundredsDigit++;
	}
	lcd_write_data((unsigned int)HundredsDigit + 48);
	lcd_write_data((unsigned int)TensDigit + 48);
	lcd_write_data((unsigned int)OnesDigit + 48);

}

//function initalises the LCD module - check that ADCON1 setting doesn't conflict
void lcd_init(void)
{


	//setup ADCON1 register to make PortE Digital
	ADCON1 = 0b00000010;	//left justified, PortE Digital, PortA Analogue


	PORTD = 0;				//set all pins on portd low
	PORTE = 0;				//set all pins on porte low

	TRISD = 0b00000000;		//set all pins to output
	TRISE = 0b00000000;		//set all pins to output

	//LCD Initialisation
	lcd_write_control(0b00000001); //clear display
	lcd_write_control(0b00111000); //set up display
	lcd_write_control(0b00001100); //turn display on
	lcd_write_control(0b00000110); //move to first digit
	lcd_write_control(0b00000010); //entry mode setup

}





