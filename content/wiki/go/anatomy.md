+++
title = 'Anatomía de un programa'
weight = 2
+++

Al leer esta página, deberías poder entender la estructura básica e interna de un progama:

- Definir el nombre de un paquete.
- Importar [paquetes standard](https://pkg.go.dev/std).
- Definir constantes y variables globales.
- Uso de la función `init()`.

---

Vamos a incrementar levemente la lógica del programa:

```go
package main

import (
	"fmt"
	"time"
)

const AppName = "Demo"
const FormatTime = "2006-01-02 15:04:05"

func init() {
	fmt.Println("Starting...")
}

func getTime() {
	now := time.Now().Format(FormatTime)

	fmt.Println("Run at:", now)
}

func main() {
	fmt.Println("Hi from", AppName)
	getTime()
}
```
```bash
go run .
```
```text
Starting...
Hi from Demo
Run at: 2026-01-30 14:46:40
```

Vamos con la explicación. Go tiene un grupo de módulos (librerías) estándar, en este caso usamos `fmt` para formatear e imprimir o capturar datos, `time` para cualquier cosa sobre el tiempo, y `strings` para manipular cadenas de texto, y las importamos como puedes apreciar. En el caso de `strings` tiene un guion bajo `_` adelante y esto indica que la importamos, pero no la usamos, también se usa para las variables.
