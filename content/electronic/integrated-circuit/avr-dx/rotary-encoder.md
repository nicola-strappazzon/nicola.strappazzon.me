+++
title = 'Rotary Encoder'
+++

![](breadboard.png)

A continuación muestro un diagrama esquemático:

![](schematic.png)

Conexion:

- PA0: PWM out LED
- PD1: Encoder A
- PD2: Encoder B

## Código fuente

```C
#include <avr/io.h>
#include <util/delay.h>
#include <stdint.h>

int main(void) {
    CCP = CCP_IOREG_gc;
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc;

    /* TCA0 single-slope PWM on PA0, F_PWM = 24M/(64*256) ≈ 1.46 kHz */
    PORTA.DIRSET      = PIN0_bm;
    TCA0.SINGLE.PER   = 255;
    TCA0.SINGLE.CMP0  = 0;
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_SINGLESLOPE_gc | TCA_SINGLE_CMP0EN_bm;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;

    /* Encoder pins as inputs with internal pull-ups */
    PORTD.DIRCLR   = PIN1_bm | PIN2_bm;
    PORTD.PIN1CTRL = PORT_PULLUPEN_bm;
    PORTD.PIN2CTRL = PORT_PULLUPEN_bm;

    uint8_t brightness = 0;
    uint8_t prev_a = (PORTD.IN & PIN1_bm) != 0;

    while (1) {
        uint8_t a = (PORTD.IN & PIN1_bm) != 0;
        if (prev_a && !a) {                              /* falling edge of A */
            uint8_t b = (PORTD.IN & PIN2_bm) != 0;
            if (b) brightness = (brightness <= 245) ? brightness + 10 : 255;
            else   brightness = (brightness >=  10) ? brightness - 10 : 0;
            TCA0.SINGLE.CMP0 = brightness;
        }
        prev_a = a;
        _delay_ms(1);                                    /* simple debounce */
    }
}
```

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

Si todo fue bien, podrá disfrutar del rotary encoder y el LED.
