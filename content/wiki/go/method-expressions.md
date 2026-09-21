+++
draft = false
title = 'Expresiones de método'
weight = 8
+++

En Go, un método puede usarse como función. La diferencia está en **cuándo se elige el receptor** (el valor sobre el que se llama al método).

```go
package main

import "fmt"

type Greeting struct{ Name string }

func (g *Greeting) Say() string {
	return "Hello, " + g.Name
}

func main() {
	greeting := Greeting{Name: "Ana"}
	fmt.Println(greeting.Say())
}
```

## Method expression

`(*Greeting).Say` toma el método del **tipo**, sin asociarlo todavía a una persona concreta. Su tipo es `func(*Greeting) string`; el receptor se pasa como primer argumento:

```go
package main

import "fmt"

type Greeting struct{ Name string }

func (g *Greeting) Say() string {
	return "Hello, " + g.Name
}

func main() {
	ana := Greeting{Name: "Ana"}
	luis := Greeting{Name: "Luis"}

	say := (*Greeting).Say
	fmt.Println(say(&ana))  // Hello, Ana
	fmt.Println(say(&luis)) // Hello, Luis
}
```

La misma función sirve para ambas personas porque recibe el receptor en cada llamada.

## Con `yield`

Una expresión de método resulta especialmente útil cuando una función recibe qué operación aplicar y una función `yield` para entregar cada resultado:

```go
package main

import "fmt"

type Greeting struct{ Name string }

func (g *Greeting) Say() string {
	return "Hello, " + g.Name
}

func SayAll(
	greetings []*Greeting,
	say func(*Greeting) string,
	yield func(string),
) {
	for _, greeting := range greetings {
		yield(say(greeting))
	}
}

func main() {
	greetings := []*Greeting{
		{Name: "Ana"},
		{Name: "Luis"},
	}

	SayAll(greetings, (*Greeting).Say, func(message string) {
		fmt.Println(message)
	})
}
```

`(*Greeting).Say` indica cómo convertir cada `Greeting` en texto. La función anónima es el `yield`: recibe cada texto producido por `SayAll`. La salida es:

```text
Hello, Ana
Hello, Luis
```

## Method value

`ana.Say` toma el método de una **instancia**. Su tipo es `func() string` porque el receptor ya está asociado:

```go
package main

import "fmt"

type Greeting struct{ Name string }

func (g *Greeting) Say() string {
	return "Hello, " + g.Name
}

func main() {
	ana := Greeting{Name: "Ana"}
	sayAna := ana.Say
	fmt.Println(sayAna()) // Hello, Ana
}
```

**Regla rápida:** `(*Greeting).Say` recibe el receptor al llamarse; `ana.Say` ya sabe qué receptor usar. La expresión de método resulta útil cuando quieres aplicar la misma operación a distintas instancias.
