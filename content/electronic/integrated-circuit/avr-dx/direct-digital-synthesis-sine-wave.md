+++
draft = true
title = 'Direct Digital Synthesis (DDS) Sine Wave'
+++

![](minimal.png)

![](logicanalyzer01.png)

```C
#include <avr/io.h>
#include <avr/interrupt.h>
#include <math.h>

#define F_CPU 24000000UL
#define FS    100000u      // 50 kHz sample rate
#define LUT_N 100          // 50 samples -> 1 kHz

volatile uint8_t lut[LUT_N];
volatile uint8_t i_lut = 0;

static inline void clk_init(void){
    _PROTECTED_WRITE(CLKCTRL.OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLA,  CLKCTRL_CLKSEL_OSCHF_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLB,  0);
}

static void init_lut(void){
    for (uint8_t i=0;i<LUT_N;i++){
        double a = (2.0*M_PI*i)/LUT_N;
        lut[i] = (uint8_t)(127.5*(1.0 + sin(a))); // 0..255
    }
}

static void init_pwm_pf0(void){
    // 1) Routear TCA0 a PORTF (WO0=PF0)
    PORTMUX.TCAROUTEA = (PORTMUX.TCAROUTEA & ~PORTMUX_TCA0_gm) | PORTMUX_TCA0_PORTF_gc;

    // 2) PF0 como salida
    PORTF.DIRSET = PIN0_bm;

    // 3) TCA0 en Single Slope PWM, 8-bit (PER=255), habilitar WO0
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_SINGLESLOPE_gc | TCA_SINGLE_CMP0EN_bm;
    TCA0.SINGLE.PER   = 255;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV1_gc | TCA_SINGLE_ENABLE_bm; // 24 MHz base (PWM muy alta -> fácil filtrar)
}

static void init_sampler_isr(void){
    // TCB0 dispara ISR a 50 kHz -> actualiza duty
    TCB0.CCMP = (F_CPU/FS) - 1;                 // 24e6 / 50e3 - 1 = 479
    TCB0.CTRLA = TCB_CLKSEL_DIV1_gc | TCB_ENABLE_bm;
    TCB0.INTCTRL = TCB_CAPT_bm;
}

ISR(TCB0_INT_vect){
    TCA0.SINGLE.CMP0BUF = lut[i_lut];
    if (++i_lut >= LUT_N) i_lut = 0;
    TCB0.INTFLAGS = TCB_CAPT_bm;
}

int main(void){
    clk_init();
    init_lut();
    init_pwm_pf0();
    init_sampler_isr();
    sei();
    while(1){}
}
```
