/**************  AT25256A.h   *****************/

#include <htc.h>

#define AT25XXXA_WREN	0b00000110
#define AT25XXXA_WRDI	0b00000100
#define AT25XXXA_RDSR	0b00000101
#define AT25XXXA_WRSR	0b00000001
#define AT25XXXA_READ	0b00000011
#define AT25XXXA_WRITE	0b00000010

static volatile bit CS0 @ (unsigned)&PORTC*8+0;
static volatile bit CS1 @ (unsigned)&PORTC*8+1;

#define EEPROM_SPI_ENABLE()	CS0 = 0; CS1 = 1;
#define EEPROM_SPI_DISABLE()	CS0 = 0; CS1 = 0;

unsigned char ee_read_status (void);
void ee_write_disable(void);
void ee_write_enable(void);
unsigned char ee_read_byte (unsigned int);
void ee_write_byte( unsigned int, unsigned char);
