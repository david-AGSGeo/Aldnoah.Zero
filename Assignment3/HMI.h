#ifndef HMI_H
#define HMI_H

#include <htc.h>



unsigned char ReadButtons(void);
unsigned char Menu(unsigned char input);
void UpdateDisplay(void);


#endif 