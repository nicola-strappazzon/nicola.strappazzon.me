+++
weight = 7
title  = 'CDC - Communication Device Class'
+++

Se puede enviar y recibir datos desde al Microcontrolador por el puerto USB con el componente [CH340](https://nicola.strappazzon.me/electronic/integrated-circuit/ch340/) que permite la comunicación entre UART y USB, es algo muy útil para ampliar funcionalidades e incluso para "debugear" nuestro programa con mayor facilidad.

```C
#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>

static inline void USART1_init_115200(void) {
    PORTC.DIRSET = PIN0_bm;
    PORTC.DIRCLR = PIN1_bm;
    USART1.BAUD = (64UL * F_CPU) / (16UL * 115200UL) + 0.5;
    USART1.CTRLC = USART_CMODE_ASYNCHRONOUS_gc |
                   USART_CHSIZE_8BIT_gc;
    USART1.CTRLB = USART_TXEN_bm | USART_RXEN_bm;
}

static inline void USART1_write(char c) {
    while (!(USART1.STATUS & USART_DREIF_bm)) {;}
    USART1.TXDATAL = c;
}

static inline char USART1_read(void) {
    while (!(USART1.STATUS & USART_RXCIF_bm)) {;}
    return USART1.RXDATAL;
}

static inline void USART1_send_string(const char *s) {
    while (*s) {
        USART1_write(*s++);
    }
}

int main(void) {
    CCP = CCP_IOREG_gc;
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc;

    USART1_init_115200();
    USART1_send_string("[CDC] Start!\r\n");

    while (1) {
    	USART1_write(USART1_read());
    }
}
```
