#include <stdio.h>

#define GPIO_BUTTONS_BASEADDRESS    0x80000000
#define GPIO_LEDS_BASEADDRESS       0x80000004
#define GPIO_SWITCHES_BASEADDRESS   0x80000008

#define GPIO_BUTTONS    (*(volatile unsigned int*)GPIO_BUTTONS_BASEADDRESS)
#define GPIO_LEDS       (*(volatile unsigned int*)GPIO_LEDS_BASEADDRESS)
#define GPIO_SWITCHES   (*(volatile unsigned int*)GPIO_SWITCHES_BASEADDRESS)


void main(void) {

    int i;

    for (i=0;i<10;i++) {
        GPIO_LEDS = i;
    }   

    GPIO_LEDS = 0x00000000;

    for (i=0;i<100;i++) {
        while (GPIO_BUTTONS == 0); // wait for button press
        GPIO_LEDS = GPIO_SWITCHES;
        while (GPIO_BUTTONS != 0); // wait for button release
    }

    GPIO_LEDS = 0xAAAAAAAA;
    while(1);
}
