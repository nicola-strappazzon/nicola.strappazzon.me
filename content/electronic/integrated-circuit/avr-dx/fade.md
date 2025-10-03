+++
title = 'Efecto fade, un blink con PWM'
+++

Este es una forma de hacer un [blink](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/blink/) con un efecto de encendido y apagado suave y transitorio, es bonito y relajante. Para lograrlo, debemos hacer uso del `timer/counter` que genera una frecuencia de tipo [PWM (Pulse Width Modulation)](https://en.wikipedia.org/wiki/Pulse-width_modulation) y es más complejo que él [ejemplo anterior](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/blink/) pero es una base esencial para hacer muchas más cosas.

![](minimal.png)

{{% blockquote type="note" %}}
Cómo dato curioso, el PWM entre las múltiples utilidades que tiene, se usa en las linternas o lámparas con bombillas LED para ahorrar energía o controlar el nivel de luminosidad.
{{% /blockquote %}}

Los siguientes ejemplos no hacen uso del mismo pin que tratamos en este ejemplo del [blink](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/blink/) porque el `timer/counter A (TCA)` no tiene acceso al pin `PA6`, pero sí al `PA0` entre otros.

## Primera forma:

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

    // Configure LED on PA0:
    PORTA.DIRSET = PIN0_bm;

    // Select mode Single Slope PWM:
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_SINGLESLOPE_gc | TCA_SINGLE_CMP0EN_bm;
    TCA0.SINGLE.PER   = 255;                    // Resolución de 8 bits (0..255)
    TCA0.SINGLE.CMP0  = 0;                      // Duty cycle inicial (apagado)
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

{{< mathjax "f_{PWM}=\frac{f_{CPU}}{prescaler \cdot (PER + 1)}=\frac{24000000}{64 \cdot (255 + 1)}=1464_{Hz}" >}}

## Segunda forma:

```C
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdbool.h>
#include <stdint.h>

static volatile uint8_t pwm = 0;
static volatile bool up = true;

ISR(TCA0_OVF_vect){
  pwm += up ? 1 : -1;
  if (pwm == 0xff)
    up = false;
  else if (pwm == 0x00)
    up = true;

  TCA0.SINGLE.CMP0 = pwm;
  TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
}

int main(void){
  // Configure internal clock:
  CCP = CCP_IOREG_gc;                         // Disable Configuration Change Protected register.
  CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc; // Configure to 24Mhz.

  // Configurar PA0 como salida:
  PORTA.DIRSET        = PIN0_bm;

  // Configuramos el PWM:
  TCA0.SINGLE.CTRLB   = TCA_SINGLE_WGMODE_SINGLESLOPE_gc | TCA_SINGLE_CMP0EN_bm;
  TCA0.SINGLE.PER     = 255;                  // Resolución de 8 bits (0..255)
  TCA0.SINGLE.CMP0    = 0;                    // Inicia en 0
  TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;    // Habilita OVF
  TCA0.SINGLE.CTRLA   = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;

  sei();

  while(1){}
}
```
