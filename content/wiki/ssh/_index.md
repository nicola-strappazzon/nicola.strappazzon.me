+++
draft = false
title = 'SSH'
tags = ["ssh", "bash"]
+++

El [SSH](https://es.wikipedia.org/wiki/Secure_Shell) significa Secure Shell, en mi opinión es un servicio, un protocolo cifrado de comunicación y un conjunto de herramientas de las más usada para trabajar en remoto (servidor), básicamente si en local (cliente) usamos una Terminal para hacer de todo, pues con el SSH podemos hacer lo mismo pero estando en remoto, no hay límites, puedes ejecutar comandos, bajar y subir ficheros, redirigir trafico de red a travez de este protocolo, conectarte a multiples servidores en cascada, compartir variables de entorno entre el cliente y el servidor y mucho más.

La única desventaja relevante que tiene el SSH es cuando se pierde la conexion entre el cliente y el servidor, lamentablemente se pierde por completo la sessión que se estaba ejecutando en el servidor y no la podemos recuperar, incluso comandos que habiamos dejado ejecutando (no en background como los servicios) se cierran, pero para eso usamos una herramienta llamada tmux que conpensa, ahora la solución es perfecta.

El SSH es tan usado, que incluso forma parte en las herramientas cómo; git, vim y rsync entre otras. Por eso saber usarla nos habre un mundo inlimitado de posibilidades.

Auqí hay que poner un grafico para orientar

Hay varias formas de autentificarnos con el servicio SSH, una es que nos pida una clave de acceso, la otra es usar un par de claves (pública y privada) para acceder de forma más segura, incluso podemos usar ambas formas para aumentar el nivel de seguridad al maximo.

## Crear par de claves

Esta es la forma más segura de generar el par de claves.

```bash
ssh-keygen -t rsa -b 4096 -o -a 100
```

Pero, la forma tradicional y mas compatible es la siguiente:

```bash
ssh-keygen
```

Estas formas generan dos ficheros, uno llamado `id_rsa` que es la clave privada, y por último el `id_rsa.pub` que es la clave pública.

**IMPORTANTE** La clave privada no se comparte, se queda en tu ordenador.

## Establecer una conexión

```bash
ssh ec2-user@bastion.stg.corp.com -i </path/to/private.key>
```

## Copiar ficheros

En el grupo de herramientas que trae el SSH, tenemos un comando llamado `scp` para copiar ficheros usando el protocolo SSH.

### Subir

Nos referimos a la acción de copiar del cliente uno o varios ficheros al servidor usando el comando `scp`, las siglas significan security copy.

```bash
scp foo.sql stg-bastion:path/
```

### Descargar

Nos referimos a la acción de copiar del servidor uno o varios ficheros al cliente.

```bash
scp -r stg-bastion:/path/foo test:/tmp
```

En caso de que el fichero es muy grante, y comprimirlo mejorará el tiempo de descarga como suele pasar con los de tipo .log, podemos hacerlo de la siguiente forma:

```bash
scp -C -o CompressionLevel=9 bastion.stg.corp.com:/path/to/file.log .
```

{{% blockquote type="caution" %}}
Esta técnica hace que la CPU del servidor incremente.
{{% /blockquote %}}

<!-- ## Configurar el servidor -->

## Configurar una conexión

Para guardar una o varias conexiones de ssh en cliente, editamos el fichero `~/.ssh/config`:

```bash
touch ~/.ssh/config && chmod 600 ~/.ssh/config
```

Ahora editamos el fichero con nuestro editor favorito:

```bash
vim ~/.ssh/config
```

Dentro del fichero poner lo siguiente:

```bash
Host stg-bastion
  ForwardAgent yes
  HostName bastion.stg.corp.com
  User ec2-user
  IdentityFile ~/.ssh/key.pem

Host stg-proxysql
  HostName proxysql.stg.corp.com
  User ec2-user
  IdentityFile ~/.ssh/key.pem
  ProxyCommand ssh -W %h:22 stg-bastion
```

## Administrar conexiones

Para listar las conexiones establecidas, usamos el siguiente comando:

```bash
who -u
```

Mostrando una salida por `stdout` como esta:

```
user1 pts/0      2008-10-03 16:29   .      11044 (192.168.5.6)
user2 pts/2      2008-10-03 14:16 01:16     9602 (192.168.5.5)
user3 pts/10     2008-10-03 14:30 00:21     9908 (192.168.5.7)
user4 pts/12     2008-10-03 14:38 01:29     9987 (192.168.5.7)
```

En casos de que queramos terminar por ejemplo la conexion con el pid número `9987` hacemos lo siguiente:

```bash
kill 9987
```

## Port Forward

El SSH tiene la funcionalidad de compartir un puerto remoto en tu cliente local, es muy útil para saltarse algún firewall. Por ejemplo, no tenemos acceso local al puerto `8001`, entonces hacemos una conexion con un servidor que si puede verlo, y redirigimos ese puerto en nuestro cliente para acceder de la forma `localhost:8001`, solo debemos hacer la conexion de la con el siguiente comando:

```bash
ssh -i key.pem ec2-user@bastion.stg.corp.com -L 8001:localhost:8001
```

Para verificar la existencia del puerto 8001 desde el cliente:

```bash
netstat -tunelp | grep 8001
```

Supongamos que necesitamos un acceso desde nuestro ordenador (local) a un servidor MySQL que se encuentra en AWS (remoto) y no tiene acceso público y/o directo desde el exterior (Internet).Esta practica se suele usar para ejecutar scripts en local o algún entorno de desarrollo con una base de datos de desarrollo.

```bash
ssh ec2-user@bastion.stg.corp.com -i </path/to/private.key> -fNg -L 3306:mysql.cluster-ro-xxxx.eu-west-1.rds.amazonaws.com:3306
```

Si usamos los parametros `-fNg` ejecuta el comando en segundo plano y no se abre la terminal.

## Variables de entorno

El SSH tiene la funcionalidad de compartir un grupo de variables de entorno locales y enviarlas automaticamente al establecer la conexion del cliente al servidor conectado, pero para lograrlo hay que especificar tanto del lado del cliente cómo del servidor cuales variables podemos enviar, es seguro ya que al cerrar la conexion se pierde la variable y no queda rastro en el servidor.

Un caso practico para compartir variable de entorno, es la clave de MySQL llamada por ejemplo `MYSQL_PWD`, la definimos en nuestro cliente u ordenador una vez y nos olvidamos de su valor.

En el fichero de configuración del servidor `/etc/ssh/sshd_config` indicamos que variables queremos permitir recibir:

```
AcceptEnv MYSQL_PWD
```

Puede definir varias tambien

```
AcceptEnv MYSQL_PWD AWS_REGION AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
```

Una vez aplicado los cambios, debe reiniciar el servidor sshd para que tenga efecto los cambios, por ejemplo:

```
service ssh reload
```

En el cliente, puede configurar la conexión de la siguiente forma para indicar que variable obtendrá:

```
Host stg-bastion
  ForwardAgent yes
  HostName bastion.stg.corp.com
  User ec2-user
  SetEnv MYSQL_PWD="miclave"
  SendEnv AWS_REGION
  SendEnv AWS_ACCESS_KEY_ID
  SendEnv AWS_SECRET_ACCESS_KEY
  IdentityFile ~/.ssh/key.pem
```

Con SetEnv definimos una variable de entorno y se puede definir una vez, pero con SendEnv podemos definir varias y enviar las que tenemos en nuestra sesion por ssh.

## Troubleshooting

### Remover la clave publica de un host

Hay varias forma de hacerlo, esta es una de ellas.

```bash
ssh-keygen -R 54.217.60.180
```

Que es lo que pasa cuando ejecutamos el siguiente comando, básicamente busca en el fichero `~/.ssh/known_hosts` la línea que contiene el host en cuestion y elimina la linea entera, esta operación la podemos hacer de forma manual usando el comando `vim` de la siguiente forma:

```
vim .ssh/known_hosts +"2d|x"
```

El comando anterior lo que hace es eliminar directamente la línea 2 del fichero `~/.ssh/known_hosts` y guardar los cambios con una sola operación.

<!-- ### Permission denied (publickey gssapi-keyex gssapi-with-mic) -->

### Claves de tipo PEM

Cuando el cliente nos dice que una clave privada es invalida, posiblemente se deba a que esta esperando una de tipo .pem, entonces lo que debemos hacer es una conversión de la siguiente forma:

```bash
ssh-keygen -p -m PEM -f ~/.ssh/id_rsa
```

### Logs

En caso que haya un problema de conexión, se aconseja explorar los siguientes ficheros para encontrar alguna pista:

- /var/log/secure
- /var/log/auth.log
- /var/log/audit/audit.log

## Herramientas alternativas:

Esta es una lista de varias herramientas alternativas que se pueden usar junto al SSH.

- **knockd:** Es un servicio que permite ocultar un puerto particular, y se habre mediante la combinación de toques en otros puertos, se puede combinar con el SSH para ocultarlo.
- **fail2ban:** Es un servicio que permite bloquear una IP cuando hay n cantidad de intentos. 
- **putty:** Es un pack para windows.
