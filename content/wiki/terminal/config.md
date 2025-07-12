+++
draft  = false
title  = 'Configuración'
tags   = ["terminal", "bash"]
weight = 5
+++

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

## Cambiar el tipo de terminal

Desde la version de MAC OS X Catalina en adelante viene por defecto zsh, para hacer el cambio a bash debemos hacer lo siguiente:

```bash
chsh -s /bin/bash
```

Luego debemos desactivar el mensaje referente zsh editando el fichero `.bash_profile` añadiendo la siguiente línea:

```bash
export BASH_SILENCE_DEPRECATION_WARNING=1
```
