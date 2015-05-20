/**************  robot.h   *****************/

#ifndef ROBOT_H
#define ROBOT_H

#include <htc.h>

void robo_init(void);

void RobotDrive(int speed, int radius);
void robotMove(int distance, int radius);
void robotMoveSpeed(int distance, int speed);
void robotTurn(int degrees);
void robotTurnSpeed(int angle, int speed);
void robotFollow(int speed, int AdcTarget);
void robot_turnRight(int speed, int AdcTarget);
void RobotBattRead(void);
int abs(int v);
void robotLoadSong(void);

void robot_read(unsigned char readType);
int distTravelled,angleTurned, TotalDistTravelled;
volatile unsigned char DistHighByte, DistLowByte, BumpSensors, AngleHighByte, AngleLowByte, VwallSensor, CliffSensors ;
unsigned int BattCharge = 0, BattState = 0;


unsigned char highByte = 0, lowByte = 0, turnhighByte = 0, turnlowByte = 0, ROBOTerror = 0;
#endif 