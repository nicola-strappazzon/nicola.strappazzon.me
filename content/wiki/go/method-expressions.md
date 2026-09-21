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

Una expresión de método resulta especialmente útil cuando una función recorre una colección y entrega cada elemento a una función `yield`:

```go
package main

import "fmt"

type Greeting struct{ Name string }

type People []*Greeting

func (g *Greeting) Say() {
	fmt.Println("Hello, " + g.Name)
}

func (people People) SayAll(yield func(*Greeting)) {
	for _, person := range people {
		yield(person)
	}
}

func main() {
	people := People{
		{Name: "Ana"},
		{Name: "Luis"},
	}

	people.SayAll(func(person *Greeting) {
		person.Say()
	})

	people.SayAll((*Greeting).Say)
}
```

La primera llamada usa una función anónima. La segunda pasa `(*Greeting).Say` directamente. Ambas hacen lo mismo porque `(*Greeting).Say` tiene el tipo `func(*Greeting)`, que coincide con el tipo esperado por `yield`.

`SayAll` decide qué persona pasa al callback en cada iteración. Por eso necesita una `method expression`, que recibe el receptor como argumento; `person.Say` no serviría porque ya quedaría asociada a una persona concreta.

La salida es:

```text
Hello, Ana
Hello, Luis
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
