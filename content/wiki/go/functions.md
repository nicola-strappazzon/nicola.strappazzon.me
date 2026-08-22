+++
draft = true
title = 'Funciones'
weight = 0
+++

Al leer esta página, deberías poder entender:

- Cómo crear funciones y métodos.
- Entender la diferencia de ambas.
- Cómo evitar código duplicado.
- Cómo definir la visibilidad.

---

## Funciones

No pertenece a ningún tipo. La definición de una función es casi la misma para un método, ambos tienen nombre, parámetros, argumentos al llamarse y valores de retorno. Entender esta primera parte es esencial.

```go
package main

import "fmt"

func sum() {
	fmt.Println(2 + 3)
}

func main() {
	sum()
}
```

En el siguiente ejemplo podemos observar como existe una función para un tipos:

```go
package main

import "fmt"

func sum(a int, b int) int {
	return a + b
}

func main() {
	fmt.Println(sum(2, 3))
}
```

Podemos mejorar la declaración de la función `sum(a int, b int)` de la siguiente forma `sum(a, b int)` siempre y cuando el mismo tipo se repite.

### Parámetros & argumentos

Los términos se usan para cosas distintas:

- Parámetros: los nombres que aparecen en la definición de la función.
- Argumentos: los valores que pasas cuando llamas a la función.

```go
func Sum(a, b int) int {
	return a + b
}

func main() {
	resultado := Sum(2, 3)
}
```

Podemos observar lo siguiente:

- a y b son parámetros.
- 2 y 3 son argumentos.

De forma informal se dice "parámetros" para todo, pero técnicamente es diferente.

### Retornar más valores

```go
func Divide(a, b float64) (float64, error) {
	if b == 0 {
		return 0, errors.New("cannot divide by zero")
	}

	return a / b, nil
}
```

### Retornar valor por el parámetro

...

### Parámetro cómo funcion

...

### Parámetros...

...

## Métodos

Pertenece a una tipo. Recordemos que un [struct]() es un tipo.

```go
package main

import "fmt"

type Numbers struct {
	A int
	B int
}

func (n Numbers) Sum() int {
	return n.A + n.B
}

func main() {
	ints := Numbers{A: 2, B: 3}

	fmt.Println(ints.Sum())
}
```

## Funciones genéricas

Son funciones o métodos que pueden trabajar con varios tipos sin que tengas que duplicar código, cuando la lógica es la misma, pero el tipo cambia, por ejemplo:

```go
package main

import "fmt"

type Number interface {
	int | int64 | float64
}

func Sum[T Number](a, b T) T {
	return a + b
}

func main() {
	fmt.Println(Sum(2, 3))
	fmt.Println(Sum(2.5, 3.1))
}
```

Por convención se suele usar la letra `T`, especialmente cuando solo hay un tipo genérico. También la letra `R` para indicar el resultado.

Existen restricciones predefinidas:

- `any`: acepta cualquier tipo

  ```go
  func Print[T any](valor T) {
  	fmt.Println(valor)
  }
  ```

- `comparable`: acepta tipos comparables con == y !=

  ```go
  func Equal[T comparable](a, b T) bool {
  	return a == b
  }
  ```

- `cmp.Ordered`: acepta tipos ordenables con <, <=, >, >=

  ```go
  import "cmp"
  
  func LessThan[T cmp.Ordered](a, b T) T {
		if a < b {
			return a
		}
	  
		return b
  }
  ```

## Visibilidad

La visibilidad depende de la primera letra del nombre.

- Si empieza con minúscula, así que solo es visible dentro del mismo paquete.
- Si empieza con mayúscula, así que es exportada: se puede usar desde otros paquetes.
- Dentro del mismo paquete, puedes usar tanto nombres con minúscula como con mayúscula.

Esto aplica a casi todo lo nombrado en el lenguaje: funciones, tipos, structs, interfaces, métodos, variables, constantes y campos de structs.
