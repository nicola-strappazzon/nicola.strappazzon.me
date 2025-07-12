+++
draft  = false
title  = 'Básico'
tags   = ["bash"]
weight = 1
+++

Para ir entendiendo todo lo que esta escrito a lo largo del documento, será útil conocer y/o repasar estos puntos:

- **Prompt:** Es el carácter o conjunto de caracteres que se muestran en una línea de comandos para indicar que está a la espera de órdenes. Este puede variar dependiendo del intérprete de comandos y suele ser configurable.

    ```
    user@host:~$
    root@host:~#
    ```

    La primera línea indica el *Prompt* de un usuario normal, y la segunda línea indica el *Prompt* de un super usuario cómo el `root` o el que se accede usando `sudo`.

    Puede cambiar el estilo del *Prompt* usando las variables de entorno PS0 y PS1 que verá más adelante, existen más variables PSx.

- **Cursor:** Es un indicador que se usa para mostrar la posición de entrada en un monitor o en otros dispositivos de visualización que responderán a las pulsaciones en un dispositivo de entrada de texto o a las acciones en un dispositivo apuntador. El cursor de ratón puede denominarse puntero de ratón, debido a la forma de flecha de algunos sistemas.
    
    ```
    user@host:~$ _
    ```

Existen diferentes símbolos para el cursor y también pueden parpadear; | _ &#9609;

- **Fichero:** (o archivo) es un contenedor de datos, es cualquier cosa que puedes leer o escribir. En los sistemas operativos basados en Linux y derivados son ficheros; discos, terminales, dispositivos, procesos, etc.
- **Directorio:** Algunos también lo llaman Carpeta, pero es un término más de MS Windows, pero su forma correcta es directorio, esta es una unidad organizativa que permite contener Directorios y Ficheros de cualquier tipo.
- **Ruta:** (o path) es la dirección única que indica el sistema dónde está un fichero o directorio. Existen dos sub-grupos de la ruta; la absoluta y la relativa:
    - **Absoluta:** Es la dirección completa desde la raíz del sistema (/) hasta el archivo o directorio.
    - **Relativa:** Es la dirección desde el lugar donde estás ahora (tu directorio actual) al que quieres ir.

- **Separador:** En una ruta hay un símbolo `/` llamado barra normal o slash, que permite separar los niveles del sistema de archivos y directorios. En sistemas operativos como MS Windows usa un separador diferente `\` llamado barra invertida.

{{< svg name="draw01" >}}