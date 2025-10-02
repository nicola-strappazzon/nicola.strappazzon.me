+++
draft = true
title = 'Efecto fade, un blink con PWM'
+++

Este es una forma de hacer un [blink](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/blink/) con un efecto de encendido y apagado suave y transitorio, es bonito y relajante. Para lograrlo, debemos hacer uso del `timer/counter` que genera una frecuencia de tipo [PWM (Pulse Width Modulation)](https://en.wikipedia.org/wiki/Pulse-width_modulation) y es más complejo que él [ejemplo anterior](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/blink/) pero es una base esencial para hacer muchas más cosas.

```C
#include <avr/io.h>
#include <stdbool.h>
#include <util/delay.h>

int main(void) {
    uint8_t pwm = 0x00;
    bool up = true;

    // Configure internal clock:
    CCP = CCP_IOREG_gc;                         // Disable Configuration Change Protected register.
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc; // Configure to 24Mhz.

    // Configurar PA0 como salida
    PORTA.DIRSET = PIN0_bm;

    // Seleccionar modo Single Slope PWM
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_SINGLESLOPE_gc | TCA_SINGLE_CMP0EN_bm;

    // Frecuencia PWM: F_PWM = F_CPU / (PRESCALER * (PER + 1))
    // Ej: PER = 255 y PRESCALER = 64 → F_PWM ≈ 1464 Hz

    TCA0.SINGLE.PER = 255;           // Resolución de 8 bits
    TCA0.SINGLE.CMP0 = 0;            // Duty cycle inicial (apagado)

    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;

    while (1) {
        TCA0.SINGLE.CMP0 = pwm;

        pwm += up ? 1 : -1;
        if (pwm == 0xff)
            up = false;
        else if (pwm == 0x00)
            up = true;

        _delay_ms(10);
    }
}
```
