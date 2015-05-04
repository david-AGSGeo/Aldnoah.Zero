#ifndef ROBOT_H
#define ROBOT_H

#include <htc.h>

void robo_init(void);
void robotMove(int distance);
void robotMoveSpeed(int distance, int speed);
void robotTurn(int distance);
int abs(int v);

void robot_read(void);
int distTravelled;
volatile unsigned char DistHighByte, DistLowByte, BumpSensors ;

unsigned char highByte = 0, lowByte = 0, turnhighByte = 0, turnlowByte = 0;
#endif 