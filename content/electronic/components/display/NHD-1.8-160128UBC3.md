+++
title = 'OLED Display Module 1.8"'
+++

Hace tiempo me decanté por este módulo OLED 1.8" súper fácil de programar, es él [NHD-1.8-160128UBC3](https://www.digikey.es/es/products/detail/newhaven-display-intl/NHD-1-8-160128UBC3/23334148) de [Newhaven Display](https://newhavendisplay.com), en otro post explico como funciona el controlador [SSD1353](http://localhost:1313/electronic/components/display/ssd1353/) que trae. Descubrí este tipo de display por este proyecto; [Sir Box-a-Lot: an 8-bit Sokoban clone](https://lcamtuf.coredump.cx/sir-box-a-lot/) hecho por lcamtuf el cual me sorprendió su trabajo.

A continuación muestro un diagrama esquemático usando el display con un AVR128DA28, las conexiones establecidas al módulo lo configuran para trabajar en 8-bit 8080 Parallel Interface como los clásicos LCD 16x2.

![](schematic.png)

{{% blockquote type="note" %}}
Las conexiones para que funcione el MCU son ignoradas a propósito con la intención de simplificar el diagrama para centrarnos en el funcionamiento del módulo.
{{% /blockquote %}}

Para poder montar de forma más cómoda y limpia el módulo al breadboard, mandé hacer una PCB muy simple que hace de adaptador de [2x10](https://www.digikey.es/es/products/detail/w%C3%BCrth-elektronik/61302021821/16608495) a [1x20](https://www.digikey.es/es/products/detail/chip-quik-inc/HDR100IMP40M-G-V-TH/5978197) pines. Aquí tienes el diseño en KiCAD para [descargar](MountingDisplay.zip).

{{% images %}}
files:
  - connector01.png
  - connector02.png
  - connector03.png
{{% /images %}}
