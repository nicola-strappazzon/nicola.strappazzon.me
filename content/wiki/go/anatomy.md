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

Vamos a incrementar levemente la lógica del programa. Lo primero que se define es el `package ...` al inicio del archivo, luego se importan `import ...` los módulos, luego las constantes `const ...`, variables `var ...`, y structs `type ... struct ...`, por último las funciones `func ...`.

```go
package main

import (
	"fmt"
	_ "strings"
	t "time"
)

const AppName = "Demo"
const FormatTime = "2006-01-02 15:04:05"

func init() {
	fmt.Println("Starting...")
}

func main() {
	fmt.Println("Hi from", AppName)
	getTime()
}

func getTime() {
	now := t.Now().Format(FormatTime)

	fmt.Println("Run at:", now)
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

Go tiene un grupo de módulos (librerías) estándar, en este caso usamos `fmt` para formatear e imprimir o capturar datos, `time` para cualquier cosa sobre el tiempo, y `strings` para manipular cadenas de texto, y las importamos como puedes apreciar. En el caso del módulo `time` le hemos definido un alias colocando un nombre delante del módulo cómo `t`, el alias solo se usa cuando hay otro módulo que entra en conflicto con el nombre. En el caso de `strings` tiene un guion bajo `_` adelante y esto indica que la importamos, pero no la usamos, también se usa para las variables.

En Go, cualquier archivo de un paquete puede definir una función `init()`. Las funciones `init()` se ejecutan automáticamente una sola vez cuando el paquete se inicializa. La inicialización ocurre la primera vez que el programa importa ese paquete.
