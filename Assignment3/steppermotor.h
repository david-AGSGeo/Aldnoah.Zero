/**************  steppermotor.h   *****************/

#ifndef STEPPERMOTOR_H
#define STEPPERMOTOR_H

#include <htc.h>

unsigned char spi_transfer(unsigned char data);
void rotate(unsigned int numsteps, unsigned char direction);
void rotateOld(unsigned char steps, unsigned char direction);
int totalSteps = 0; //stores current steppermotor direction

#endif 