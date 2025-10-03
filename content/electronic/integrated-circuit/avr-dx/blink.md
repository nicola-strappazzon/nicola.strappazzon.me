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

## Tercera forma:

Usaremos el `timer/counter A (TCA)` para lograr el mismo efecto, esta funcionalidad **NO** tiene acceso al pin `PA6`, pero sí al pin `PA0`. No se usa la estructura `while`, ni tampoco la función `_delay_ms`. Los tiempos se calculan, ya lo verás.

```C
#include <avr/io.h>

int main(void) {
    // Configure internal clock:
    CCP = CCP_IOREG_gc;                         // Disable Configuration Change Protected register.
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc; // Configure to 24Mhz.

    // Configure LED on PA0:
    PORTA.DIRSET = PIN0_bm;

    // Configure timer/counter A:
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_FRQ_gc | TCA_SINGLE_CMP0EN_bm;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV1024_gc | TCA_SINGLE_ENABLE_bm;
    TCA0.SINGLE.CMP0 = 23436;

    while (1) {}
}
```

Si buscamos encender durante un segundo y apagar durante otro segundo, esto quiere decir que es una frecuencia de 0.5Hz, por lo que el período es de 2 segundos, cada 1/2 ciclo ó semiperíodo equivale a un segundo. Cómo ambos semiperíodo duran el mismo tiempo se dice que tiene duty del 50%.

{{< mathjax "freq=\frac{1}{t}=\frac{1}{2}=0.5Hz" >}}

Si observas el código, verás un parámetro llamado `TCA_SINGLE_CLKSEL_DIV1024_gc` que define un preescalado de `1024`. Y tu reloj interno está configurado a 24MHz (24.000.000 Hz). Con los valores identificados y con la siguiente fórmula podrás calcular el valor del comparador `TCA0.SINGLE.CMP0` para definir el tiempo de espera que permite generar la frecuencia deseada.

Cómo estamos usando el `timer/counter A` de varios que tiene el microcontrolador, este tiene una resolución de 16-bit, quiere decir que el contador va desde el `0` hasta `65535 (2{{< sup "16">}} − 1)`. Cada vez que se cuenta, hay un comparador `CMP0` que verifica si el valor es igual al definido `23436` y al cumplir la condición el contador vuelve a cero (0).

Ahora que tenemos todo el contexto, necesitamos que el contador se reinicie cada medio ciclo (semiperíodo):

{{< mathjax "CMP0=\frac{f_{CPU}}{2 \cdot prescaler \cdot freq} - 1=\frac{24000000}{2 \cdot 1024 \cdot 0.5Hz}≈23436" >}}

Para comprobar los cálculos:

{{< mathjax "f_{out}=\frac{f_{CPU}}{2 \cdot prescaler \cdot (CMP0+1)}=\frac{24000000}{2 \cdot 1024 \cdot (23436+1)}≈0.5_{Hz}" >}}

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
