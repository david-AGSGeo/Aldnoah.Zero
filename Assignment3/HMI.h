/**************  HMI.h   *****************/

#ifndef HMI_H
#define HMI_H

#include <htc.h>

volatile unsigned char currentMenu = 0;

unsigned char ReadButtons(void);
unsigned char Menu(unsigned char input);
void UpdateDisplay(void);
int Disp1, Disp2;

#endif 