+++
weight = 7
title = 'DAC'
+++

{{% blockquote type="note" %}}
Sigo trabajando en mejorar y terminar el artículo. De momento esta incompleto.
{{% /blockquote %}}

Un buzzer no funciona ya que es para PWM, debes usar un altavoz / speaker de 8Ω por lo menos.

[Using 10-Bit DAC for Generating Analog Signals](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/new-generation/TB3235-DAC.pdf)

![](minimal.png)

![](logicanalyzer01.png)

```C
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <math.h>

#define LSB_MASK   0x03
#define WAVE_STEPS 100     // número de muestras por ciclo
#define WAVE_FREQ  261     // frecuencia final de la onda (Hz)
#define DAC_MAX    1023

#define F_ISR   (WAVE_STEPS * WAVE_FREQ)  // Hz de la ISR

/* Selección de prescaler para TCB: DIV1 o DIV2 (AVR-DA) */
#if   ((F_CPU / 1) / F_ISR) - 1 <= 0xFFFF
  #define TCB_CLKSEL   TCB_CLKSEL_DIV1_gc
  #define TCB_CCMP     (uint16_t)((F_CPU / 1 / F_ISR) - 1)
#elif ((F_CPU / 2) / F_ISR) - 1 <= 0xFFFF
  #define TCB_CLKSEL   TCB_CLKSEL_DIV2_gc
  #define TCB_CCMP     (uint16_t)((F_CPU / 2 / F_ISR) - 1)
#endif

uint16_t wave[WAVE_STEPS];
volatile uint8_t waveIndex = 0;

static void sineWave(void) {
    for (uint8_t i = 0; i < WAVE_STEPS; i++) {
        double x = 2.0 * M_PI * i / WAVE_STEPS;
        wave[i] = (uint16_t)(512 + (511 * sin(x))); // 0–1023
    }
}

static void triangleWave(void) {
    uint16_t half = WAVE_STEPS / 2;
    for (uint8_t i = 0; i < WAVE_STEPS; i++) {
        if (i < half)
            wave[i] = (uint16_t)(DAC_MAX * ((double)i / half));
        else
            wave[i] = (uint16_t)(DAC_MAX * (1.0 - ((double)(i - half) / half)));
    }
}

static void sawtoothWave(void) {
    for (uint8_t i = 0; i < WAVE_STEPS; i++) {
        wave[i] = (uint16_t)(DAC_MAX * ((double)i / WAVE_STEPS));
    }
}

static inline void clk_init(void){
    _PROTECTED_WRITE(CLKCTRL.OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLA,  CLKCTRL_CLKSEL_OSCHF_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLB,  0);
}

static void vref_init(void) {
    VREF.DAC0REF = VREF_REFSEL_2V048_gc | VREF_ALWAYSON_bm;
    _delay_us(50); // Wait VREF start-up time.
}

static void dac_init(void) {
    PORTD.PIN6CTRL = PORT_ISC_INPUT_DISABLE_gc;  // deshabilita entrada digital
    DAC0.CTRLA = DAC_ENABLE_bm | DAC_OUTEN_bm;   // salida PD6 activa
}

static void dac_set(uint16_t value) {
    DAC0.DATAL = (value & LSB_MASK) << 6;
    DAC0.DATAH = value >> 2;
}

static void tcb0_init(void) {
    TCB0.CCMP = TCB_CCMP;
    TCB0.CTRLA = TCB_CLKSEL | TCB_ENABLE_bm;
    TCB0.INTCTRL = TCB_CAPT_bm;
}

ISR(TCB0_INT_vect) {
    dac_set(wave[waveIndex++]);
    if (waveIndex >= WAVE_STEPS)
        waveIndex = 0;
    TCB0.INTFLAGS = TCB_CAPT_bm;
}

int main(void) {
    clk_init();
    vref_init();
    dac_init();

    sineWave();
    // triangleWave();
    // sawtoothWave();
    tcb0_init();

    sei();

    while (1) {}
}
```
