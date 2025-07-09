+++
draft = true
title = 'Terminal'
tags = ["bash"]
+++

## Prompt

Es el símbolo del sistema, incluso configurable, y también mediante una simbología básica te indica tus privilegios y donde estás.

El prompt es un grupo de símbolos que indican que ya puedes escribir un comando, y su primera aparición suele ser así, indicando que eres un usuario normal:

```bash
$
```

En el caso de que tienes permisos máximos, como el del usuario todo poderoso **root**, entonces te aparecerá de la siguiente forma:

```bash
#
```

La diferencia esta en el símbolo del `$` dólar o el de la `#` almohadilla, que indican básicamente que tipo de usuario eres, hay más simbolos que expresan un determinado significado:

- User: $ (dólar)
- Root: # (almohadilla)
- Home: ~ ()
- Mayor que: >
- Cursor: _ |

Luego hay un **cursor**, que puede ser representado de tres formas diferentes, simplemente allí es donde aparecen las letras que se están escribiendo.

### Shortcuts

Existen una serie de combinaciones que debes dominar para moverte en la línea de comandos, algunos son atajos de teclado y otros son comandos.

Esta imagen te permite ilustrarte más fácilmente:

![](shortcuts.png)

**ERRATA:** En la imagen la letra de que acompaña el comando Ctrl está en mayúscula, en la lista está en minúscula, hacer caso al de la lista.

### Atajos:

- `Ctrl + c`: Cancela la ejecución de un proceso.
- `Ctrl + l`: Limpia la pantalla de la terminal, igual al escribir el comando clear.
- `Ctrl + a`: Mueve el cursor al inicio de la línea.
- `Ctrl + e`: Mueve el cursor al final de la línea.
- `Ctrl + f`: Forward cursor
- `Ctrl + b`: Backward
- `Ctrl + h`: Backspace left of cursor
- `Ctrl + d`: Delete right of cursor
- `Ctrl + k`: Borra desde donde está el cursor hasta el final de la línea.
- `Ctrl + u`: Borra una línea.
- `Ctrl + p`: Línea anterior.
- `Ctrl + n`: Línea siguiente.

Hay más atajos que vamos a tratar con mayor profundidad más adelante.

## Comandos:

Luego existen una serie de comandos, más bien son unos símbolos que extienden su funcionalidad evitando más trabajo re-escribiendo, veamos cada caso:

### Ejecutar último comando

Usando doble exclamación `!!` y presionando la tecla ENTER ejecuta el último comando ejecutado previamente.

```bash
$ !!
```

También lo podemos usar de la siguiente forma, por ejemplo; en combinación con el comando sudo o su podemos repetir el comando anterior pero con privilegios.

```bash
$ sudo !!
$ su -c "!!"
```

Retrieve and execute specific command by id from history:

```
$ !123
```

Execute last command that starts with the letters `un`:

```
$ !un
uname -r
5.3.0-40-generic
```

Retrieve and not execute specific command by id from history:

```
$ !123:p
```

Reemplazar caracteres de el último comando:

```
$ ^aaa^bbb
```

## Entradas, salidas y error

standard

stdin

stdout

stderr

### Redirigir las salidas

### Combinar salidas

con los comandos

Esto hace referencia a los pipes | del bash

sera que aquí hay un limite en estas variables?

## Configuración

La configuración de la terminal se hace principalmente en el fichero `.bash_profile` ubicado en la ráiz de la home del usuario, por ejemplo si tu usuario es **nsc**, entonces la ruta en MAX OS X será `/Users/nsc/` y si estás en Linux la ruta será `/home/nsc/`.

Se puede especificar un fichero para que acceda directamente a la home de la siguiente forma, por ejemplo aquí queremos mostrar el contenido de `.bash_profile`:

```bash
cat ~/.bash_profile
```

Usando los simbolos `~/` indica de forma abreviada que estás en la home, esto quiere decir que `~/` es igual a decir `/Users/nsc/`.

Cada cambio que se hace en el .bash_profile se debería de recargar, a menos que cree una nueva terminal, para hacerlo de forma manual escriba el siguiente comando:

```bash
source .bash_profile
```

Aquí podra ver si hay algún error, si todo está bien, no verá ningún mensaje.

**NOTA:** Por otro lado, los ficheros que tienen un nombre que empieza por punto como en este caso, indican que son ficheros "ocultos" y que no se pueden ver a simple vista, generalmente son usados para guardar configuración, de estos existen varios cómo por ejemplo: `.gitignore`.

### Cambiar el tipo de terminal

Desde la version de MAC OS X Catalina en adelante viene por defecto zsh, para hacer el cambio a bash debemos hacer lo siguiente:

```bash
chsh -s /bin/bash
```

Luego debemos desactivar el mensaje referente zsh editando el fichero `.bash_profile` añadiendo la siguiente línea:

```bash
export BASH_SILENCE_DEPRECATION_WARNING=1
```

### Prompt y colores

Esto ya es un poco más avanzado, la terminal se puede configurar a gusto de cada quien, desde la apariencia del cliente hasta la misma terminal, a nivel de terminal es muy útil a nivel de servidores se hace para identificar si es un entorno de desarrollo o de producción para evitar cometer accidentes mediante el uso de colores, tambín ayuda a identificar elementos de interes más rapido, y por otro lado podrás poner el nombre del servidor, del ordenador en cuestión, etc.

De momento solo nos centramos en configurar la terminal y no el cliente.

Para lograrlo se usa la variable de entorno `PS1` con una serie de valores, este es un ejemplo:

```bash
PS1="\[\033[32m\]\W\[\033[31m\]\[\033[32m\]\$\[\e[0m\] "
```

La primera impresión es que es muy complejo, pero aquí básicamente le definimos colores con esta sintaxis `\033` por ejemplo, que imprima ciertas variables cómo `\u` y así entre ellas ponemos más colores, símbolos hasta construir el texto deseado.

En el siguiente enlace hay una [lista de las opciones de configuración](https://tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html).

El `bash` tiene 256 colores a tu disposición, en algunos casos está desactivado, o tiene un número limitado, por otro lado, a lo largo de los años esta forma ha cambiado dependiendo de la tecnología por lo que se deberá revisar la compatibilidad y formas de usarse:

Aquí dejo una imagen con la lista de colores disponibles:

![](colors.png)

Y puedes experimentar de la siguiente forma:

```bash
echo -e "\033[36mHello"
```

La variable `PS1` la podrás configurar dentro del fichero `.bash_profile` que está en el home de cada usuario.

### Colores en algunos comandos

Para habilitar los colores de los comandos ls y grep debemos añadir las siguientes líneas en el fichero `.bash_profile` quedando así:

```bash
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'
```

### Configurar el input

Para habilitar alfunas funciones importantes y configurar algunos keymaps básicos para aumentar la cómodidad a gusto, debemos editar el siguiente fichero `~/.inputrc` y agregar las siguientes líneas:

```bash
set completion-ignore-case On
set bell-style none
set input-meta on
set output-meta on
set convert-meta off

"\e[1;5D": backward-word
"\e[1;5C": forward-word
"\e\e[C": forward-word
"\e\e[D": backward-word
```

Expliquemos que significa cada una de estas opciones:

- La opción `completion-ignore-case` permite completar omitiendo las mayusculas y las minusculas.
- La opción `bell-style` desactiva el sonido de terminal, pero eso no desactiva el sonido del cliente cómo el de iTerm2.
- Las opciones ya definidas; `input-meta`, `output-meta` y `convert-meta` permite la entrada y salida de caracteres del encoding UTF-8 evitando la siguiente forma `$'\0123\0456'`.
- Las opciones `backward-word` y `forward-word` son para habilitar los atajos teclado que nos permite movernos entre palabras, **Ctrl+←** and **Ctrl+→** o con **Alt+← and Alt+→**.

Existen muchas más opciones, dejamos una lista de ellas por curiosidad:

```bash
# History
# -----------------------------------------------------------------------------
# Use more intelligent Up/Down behaviour: use the text that has already been
# typed as the prefix for searching through commands, like in Vim.
"\e[B": history-search-forward
"\e[A": history-search-backward

# Try to stay at the same the cursor position when moving through the history.
set history-preserve-point on

# Autocompletion
# -----------------------------------------------------------------------------
# Make Tab autocompletion case-insensitive (cd ~/dow<Tab> => cd ~/Downloads/).
set completion-ignore-case On

# When autocompleting symlinks to directories, immediately add a trailing "/".
set mark-symlinked-directories on

# Do not expand "~" to the home directory when completing. (The actual value
# passed on to the command still is expanded, though. Which is good.) "Off" is
# the default value, but some servers override this, so I override the override.
set expand-tilde off

# Flip through autocompletion matches with Shift-Tab.
"\e[Z": menu-complete

# Do not autocomplete hidden files ("dot files") unless the pattern explicitly
# begins with a dot.
set match-hidden-files off

# Show all autocomplete results at once.
set page-completions off

# If there are more than 200 possible completions for a word, ask to show them
# all.
set completion-query-items 200

# Immediately show all possible completions.
set show-all-if-ambiguous on

# Show extra file information when completing, like ls -F does.
set visible-stats on

# Be more intelligent when autocompleting by also looking at the text after
# the cursor. For example, when the current line is "cd ~/src/mozil", and
# the cursor is on the "z", pressing Tab will not autocomplete it to "cd
# ~/src/mozillail", but to "cd ~/src/mozilla". (This is supported by the
# Readline used by Bash 4.)
set skip-completed-text on

# Line editing
# -----------------------------------------------------------------------------
# Allow UTF-8 input and output, instead of showing them like $'\0123\0456'.
set input-meta on
set output-meta on
set convert-meta off

# Use Alt/Meta+Delete to delete the preceding word.
"\e[3;3~": kill-word

# Delete for wonky terminals.
"\e[3~": delete-char

# Use Ctrl+← and Ctrl+→ (or Alt/Meta, or Esc) to move between words.
"\e[1;5D": backward-word
"\e[1;3D": backward-word
"\e[5D": backward-word
"\e\e[D": backward-word
"\e[1;5C": forward-word
"\e[1;3C": forward-word
"\e[5C": forward-word
"\e\e[C": forward-word

# Miscellaneous
# -----------------------------------------------------------------------------
# Neither sound a beep nor flash the screen when trying to ring the bell.
set bell-style none
```

## Variables

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


## Funciones

hablar que son, para que se usan y poner ejemplos y donde se pueden poner.

## Limitaciones

Los clientes, por alguna razón, tienen un limite de caracteres, en el caso de linux es 4k, en Mac 1K, hay que averiguar que es exactamente.

[https://unix.stackexchange.com/questions/643777/is-there-any-limit-on-line-length-when-pasting-to-a-terminal-in-linux](https://unix.stackexchange.com/questions/643777/is-there-any-limit-on-line-length-when-pasting-to-a-terminal-in-linux)
