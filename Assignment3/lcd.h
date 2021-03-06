/**************  lcd.h   *****************/

#ifndef	LCD_H
#define LCD_H

#include <htc.h>


//defines
#define RS RE0			//LCD Register Select
#define RW RE1			//LCD Read Write
#define EN RE2			//LCD Enable
#define LCD_DATA PORTD	//LCD data pins are connected to Port D

#define _XTAL_FREQ 20000000

//write controls to LCD
void lcd_write_control(unsigned char databyte);

//write data to LCD
void lcd_write_data(unsigned char databyte);

//move the LCD cursor to a particular location
void lcd_set_cursor(unsigned char address);

void lcd_write_string(char * s);

//function accepts char between 0 and 99 and writes it to lcd display in 2 digits
void lcd_write_2_digit_bcd(unsigned char data);

//function initalises the LCD module - check that ADCON1 setting doesn't conflict
void lcd_init(void);

void lcd_write_3_digit_bcd(unsigned int data);

void LCD_display_distance(void);
int total;
int dist_high;
int dist_low;

#endif //LCD_H