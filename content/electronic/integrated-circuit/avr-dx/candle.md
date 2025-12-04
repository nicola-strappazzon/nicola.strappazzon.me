+++
weight = 6
title  = 'LED Candle'
+++

Este efecto convierte el LED en una vela, y me parece muy interesante porque usando lo que hemos aprendido en los dos anteriores efectos [blink](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/blink/) y [fade](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/fade/) más añadiendo funciones pseudoaleatorias podemos recrear el efecto de una vela.

![](minimal.png)

Para ir entendiendo vamos a ir desde lo más simple hasta lograr un efecto más real.

## Ejemplo simple:

En este primer caso encendemos y apagamos el LED usando el algoritmo [LFSR de Galois 8 bits](https://en.wikipedia.org/wiki/Linear-feedback_shift_register) (Linear Feedback Shift Register) para generar secuencias pseudoaleatorias muy rápidas y muy baratas en hardware. Utiliza el desplazamientos de bits a la izquierda `>>` (right shift) y la realimentación lineal `^` (XOR).

```C
#include <avr/io.h>
#include <util/delay.h>

#define LFSR_SEED 0x5B

static uint8_t lfsr(void) {
    static uint8_t cnt = LFSR_SEED;
    return (cnt = (cnt >> 1) ^ (-(cnt & 1) & 0xB4));
}

int main(void){
    CCP = CCP_IOREG_gc;
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc;

    PORTA.DIR |= PIN0_bm;

    while(1){
        if (lfsr() & 1) {
            PORTA.OUTSET = PIN0_bm;
        } else {
            PORTA.OUTCLR = PIN0_bm;
        }

        _delay_ms(64);
    }
}
```

## Ejemplo complejo:

Para este caso mantenemos el uso del algoritmo LFSR pero añadimos una condición más, no puede apagarse el LED, este debe hacer cómo un efecto fade + LFSR. Entonces para lograrlo debemos hacer uso del PWM.

```C
#include <avr/io.h>
#include <util/delay.h>

#define LFSR_SEED 0x5B

static uint8_t lfsr(void) {
    static uint8_t cnt = LFSR_SEED;
    return (cnt = (cnt >> 1) ^ (-(cnt & 1) & 0xB4));
}

int main(void){
    CCP = CCP_IOREG_gc;
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc;

    PORTA.DIR |= PIN0_bm;

    TCA0.SINGLE.PER = 255;
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_SINGLESLOPE_gc | TCA_SINGLE_CMP0EN_bm;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;

    while(1){
        TCA0.SINGLE.CMP0 = lfsr();
        _delay_ms(64);
    }
}
```

## Compilar y subirlo

Para compilarlo deberá ejecutar el siguiente comando:

```bash
avr-gcc -mmcu=avr128da28 \
	-DF_CPU=24000000UL \
	-g -Os -std=gnu99 -Wall -o main.elf *.c
avr-objcopy -O ihex  main.elf main.hex
```

Para subir el programa al microcontrolador, deberá ejecutar el siguiente comando:

```bash
avrdude -c serialupdi -p avr128da28 -P /dev/tty.usbserial-2110 -e -F
```

Si todo fue bien, podrá disfrutar de una velada.
