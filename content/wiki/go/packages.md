+++
title = 'Paquetes'
weight = 3
+++

Al leer esta página, deberías poder entender:

- Cómo definir un paquete y su estructura.
- Cómo importar paquetes del módulo.
- Cómo importar paquetes de terceros.

Repasemos dos conceptos que pueden malinterpretarse:

- **Módulo:** Unidad de proyecto, versionado y dependencias.
- **Paquete:** Unidad de código que se importa y se usa.

---

Anteriormente, vimos como [importar paquetes estándar](https://nicola.strappazzon.me/wiki/go/import/), ahora vamos a ver como crear un paquete dentro de nuestro módulo para organizar mejor el código y cómo usar paquetes de terceros que están en otro repositorio.

En Go permite empaquetar código en un paquete (dentro de un directorio del módulo) y usarlo en otras partes, como una librería. Basandonos en el [módulo anterior](https://nicola.strappazzon.me/wiki/go/module/) creamos un directorio llamado `time` y dentro de el un archivo llamado `main.go`, el archivo principal del paquete se suele llamarse `main.go`.

```text
.
├── go.mod
├── hello
├── main.go
└── time
    └── main.go
```

Vemos que contiene el archivo `time/main.go`:

```go
package time

import (
	"time"
)

func at() string {
	return time.Now().Format("2006-01-02 15:04:05")
}

func At() string {
	return at()
}
````

Ahora debemos modificar el archivo `main.go` para que haga uso del paquete `time`:

```go
package main

import (
	"fmt"
	_ "strings"
	
	"example/hello/time"
)

func init() {
	fmt.Println("Starting...")
}

func main() {
	fmt.Println("Hi from Demo")
	fmt.Println("Run at:", time.At())
}
```

Para ejecutarlo y probar el código escribe el siguiente comando:

```bash
go run .
```
```text
Starting...
Hi from Demo
Run at: 2026-01-30 14:46:40
```

Al entender este punto pasamos al siguiente, usar paquetes de terceros, en este caso vamos a usar uno de google para generar [UUID](https://github.com/google/uuid), para eso lo agregamos en local usando el siguiente comando:

```bash
go get github.com/google/uuid
```

Si todo va bien debe imprimir algo cómo `go: added github.com/google/uuid v1.6.0`, y de forma automarica se ha modificado el archivo `go.mod` agregando el nuevo requerimiento. Hay un comando muy útil que es el siguiente:

```bash
go mod tidy
```

Este te descarga los requerimientos que tengas definidos en `go.mod` y estés usando en el módulo evitando ejecutar por tu cuenta de nuevo `go get...`. Pero, **si hay requerimientos que no se están usando en el módulo se borran**. Te aconsejo que puedes y verifiques tú mismo.

Ahora modifiquemos el archivo principal del módulo que se llama `main.go` para que haga uso de la nueva librería:

```go
package main

import (
	"fmt"
	_ "strings"
	
	"example/hello/time"

	"github.com/google/uuid"
)

func init() {
	fmt.Println("Starting...")
}

func main() {
	now := time.At()
	id := uuid.New()

	fmt.Println("Hi from Demo")
	fmt.Println("Run at:", now)
	fmt.Println("UUID:", id.String())
}
```

Ahora si ejecutamos el programa obtenemos una salida bastante parecida:

```
Starting...
Hi from Demo
Run at: 2026-02-06 02:43:08
UUID: 2dea2096-f9ca-43cc-9569-89ad8c2c2eea
```
