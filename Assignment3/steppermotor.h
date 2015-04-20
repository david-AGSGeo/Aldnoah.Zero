#ifndef STEPPERMOTOR_H
#define STEPPERMOTOR_H

#include <htc.h>

unsigned char spi_transfer(unsigned char data);
void rotate(unsigned char steps, unsigned char direction);
void rotateOld(unsigned char steps, unsigned char direction);


#endif 