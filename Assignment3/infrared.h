#ifndef INFRARED_H
#define INFRARED_H

#include <htc.h>

volatile unsigned int adcVal;
volatile unsigned int distance;

unsigned int readDistance(void);
void readAvgDistance(void);
void ADCconvert(void);


#endif 