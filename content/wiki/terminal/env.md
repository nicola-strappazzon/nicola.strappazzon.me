+++
draft  = true
title  = 'Variables de entorno'
tags   = ["terminal", "bash"]
weight = 6
+++

Aquí hablaremos de las variables de entorno, que son, donde se definen y para que se usan. Hay varios tipos de variables a pesar que no se definen cómo tal, algunas son propias del Sistema Operativo, otras son para las aplicaciones o para nuestros propositos, la idea es que el usuario las pueda ir definiendo a su gusto, una de las muchas utilidades que tiene, es la forma de definir parámetros de configuración en el despliegue de una aplicación.

Para conocer que variables de entorno tenemos definidas, debemos escribir el siguiente comando `env` en la terminal:

```bash
~$ env
GREP_COLOR=1;35;40
SUDO_PS1=\[\033[31m\]\u:\[\033[32m\]\w#\[\e[0m\]
TERM=xterm-256color
SHELL=/bin/bash
USER=nsc
CLICOLOR=1
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
HOME=/Users/nsc
EDITOR=vim
```

Aquí solo listamos algunas ya que pueden ser muchas, si queremos imprimir el valor de una variable de entorno escribimos lo siguiente:

```bash
~$ echo $HOME
/Users/nsc
```

Existen una serie de variables de entorno por defecto y propias del Sistema Operativo, cómo por ejemplo:

- TERM
- SHELL
- USER
- PATH
- HOME
- EDITOR

Hay muchas más, pero nos sentramos en estas solo como ejemplo, por otro lado hay otras que defines manualmente y son usadas por las aplicaciones ya que pueden ser necesarias.

## Variables de entorno

Las variables de entorno, son como las variables dentro de un programa, solo que esta vez las tenemos dentro de nuestro sistema operativo, estas variables pueden tener diferentes niveles de visibilidad o ambito, todo depende de cómo se configuren.

Son muy útiles, y nos permite hacer muchas cosas cómo:

- Configurar todo tipo de aplicaciones si estas lo permiten.
- Configurar diversos entornos usando el mismo nombre de variables.
- Configurar variables para todos los usuarios, y/o para el mismo usuarios, y/o para una session y/o dentro de un script.
- El uso de variables bien estructuradas permite estandarizar y ordenar entornos y/o aplicaciones.
- Transferir variables de un entorno local a un servidor mediante SSH.
- El mismo sistema operativo tiene sus propias variables.

### Listar las variables definidas

Con escribir el comando `env`, nos lista todas las variables definidas en esa sesión. Podemos acompañarnos de estos comandos para filtrar o visualizar más facilmente: grep, tail.

### Definir una variable

Hay varias formas de definirlas, a esto le podemos llamar ambito, y va desde para un comando en particular, para una sesión especifica de un usuario hasta todas las sesiones de todos los usuarios.

1. Para pasarla a un comando hacemos lo siguiente:
    
    ```
    
    ```
    

### Acceder a una variable

```
echo $VARIABLE
echo "${VARIABLE}"
```

### Eliminar variable

```bash
unset VARIABLE
```

### Manipular variables

### Otras variables del sistema operativo

comentar donde se pueden definir.
