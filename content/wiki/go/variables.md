+++
draft = true
title = 'Variables'
weight = 0
+++

# 

## Funciones

Hay dos funciones `new` y `make` que nos ayudan en la creación de variables.

### make

La función `make()` se usa para iniciar con una configuración inicial los; slices, maps, channels.

#### Iniciar un Slice

```go
slice := make([]int, 5, 10)
```

En este ejemplo se crea un slice de tipo int de una longitud de 5 y una capacidad de 10.

#### Iniciar un Map

```go
mymap := make(map[string]int)
```

#### Iniciar un Channel

```go
ch := make(chan int)
```

### new

La función `new()` es usada para cualquier tipo y retorna el puntero de la variable.



```
func new(Type) *Type
```


https://medium.com/@iammrkarn007/understanding-the-difference-between-make-and-new-functions-in-go-6d5a08a1a87c
https://stackoverflow.com/questions/9320862/why-would-i-make-or-new
