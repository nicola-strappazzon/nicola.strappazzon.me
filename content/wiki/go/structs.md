+++
draft = false
title = 'Structs'
weight = 6
+++

Al leer esta página, deberías poder entender:

- Cómo crear estructuras.
- Cómo se modifican los datos.
- Cómo usar los tags.

---

Un **struct** es un tipo de dato que agrupa varios campos bajo un mismo nombre. Sirve para representar "cosas" con propiedades.

```go
type Persona struct {
	Nombre string
	Edad   int
}
```

Para usar el `struct` hay varias formas. En el siguiente caso vamos a declarar una variable llamada p del tipo Persona y posteriormente le asignamos valores:

```go
p := Persona{}
p.Nombre = "Ana"
p.Edad = 28
```

También puedes declararla con valores:

```go
p := Persona{
	Nombre: "Ana",
	Edad:   30,
}
```

También puedes usar la función `new` para que te retorne el puntero de `*Persona` quedando `p := new(Persona)` y es equivalente a `p := &Persona{}`. Por ejemplo, si queremos retornar un `struct` con valores por defecto hacemos:

```go
func NuevaPersona(nombre string, edad int) *Persona {
	return &Persona{
    Nombre: nombre,
    Edad:   edad,
	}
}
```

## Métodos

Puedes asociar funciones al `struct` y eso se llaman **métodos**, la diferencia está en el receiver, que es ese parámetro especial antes del nombre del método:

```go
func (p Persona) Saludar() {
	fmt.Printf("Hola, soy %s y tengo %d años\n", p.Nombre, p.Edad)
}
```

Ese `(p Persona)` significa que éste método `Saludar()` pertenece al tipo `Persona`.

También puedes usar puntero si el método necesita modificar el `struct`:

```go
func (p *Persona) CumplirAños() {
	p.Edad++
}
```

{{% blockquote type="note" %}}
Si el tipo es un `map` o un `slice` esto no funciona. Se usa `(*p).` y se llama desreferenciar un puntero.
{{% /blockquote %}}

Para acceder al método lo llamas de la siguiente forma:

```go
p := Persona{
	Nombre: "Ana",
	Edad:   30,
}
p.CumplirAños()
p.Saludar()
```

No puedes acceder al metodo sino inicias primero la variable.

## Tags

Los `struct` pueden tener **tags**, que son pequeños metadatos escritos junto a los campos. Técnicamente los tags no cambian la estructura del `struct`, más bien le dan instrucciones a otras herramientas sobre cómo interpretar sus campos.

```go
type User struct {
	ID    int    `json:"-"`
	Name  string `json:"name"`
	Email string `json:"email,omitempty"`
}
```

Si usas librerías como la de JSON entre otras, puede que tengan opciones adicionales para los tags. Por ejemplo, para el caso de la librería JSON existen estas opciones que son bastante comunes:

- `json:"name"` cambia el nombre del campo en JSON.
- `omitempty` omite el campo si está vacío.
- `"-"` ignora el campo.
