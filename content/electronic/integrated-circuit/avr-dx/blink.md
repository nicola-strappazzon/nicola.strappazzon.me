+++
title = 'Mi primer programa (Blink)'
+++

Creo que es un programa clásico hacer el efecto Blink, equivale al “Hola Mundo” en los microcontroladores, se puede hacer de varias formas, te mostraré cada una, algunas son fáciles y otras más complejas, pero todas llegan a lo mismo. Este es el esquema del circuito que será necesario:

![](minimal.png)

## Primera forma:

El siguiente código es para un blink indicando el encendido y el apagado del pin.

```C
#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    // Configure internal clock:
    CCP = CCP_IOREG_gc;                         // Disable Configuration Change Protected register.
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc; // Configure to 24Mhz.

    // Configure LED on PA6:
    PORTA.DIRSET = PIN6_bm;

    while (1) {
        PORTA.OUTSET = PIN6_bm;
        _delay_ms(1000);

        PORTA.OUTCLR = PIN6_bm;
        _delay_ms(1000);
    }
}
```

## Segunda forma:

Podemos mejorar el código haciendo uso de un registro especial llamado `OUTTGL` que hace de toggle:

```C
#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    // Configure internal clock:
    CCP = CCP_IOREG_gc;                         // Disable Configuration Change Protected register.
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc; // Configure to 24Mhz.

    // Configure LED on PA6:
    PORTA.DIRSET = PIN6_bm;

    while (1) {
        PORTA.OUTTGL = PIN6_bm;
        _delay_ms(1000);
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

Si todo fue bien, podrá disfrutar del led parpadeando.

## Troubleshooting

Si al usar `avrdude` para compilar aparece el siguiente mensaje de error:

```
avr-gcc: fatal error: cannot read spec file 'device-specs/specs-avr128da28': No such file or directory
```

Posiblemente, no tengas instalada la versión más resiente que incorpora las librerías de la familia AVR Dx.
