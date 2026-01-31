+++
title = 'Importar'
weight = 2
+++

Al leer esta página, deberías poder entender:

- Cómo definir el nombre de un paquete.
- Cómo importar [paquetes standard](https://pkg.go.dev/std).
- El uso de la función `init()`.

---

Vamos a incrementar levemente la lógica del programa. Lo primero que se define es el `package ...` al inicio del archivo, luego se importan `import ...` los módulos, el nombre del módulo debe coincidir con el de package y el directorio que lo contiene, luego las constantes `const ...`, variables `var ...`, tipos `type ...` en cualquiera de sus variantes, por último las funciones y métodos `func ...`.

```go
package main

import (
	"fmt"
	_ "strings"
	t "time"
)

func init() {
	fmt.Println("Starting...")
}

func main() {
	now := t.Now().Format("2006-01-02 15:04:05")
	fmt.Println("Hi from Demo")
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

En Go, cualquier archivo de un paquete puede definir una función `init()`. Las funciones `init()` se ejecutan automáticamente una sola vez cuando el paquete se inicializa. La inicialización ocurre la primera vez que el programa importa ese paquete. En el ejemplo puedes ver que se imprime primero `Starting...` que el resto.
