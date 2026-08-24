+++
draft = false
title = 'Visibilidad'
weight = 4
+++

La visibilidad depende de la primera letra del nombre.

- Si empieza con minúscula, solo es visible dentro del mismo paquete.
- Si empieza con mayúscula, es visible desde otros paquetes.
- Dentro del mismo paquete, puedes usar tanto nombres con minúscula como con mayúscula.

Esto aplica a casi todo lo nombrado en el lenguaje: funciones, tipos, structs, interfaces, métodos, variables, constantes y campos de structs.

Veamos con ejemplos para entender mejor, imagina que tenemos un paquete llamado `foo`:

```go
package foo

import "fmt"

// Solo visible dentro del paquete foo
var defaultMessage = "hello"

// Visible desde otros paquetes
var DefaultMessage = "hello"

// Visible solo dentro del paquete foo
func sayHello() {
	fmt.Println("hello from a private function")
}

// Visible desde otros paquetes
func SayHello() {
	fmt.Println("hello from a public function")
	sayHello()
}
```

Desde otro paquete, por ejemplo `main`, solo podemos usar lo que empieza con mayúscula:

```go
package main

import "my-project/foo"

func main() {
	fmt.Println(foo.DefaultMessage) // OK
	foo.SayHello()                  // OK

	// fmt.Println(foo.defaultMessage) // Error: no es visible desde otro paquete
	// foo.sayHello()                  // Error: no es visible desde otro paquete
}
```

La variable `defaultMessage` empieza con minúscula, así que solo puede usarse dentro del paquete `foo`. La variable `DefaultMessage` empieza con mayúscula, así que puede usarse desde otros paquetes.

La función `sayHello` empieza con minúscula, así que solo puede usarse dentro del paquete `foo`. La función `SayHello` empieza con mayúscula, así que puede usarse desde otros paquetes.

La misma lógica también se aplica a structs y campos:

```go
type User struct {
	Name string // Visible desde otros paquetes
	age  int    // Solo visible dentro del mismo paquete
}
```
