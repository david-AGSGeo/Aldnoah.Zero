#ifndef HMI_H
#define HMI_H

#include <htc.h>



unsigned char ReadButtons(void);
void Menu(unsigned char input);
void UpdateDisplay(void);


#endif 