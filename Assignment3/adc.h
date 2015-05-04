/**************  adc.h   *****************/

#ifndef ADC_H
#define ADC_H

#include <htc.h>


void init_adc(void);

unsigned int adc_read(void);


unsigned char adc_read_channel(unsigned char channel);

#endif 