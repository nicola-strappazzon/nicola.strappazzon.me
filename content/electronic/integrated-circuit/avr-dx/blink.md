+++
title = 'Mi primer programa (Blink)'
+++

Creo que un programa clásico es el Blink, equivale al "Hola Mundo" en los microcontroladores. Este es el esquema del circuito:

![](minimal.png)

El siguiente código es para un blink:

```C
#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN 6

int main(void) {
    // Configure internal clock:
    CCP = CCP_IOREG_gc;                         // Disable Configuration Change Protected register.
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc; // Configure to 24Mhz.

    // Configure LED on PC6:
    PORTA.DIRSET = (1 << LED_PIN);

    while (1) {
        PORTA.OUTSET = (1 << LED_PIN);
        _delay_ms(1000);

        PORTA.OUTCLR = (1 << LED_PIN);
        _delay_ms(1000);
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

{{% blockquote type="note" %}}
Dependiendo del sistema operativo que use, el path para llegar al pack será diferente.
{{% /blockquote %}}

Para subir el programa al microcontrolador, deberá ejecutar el siguiente comando:

```bash
avrdude -c serialupdi -p avr128da28 -P /dev/tty.usbserial-2110 -e -F
```

Si todo fue bien, podrá disfrutar del led parpadeando.

## Troubleshooting

Si al usar `avrdude` para compilar aparece el siguiente mensaje de error:

```
avr-gcc: fatal error: cannot read spec file 'device-specs/specs-avr128da28': No such file or directory
```

Posiblemente, no tiene instalada una de las últimas versiones de avrdude que incorpore las librerías de la familia AVR Dx.
