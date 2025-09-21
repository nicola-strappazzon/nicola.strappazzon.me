+++
title = 'Tonos y melodías'
+++

Vamos a explicar desde cero cómo reproducir melodías usando tonos generados por un timer en un `AVR128DA28`. Los tonos serán reproducidor por un [buzzer o altavoz piezoeléctrico](https://en.wikipedia.org/wiki/Piezoelectric_speaker). Para eso vamos a estudiar en profundidad una melodía muy famosa que es la primera pieza "Twinkle, Twinkle, Little Star" (Estrellita, ¿dónde estás?) de una canción infantil del siglo XVIII (melodía de Ah! vous dirai-je, maman de Mozart) que también la usa [Arduino](https://docs.arduino.cc/built-in-examples/digital/toneMelody/) en su ejemplo.

Vamos a ir descomponiendo la melodía en notas y luego en tonos y así hasta llegar al código fuente que los genera. Es un ejemplo maravilloso donde se aplica ingeniería inversa, matemática y programación.

**¿Qué es una melodía?** Es una sucesión organizada de sonidos de diferentes alturas y duraciones, percibida como una sola entidad musical que desarrolla una idea. Si oriento este concepto a lo que vamos a tratar en este documento, diría que es una *sucesión de notas organizadas de diferentes duraciones* que es percibida como una sola entidad musical.

Si conectamos un analizador lógico (logic analyzer) a la salida del MCU que reproduce dicha melodía obtenemos una muestra de pulsos que se parecen a la siguiente imagen:

![](logicanalyzer01.png)

Estas son las notas y la duración de cada nota de la melodía "Twinkle, Twinkle, Little Star". La primera línea son las notas, y la segunda los tiempos.

```
NOTE_C4, NOTE_G3, NOTE_G3, NOTE_A3, NOTE_G3, 0, NOTE_B3, NOTE_C4
4,       8,       8,       4,       4,       4, 4,       4
```

Si buscamos en la librería de tonos musicales `pitches.h` obtenemos solo estas cuatro notas que conforman la melodía:

```
#define NOTE_G3  196
#define NOTE_A3  220
#define NOTE_B3  247
#define NOTE_C4  262
```

Por ejemplo, la nota `G3` tiene el valor `196`, que corresponde a la frecuencia de 196 Hz.

![](logicanalyzer02.png)

Si observamos la imagen anterior, notamos que hay una serie de pulsos que los llamaremos `toggle`. Un `toggle` es un valor alto ó bajo. En la imagen anterior hay 49, y este valor se puede calcular usando la nota y el tiempo.

Volvamos analizar la nota `G3` que está acompañada de un tiempo con el valor `8` que equivale a una [corchea](https://es.wikipedia.org/wiki/Corchea) (jerga de la música), esto quiere decir, una duración de 1/8s que es equivalente `125ms`.

{{< mathjax "t_{ms}=\frac{1000}{8}=125_{ms}" >}}

{{< mathjax "toggles=\frac{2 \cdot f \cdot t_{ms}}{1000}=\frac{2 \cdot 196Hz \cdot 125_{ms}}{1000}=49" >}}

Como resultado tenemos `49` toggles que es equivalente a 24.5 períodos, si redondeamos son `25 períodos`. Todo empieza a encajar según lo que nos dice la imagen anterior.

...

Seguimos trabajando en terminar el artículo...
