+++
title = 'Tonos y melodías'
+++

![](workspace.png)

Vamos a explicar desde cero cómo reproducir melodías usando tonos generados por un timer en un `AVR128DA28`. Los tonos serán reproducidor por un [buzzer o altavoz piezoeléctrico](https://en.wikipedia.org/wiki/Piezoelectric_speaker). Para eso vamos a estudiar en profundidad una melodía muy famosa que la usa [Arduino](https://docs.arduino.cc/built-in-examples/digital/toneMelody/) en su ejemplo. Te recomiendo mucho que uses un analizador lógico para no ir a ciegas.

Vamos a ir descomponiendo la melodía en notas y luego en tonos y así hasta llegar al código fuente que los genera. Es un ejemplo maravilloso donde se aplica ingeniería inversa, matemática y programación.

**¿Qué es una melodía?** Es una sucesión organizada de sonidos de diferentes alturas y duraciones, percibida como una sola entidad musical que desarrolla una idea. Los sonidos son representados por tonos.

Conectemos un analizador lógico (logic analyzer) a la salida del microcontrolador que reproduce dicha melodía para obtener una muestra de pulsos que se parecen a la siguiente imagen:

![](logicanalyzer01.png)

Estas son las notas y la duración de cada de la melodía. La primera línea son las notas, y la segunda los tiempos.

```
NOTE_C4, NOTE_G3, NOTE_G3, NOTE_A3, NOTE_G3, 0, NOTE_B3, NOTE_C4
4,       8,       8,       4,       4,       4, 4,       4
```

Si buscamos en la librería de tonos musicales que suele estar en un fichero llamado `pitches.h` obtenemos solo estas cuatro notas que conforman la melodía:

```
#define NOTE_G3  196
#define NOTE_A3  220
#define NOTE_B3  247
#define NOTE_C4  262
```

Tenemos a la mano toda la información para empezar a realizar los cálculos.

{{% blockquote type="note" %}}
Los valores decimales que se obtienen de los cálculos y los que se aprecian en las imágenes obtenidas por el analizador lógico no son exactos, hay un margen de error que se debe a múltiples factores.
{{% /blockquote %}}

Por ejemplo, la nota `G3` tiene el valor `196`, que corresponde a la frecuencia de 196 Hz.

![](logicanalyzer02.png)

Si observamos la imagen anterior, notamos que hay una serie de pulsos que los llamaremos `toggle`. Un `toggle` es un valor alto ó bajo, la cantidad de estos son `25` como se muestra en la imagen, y este valor se puede calcular usando la nota y el tiempo.

Volvamos analizar la nota `G3` que está acompañada de un tiempo con el valor `8` que equivale a una [corchea](https://es.wikipedia.org/wiki/Corchea) (jerga de la música), esto quiere decir, una duración de 1/8s es equivalente a `125ms`, en la imagen anterior está como `124,60`.

{{< mathjax "t_{ms}=\frac{1000}{8}=125_{ms}" >}}

{{< mathjax "toggles=\frac{2 \cdot f \cdot t_{ms}}{1000}=\frac{2 \cdot 196Hz \cdot 125_{ms}}{1000}=49" >}}

Como resultado tenemos `49` toggles que es equivalente a 24.5 períodos, si redondeamos son `25 períodos`. Todo empieza a encajar según lo que nos dice la imagen anterior.

Entre nota y nota se define un tiempo llamado pausa a partir de la siguiente formula:

{{< mathjax "t_{pause}=t_{ms} \cdot 0,30=125ms \cdot 0,30=37,5ms" >}}

El tiempo de la nota `G3` es `8` y aplicando la formula, obtenemos `37,5ms` como se muestra en la siguiente imagen:

![](logicanalyzer03.png)

Se han realizado los cálculos para la nota `G3`, estos pasos se debe repetir por cada nota hasta terminar la melodía. Hasta ahora se han identificado tres variables que son necesarias para poder programar; t{{< sub "ms">}}, t{{< sub "pause">}} y toggles.

Para crear los pulsos de la forma deseada para cada tono vamos a usar uno de los timer/counter de varios que tiene el microcontrolador junto a las interrupciones, en específico el `timer A (TCA)` que tiene una resolución de 16-bit, quiere decir que el contador va desde el `0` hasta `65535 (2{{< sup "16">}} − 1)`. Para entender su funcionamiento vamos a estudiar el modo `NORMAL` que es el que viene por defecto y es el más simple de comprender. Es importante saber que su funcionamiento y configuración es muy abstracto, por lo que voy a hacer el mejor esfuerzo al explicarlo.

{{% blockquote type="important" %}}
El reloj interno debe estar bien configurado a 24MHz.
{{% /blockquote %}}

<!-- counter -->
<!-- overflow -->
<!-- ISR -->

El **ejemplo 2.9** muestra el código de configuración del `timer/counter A (TCA)` en modo `NORMAL` en la [guia de migración](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/migration-from-megaAVR-to-AVR-Dx.pdf) que use para la función `tone(uint32_t freq, uint32_t dur)`.

```C
#include <avr/cpufunc.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdlib.h>
#include <util/delay.h>

#define NOTE_G3  196
#define NOTE_A3  220
#define NOTE_B3  247
#define NOTE_C4  262

static volatile uint32_t toggles = 0;

int melody[] = {
    NOTE_C4, 4, NOTE_G3, 8, NOTE_G3, 8, NOTE_A3, 4, NOTE_G3, 4, 0, 4, NOTE_B3, 4, NOTE_C4, 4
};

void clk_init(void) {
    _PROTECTED_WRITE(CLKCTRL.OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLA, CLKCTRL_CLKSEL_OSCHF_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLB, 0); 
}

void noTone(void) {
    TCA0.SINGLE.CTRLA = 0;
    PORTF.OUTCLR = PIN0_bm;
    toggles = 0;
}

void tone(uint32_t freq, uint32_t dur) {
    if (freq == 0 || dur == 0) return;

    cli();

    PORTF.DIRSET = PIN0_bm;
    VPORTF.OUT &= ~PIN0_bm;

    TCA0.SINGLE.INTCTRL  = TCA_SINGLE_OVF_bm;
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_NORMAL_gc;
    TCA0.SINGLE.EVCTRL &= ~(TCA_SINGLE_CNTAEI_bm);
    TCA0.SINGLE.PER = F_CPU / (16 * 2 * freq) - 1;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV16_gc | TCA_SINGLE_ENABLE_bm;

    toggles = (2 * freq * dur) / 1000;

    sei();
}

void pause(uint32_t ms) {
    while (ms--) _delay_ms(1);
}

int main(void) {
    clk_init();

    while (1) {
        int notes=sizeof(melody)/sizeof(melody[0])/2; 

        for (int thisNote = 0; thisNote < notes * 2; thisNote = thisNote + 2) {
            int duration = 1000 / melody[thisNote + 1];
            tone(melody[thisNote], duration);

            int pauseBetweenNotes = duration * 1.30;
            pause(pauseBetweenNotes);
        }
        _delay_ms(2000);
    }
}

ISR(TCA0_OVF_vect) {
    if (toggles-- > 0) {
        PORTF.OUT ^= PIN0_bm;
    } else {
        noTone();
    }

    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
}
```

Sigo trabajando en mejorar y terminar el artículo...
