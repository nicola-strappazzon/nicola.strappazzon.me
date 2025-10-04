+++
weight = 6
title = 'DAC'
+++

[Using 10-Bit DAC for Generating Analog Signals](TB3235-DAC.pdf)

![](minimal.png)

![](logicanalyzer01.png)

```C
#include <avr/io.h>
#include <util/delay.h>
#include <math.h>

/* VREF start-up time */
#define VREF_STARTUP_TIME (50)
/* Mask needed to get the 2 LSb for DAC Data Register */
#define LSB_MASK (0x03)
/* Number of samples for a sine wave period */
#define SINE_PERIOD_STEPS (100)
/* Sine wave amplitude */
#define SINE_AMPLITUDE (511)
/* Sine wave DC offset */
#define SINE_DC_OFFSET (512)
/* Frequency of the sine wave */
#define SINE_FREQ (100)
/* Step delay for the loop */
#define STEP_DELAY_TIME ((1000000 / SINE_FREQ) / SINE_PERIOD_STEPS)

static void sineWaveInit(void);
static void triangleWaveInit(void);
static void VREF_init(void);
static void DAC0_init(void);
static void DAC0_setVal(uint16_t value);

/* Buffer to store the sine wave samples */
uint16_t sineWave[SINE_PERIOD_STEPS];

static void sineWaveInit(void) {
    uint8_t i;
    for(i = 0; i < SINE_PERIOD_STEPS; i++) {
        sineWave[i] = SINE_DC_OFFSET + SINE_AMPLITUDE * sin(2 * M_PI * i / SINE_PERIOD_STEPS);
    }
}

static void triangleWaveInit(void) {
    for (uint8_t i = 0; i < SINE_PERIOD_STEPS; i++) {
        double phase = (double)i / SINE_PERIOD_STEPS;  // 0.0 -> 1.0

        double tri;
        if (phase < 0.5)
            tri = 2.0 * phase;         // sube 0 -> 1
        else
            tri = 2.0 * (1.0 - phase); // baja 1 -> 0

        sineWave[i] = SINE_DC_OFFSET + SINE_AMPLITUDE * (2.0 * tri - 1.0);
        // (2*tri -1) centra la onda entre -1 y +1, como el seno
    }
}

static void sawtoothWaveInit(void) {
    for (uint8_t i = 0; i < SINE_PERIOD_STEPS; i++) {
        // sube de 0 -> 1 linealmente a lo largo de todo el ciclo
        double phase = (double)i / SINE_PERIOD_STEPS;
        sineWave[i] = SINE_DC_OFFSET + SINE_AMPLITUDE * (2.0 * phase - 1.0);
    }
}

static inline void clk_init(void){
    _PROTECTED_WRITE(CLKCTRL.OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLA,  CLKCTRL_CLKSEL_OSCHF_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLB,  0);
}

static void VREF_init(void) {
    /* Select the 2.048V Internal Voltage Reference for DAC */
    VREF.DAC0REF = VREF_REFSEL_2V048_gc | VREF_ALWAYSON_bm; /* Set the Voltage Reference in Always On mode */
    /* Wait VREF start-up time */
    _delay_us(VREF_STARTUP_TIME);
}

static void DAC0_init(void) {
    /* Disable digital input buffer */
    PORTD.PIN6CTRL &= ~PORT_ISC_gm;
    PORTD.PIN6CTRL |= PORT_ISC_INPUT_DISABLE_gc;

    /* Disable pull-up resistor */
    PORTD.PIN6CTRL &= ~PORT_PULLUPEN_bm;
    DAC0.CTRLA = DAC_ENABLE_bm /* Enable DAC */
    | DAC_OUTEN_bm /* Enable output buffer */
    | DAC_RUNSTDBY_bm; /* Enable Run in Standby mode */
}

static void DAC0_setVal(uint16_t value) {
    /* Store the two LSbs in DAC0.DATAL */
    DAC0.DATAL = (value & LSB_MASK) << 6;
    /* Store the eight MSbs in DAC0.DATAH */
    DAC0.DATAH = value >> 2;
}

int main(void) {
    uint8_t sineIndex = 0;

    clk_init();
    VREF_init();
    DAC0_init();

    // sineWaveInit();
    // triangleWaveInit();
    sawtoothWaveInit();

    while (1) {
        DAC0_setVal(sineWave[sineIndex++]);
        if(sineIndex == SINE_PERIOD_STEPS)
        sineIndex = 0;
        _delay_us(STEP_DELAY_TIME);
    }
}
```
