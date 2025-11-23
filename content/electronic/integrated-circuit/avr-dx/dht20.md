+++
weight = 8
title  = 'DHT20'
+++

El sensor de temperatura y humedad [DHT20](datasheet.pdf) es el sucesor del mítico DHT11 entre sus variantes y es fabricado por [asair](https://asairsensors.com/product/dht20-sip-packaged-temperature-and-humidity-sensor/), opera entre 2.2V y 5.5V y usa el protocolo de comunicaciones I2C a diferencia de su antecesor que era un protocolo de un solo cable ("single-wire" o "single-bus"). Este sensor tiene una precisión típica de ±2 % de humedad relativa y ±0,3 °C a 20-80 % de humedad relativa y 20-60 °C. Internamente tiene un AHT20.

El fabricante [asair](https://es.aliexpress.com/store/1103421005) vende por [AliExpress](https://es.aliexpress.com/item/1005006503645001.html) el sensor a buen precio.

![](workspace.png)

Para este ejemplo vamos a leer los datos del sensor y enviarlos por CDC (Communication Device Class) para poder leerlos desde la terminal usando la tool [picocom](https://github.com/npat-efault/picocom). El microcontrolador AVR DA tiene varios I2C, pero en el mundo de Microchip no se dice I2C, sino [TWI (Two-Wire Interface)](http://localhost:1313/electronic/integrated-circuit/avr-dx/new-generation/TB3181.pdf), usaremos el `TWI0` y la dirección del TWI Slave es `0x38`.

![](schematic.png)

El código fuente:

```C
#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>

#define DHT20_ADDR        0x38
#define DHT20_CMD_STATUS  0x71
#define DHT20_CMD_MEASURE 0xAC

static inline void USART1_init_115200(void) {
    PORTC.DIRSET = PIN0_bm;
    PORTC.DIRCLR = PIN1_bm;
    USART1.BAUD = (64UL * F_CPU) / (16UL * 115200UL) + 0.5;
    USART1.CTRLC = USART_CMODE_ASYNCHRONOUS_gc |
                   USART_CHSIZE_8BIT_gc;
    USART1.CTRLB = USART_TXEN_bm | USART_RXEN_bm;
}

static inline void USART1_write(char c) {
    while (!(USART1.STATUS & USART_DREIF_bm)) {;}
    USART1.TXDATAL = c;
}

static inline void USART1_send_string(const char *s) {
    while (*s) {
        USART1_write(*s++);
    }
}

void TWI0_init_100kHz_24MHz(void) {
    TWI0.CTRLA = TWI_SDAHOLD_50NS_gc;
    TWI0.DUALCTRL = 0x00;
    TWI0.DBGCTRL  = TWI_DBGRUN_bm;
    TWI0.MBAUD = 115;
    TWI0.MSTATUS = TWI_RIF_bm | TWI_WIF_bm | TWI_CLKHOLD_bm |
                   TWI_RXACK_bm | TWI_ARBLOST_bm | TWI_BUSERR_bm |
                   TWI_BUSSTATE_IDLE_gc;
    TWI0.MCTRLA = TWI_ENABLE_bm;
}

bool TWI_write(uint8_t addr, uint8_t *data, uint8_t len) {
    TWI0.MADDR = (addr << 1) | 0;

    for (uint8_t i = 0; i < len; i++) {
        while (!(TWI0.MSTATUS & TWI_WIF_bm));

        if (TWI0.MSTATUS & (TWI_ARBLOST_bm | TWI_BUSERR_bm))
            return false;

        if (TWI0.MSTATUS & TWI_RXACK_bm)
            return false;

        TWI0.MDATA = data[i];
    }

    while (!(TWI0.MSTATUS & TWI_WIF_bm)) ;

    TWI0.MCTRLB = TWI_MCMD_STOP_gc;
    return true;
}

bool TWI_read(uint8_t addr, uint8_t *data, uint8_t len) {
    TWI0.MADDR = (addr << 1) | 1;

    for (uint8_t i = 0; i < len; i++) {
        while (!(TWI0.MSTATUS & TWI_RIF_bm));

        if (TWI0.MSTATUS & (TWI_ARBLOST_bm | TWI_BUSERR_bm))
            return false;

        data[i] = TWI0.MDATA;

        if (i < (len - 1)) {
            TWI0.MCTRLB = TWI_MCMD_RECVTRANS_gc;
        } else {
            TWI0.MCTRLB = TWI_ACKACT_NACK_gc | TWI_MCMD_STOP_gc;
        }
    }
    return true;
}

bool DHT20_init(void) {
    uint8_t cmd = DHT20_CMD_STATUS;
    uint8_t status;

    _delay_ms(200);

    if (!TWI_write(DHT20_ADDR, &cmd, 1))
        return false;

    if (!TWI_read(DHT20_ADDR, &status, 1))
        return false;

    if ((status & 0x18) != 0x18) {
        return false;
    }

    return true;
}

bool DHT20_read(float *temperature_c, float *humidity_rh) {
    uint8_t cmd[3] = { DHT20_CMD_MEASURE, 0x33, 0x00 };
    uint8_t buf[7];

    if (!TWI_write(DHT20_ADDR, cmd, 3))
        return false;

    _delay_ms(85);

    if (!TWI_read(DHT20_ADDR, buf, 7))
        return false;

    if (buf[0] & 0x80) {
        return false;
    }

    uint32_t raw_h =
        ((uint32_t)buf[1] << 12) |
        ((uint32_t)buf[2] << 4)  |
        ((uint32_t)buf[3] >> 4);

    uint32_t raw_t =
        (((uint32_t)buf[3] & 0x0F) << 16) |
        ((uint32_t)buf[4] << 8)           |
        ((uint32_t)buf[5]);

    *humidity_rh   = (raw_h * 100.0f) / 1048576.0f;
    *temperature_c = (raw_t * 200.0f) / 1048576.0f - 50.0f;

    return true;
}

int main(void) {
    float t, h;
    char  s[64];

    CCP = CCP_IOREG_gc;
    CLKCTRL.OSCHFCTRLA = CLKCTRL_FRQSEL_24M_gc;

    USART1_init_115200();
    TWI0_init_100kHz_24MHz();

    if (!DHT20_init()) {
        USART1_send_string("[DHT20] init FAILED\r\n");
        while (1) {;}
    }

    USART1_send_string("[DHT20] init OK\r\n");

    while (1) {
        if (DHT20_read(&t, &h)) {
            snprintf(s, sizeof(s),
                     "[DHT20] Temperature: %.1fC | Humidity: %.0f%%\r\n",
                     t, h);
            USART1_send_string(s);
        }

        _delay_ms(2000);
    }
}
```

En el código, en la función DHT20_read vemos que se hacen unos cálculos, estos están definidos en la página 11 del datasheet.

## Compilar y subirlo

Para compilarlo deberá ejecutar el siguiente comando:

```bash
avr-gcc -mmcu=avr128da28 \
    -DF_CPU=24000000UL \
    -g -Os -flto -Wextra -std=gnu99 -Wall \
    -fuse-linker-plugin -ffunction-sections -fdata-sections -fno-split-wide-types -mrelax \
    -Wl,-u,vfprintf -lprintf_flt -lm -o main.elf *.c
avr-objcopy -O ihex  main.elf main.hex
```

{{% blockquote type="note" %}}
Deberá activar el soporte `printf` con floats usando: `-Wl,-u,vfprintf -lprintf_flt -lm`.
{{% /blockquote %}}

Para subir el programa al microcontrolador, deberá ejecutar el siguiente comando:

```bash
avrdude -c serialupdi -p avr128da28 -P /dev/tty.usbserial-2110 -e -F
```

Si todo fue bien, podrá disfrutar de las ondas.

## Terminal

Puede usar un cliente serial que prefiera, yo en este caso uso [picocom](https://github.com/npat-efault/picocom) para manipular el pin que controla el RTS, use el siguiente comando:

```bash
picocom --lower-rts -b 115200 /dev/tty.usbserial-2110
```

Usamos 115200 BAUD.

Si todo va bien, podrá observar lo que envia el microcontrolador:

![](terminal.png)

Para salir picocom debe precionar la siguiente combinación de teclas `CRTL+A` seguido de `x`.
