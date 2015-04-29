#ifndef ROBOT_H
#define ROBOT_H

#include <htc.h>

void robo_init(void);
void robotMove(int distance);
void robotTurn(int distance);

void robot_read(void);
int distTravelled = 0;
volatile unsigned char DistHighByte, DistLowByte, BumpSensors ;

unsigned char highByte = 0, lowByte = 0, turnhighByte = 0, turnlowByte = 0;
#endif 