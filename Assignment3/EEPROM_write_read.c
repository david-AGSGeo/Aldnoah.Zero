
#include <htc.h>
#include "AT25256A.h"
#include "lcd.h"


#if (_HTC_VER_MAJOR_ < 9 && _HTC_VER_MINOR_ < 81)
 __CONFIG(HS & WDTDIS & PWRTEN & BOREN & LVPDIS & DUNPROT & WRTEN & UNPROTECT);
#else
 __CONFIG(FOSC_HS &  WDTE_OFF & CP_OFF & BOREN_OFF & PWRTE_ON & WRT_OFF & LVP_OFF & CPD_OFF);
#endif


#define _XTAL_FREQ 20000000

void spi_init(void) {
	TRISC = 0b11010000; //3,5 out / chip select and SM_STEP
	SSPCON = 0b00100010;	
	SSPSTAT = 0b01000000;
}


void main(void) {
	
	spi_init();
	lcd_init();
	
	unsigned char data = 'A';
	unsigned int address = 0;
	
	while(1) {

		// write to eeprom
		ee_write_enable();
		ee_write_byte( address, data);
		ee_write_disable();

		// delay so we don't flood
		__delay_ms(300);
		
		// read eeprom
		unsigned char eeprom_data = ee_read_byte(address);

		
		lcd_set_cursor(0x40); // set the cursor
		lcd_write_data(eeprom_data); // write the read data on LCD
	}
}