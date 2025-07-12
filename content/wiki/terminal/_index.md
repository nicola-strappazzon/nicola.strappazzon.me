+++
draft = false
title = 'Terminal'
tags = ["bash"]
+++

Imaginate un sitio en el ordenador que puedas hacer lo que quieras sin limites, que se considera "oscuro", flexible, rapido, y eficiente.

Me acuerdo cuando quería aprender a usar Linux y los libros eran más grande que la biblia, había uno para cada cosa, explicaban de todo, al inicio era difícil encontrar lo que necesitabas para sobrevivir y sentirte útil. Pero con el tiempo me los fui leyendo y poniendo en practica a diario hasta que decidi escribir mi experiencia.

La idea de este **pequeño, compacto, básico e imprescindible** manual a base de apuntes de la temina `bash` y una serie de comandos que son de utilidad para el día a día de un informático, y válido para; Developer, System Administrator, Data Engener y afines. Espero que se convierta en tu documentación preferida de supervivencia para hallar la habilidad necesaria.

{{% blockquote type="warning" %}}
Todo lo que se explica a lo largo del documento es válido para Linux y Mac OS X. Los comandos que tratamos existen en ambos Sistemas Operativos (OS), pero dependiendo de la versión instalada de un comando en un SO u otro puede que hayan leves diferencias, sea paciente y apoyese con documentación oficial para extender los conosimientos.
{{% /blockquote %}}

Solo trataremos sobre el `bash` y lo que hay en su entorno, por la simple razón que es un estándar, esta en todos los servidores, imagenes de docker, ordenadores y siempre está allí presente, hay otros mas modernos y llamativos como el [zsh](https://ohmyz.sh), o uno primitivo y elemental como el `sh` que es compatible con el `bash` y se suele usar para las imagenes de docker para ahorrar el mayor espacio posible como es el caso de [alpine](https://www.alpinelinux.org). Mi consejo personal, es que domines de verdad el `bash` antes de usar otro.

{{% blockquote type="tip" %}}
La nueva versión de macOS Sequoia tiene por defecto `zsh`, pero sigue estando disponible el `bash` y puedes habilitarla por defecto en la configuración del terminal.
{{% /blockquote %}}

¿Porque usar la terminal? Básicamente porque **eres el todo poderoso**, allí puedes hacer todo sin ninguna limitación. Podrás hacer mas cosas que en la GUI (Graphic User Interface), seguramente sea más complicado en la terminal, pero es más eficiente y flexible, en muchos casos de este mundo de Linux, primero se hace el comando y luego la GUI que la acompaña.

También podrás conectarte a terminales remotas, subir o bajar ficheros, virtualizar terminales dentro de una terminal, dejar ejecutando procesos y retomarlos más adelante. No hay limites.

Cómo anecdota, suele haber mucha confusión con los terminos: terminal, consola, shell, y línea de comandos. Vamos explicar que significa cada uno:

1. **Terminal:** Una interfaz que permite al usuario interactuar con el sistema operativo, usualmente a través de texto. Hoy en día es normal que sea una aplicación gráfica como gnome-terminal, konsole, alacritty, xterm, iTerm, etc. Antiguamente, era un dispositivo físico conectado a un mainframe como él [VT100](https://en.wikipedia.org/wiki/VT100).
2. **Consola:** Originalmente era la principal pantalla física del sistema. En sistemas modernos, suele referirse a la TTY (teletipo), accesible con Ctrl+Alt+F1 a F6 en Linux. O genéricamente a cualquier terminal textual del sistema. Toda consola puede ser una terminal, pero no toda terminal es una consola en el sentido estricto.
3. **Shell:** Es un programa que interpreta comandos, es la entrada de la Terminal. Por ejemplo son; bash, zsh, fish, sh, csh, etc.
4. **Línea de comandos:** También llamada CLI (Command Line Interface) Es la interfaz textual donde escribes comandos. Es la línea donde interactúas con el shell, básicamente es como una entrada de texto única.
