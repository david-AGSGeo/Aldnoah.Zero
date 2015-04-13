#ifndef INFRARED_H
#define INFRARED_H

#include <htc.h>



unsigned int readDistance(void);
unsigned int readAvgDistance(void);
void ADCconvert(unsigned int adcVal);


#endif 