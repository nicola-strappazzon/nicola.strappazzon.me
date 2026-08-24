+++
weight = 4
title = 'Oscilador Interno'
+++

Configurar el oscilador interno es muy importante, por lo general yo lo dejo operando al máximo que es 24 MHz. Ten en cuenta que a mayor frecuencia mayor consumo, por ejemplo, a 4MHz puede consumo en torno a 1.5 mA usando 3.3V mientras si lo configuras para que vaya a 24MHz puede consumir en torno a 9 mA.

La siguiente documentación oficial te permite entender con mucho más detalles esta sección de configuración, te invito a revisarla: [Internal High-Frequency Oscillator Calibration Using the Auto-Tune Feature](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/new-generation/TB3234.pdf).

De momento hay dos formas de configurarlo y te muestro cada una, seguramente verás en mis notas una de estas formas. La variable que indica la velocidad es parecida a esta `CLKCTRL_FRQSEL_xx_gc` y te listo las opciones disponibles:

- CLKCTRL_FRQSEL_1M_gc
- CLKCTRL_FRQSEL_2M_gc
- CLKCTRL_FRQSEL_4M_gc
- CLKCTRL_FRQSEL_8M_gc
- CLKCTRL_FRQSEL_12M_gc
- CLKCTRL_FRQSEL_16M_gc
- CLKCTRL_FRQSEL_20M_gc
- CLKCTRL_FRQSEL_24M_gc

## Primera forma

Funciona igual que la segunda, pero mucho más corta:

```C
void clk_init(void) {
    CCP = CCP_IOREG_gc;                         // Disable Configuration Change Protected register.
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc; // Configure to 24Mhz.
}
```

## Segunda forma

Parece ser que esta es la forma recomendada de hacerlo:

```C
void clk_init(void) {
    _PROTECTED_WRITE(CLKCTRL.OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLA, CLKCTRL_CLKSEL_OSCHF_gc);
    _PROTECTED_WRITE(CLKCTRL.MCLKCTRLB, 0);
}
```
