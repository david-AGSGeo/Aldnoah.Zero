//#include "io_config.h"
#include "AT25256A.h"
#include <htc.h>

void ee_write_byte( unsigned int byte_address, unsigned char data)
{
	unsigned char addressH;
	unsigned char addressL;
	unsigned char temp;
	
	addressL = byte_address & 0x00FF;
	addressH = (byte_address >> 8) & 0x00FF;
	
	ee_write_enable();
	
	EEPROM_SPI_ENABLE();
	
	SSPIF = 0;
	SSPBUF = AT25XXXA_WRITE;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);
	temp = SSPBUF;
	
	SSPIF = 0;
	SSPBUF = addressH;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);
	temp = SSPBUF;

	SSPIF = 0;
	SSPBUF = addressL;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);
	temp = SSPBUF;
		
	SSPIF = 0;
	SSPBUF = data;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);	
	temp = SSPBUF;
	
	SSPIF = 0;
	EEPROM_SPI_DISABLE();
}

unsigned char ee_read_byte (unsigned int byte_address)
{
	unsigned char addressH;
	unsigned char addressL;
	unsigned char temp;
	
	addressL = byte_address & 0x00FF;
	addressH = (byte_address >> 8) & 0x00FF;
	
	EEPROM_SPI_ENABLE();
	
	SSPIF = 0;
	SSPBUF = AT25XXXA_READ;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);
	temp = SSPBUF;
	
	SSPIF = 0;
	SSPBUF = addressH;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);
	temp = SSPBUF;
	
	SSPIF = 0;
	SSPBUF = addressL;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);	
	temp = SSPBUF;

	SSPIF = 0;
	SSPBUF = 0x00;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);	
	temp = SSPBUF;
		
	SSPIF = 0;
	EEPROM_SPI_DISABLE();
	
	return temp;
}

void ee_write_enable(void)
{
	unsigned char temp;
	
	EEPROM_SPI_ENABLE();
	asm ("nop");
	asm ("nop");
	asm ("nop");
	
	SSPIF = 0;
	SSPBUF = AT25XXXA_WREN;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);
	temp = SSPBUF;
	
	SSPIF = 0;
	EEPROM_SPI_DISABLE();
}

void ee_write_disable(void)
{
	unsigned char temp;
	
	EEPROM_SPI_ENABLE();
	asm ("nop");
	asm ("nop");
	asm ("nop");
	
	SSPIF = 0;
	SSPBUF = AT25XXXA_WRDI;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);
	temp = SSPBUF;
	
	SSPIF = 0;
	EEPROM_SPI_DISABLE();
}

unsigned char ee_read_status (void)
{
	unsigned char temp=0;
	
	EEPROM_SPI_ENABLE();
	asm ("nop");
	asm ("nop");
	asm ("nop");
	
	SSPIF = 0;
	SSPBUF = AT25XXXA_RDSR;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);
	temp = SSPBUF;
	
	SSPIF = 0;
	SSPBUF = 0x00;
	asm ("nop");
	asm ("nop");
	asm ("nop");
	while (SSPIF == 0);
	temp = SSPBUF;
	
	SSPIF = 0;
	EEPROM_SPI_DISABLE();	
	
	return temp;
}
