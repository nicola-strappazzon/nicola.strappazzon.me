+++
title = 'Crear un proyecto (module)'
+++

El **módulo** es la unidad principal de versionado y distribución en Go. Dentro de un módulo hay uno o más paquetes. Tu código importa paquetes, que pueden estar en tu mismo módulo o en otros módulos (propios o de terceros).

Veamos como se crea tu primer proyecto:

```bash
mkdir hello
cd hello
go mod init example/hello
# go: creating new go.mod: module example/hello
ls -l
# total 8
# -rw-r--r--  1 nicola  staff  32 Jan 29 20:57 go.mod
```

{{% blockquote type="note" %}}
La ruta `example/hello` por lo general debe ser la ruta del repositorio. Por ejemplo, si usas GitHub debe quedar de la siguiente forma: `github.com/example/hello`.
{{% /blockquote %}}

Un módulo se distingue por contener el archivo `go.mod`. Dentro de él se define las características principales cómo el nombre, ruta, versionado, versión de go y dependencias.

Con tu editor de texto, crea el archivo principal `main.go` y agrega el siguiente código:

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")
}
```

Cómo podrás observar del código anterior, la función principal es `main()`, si no está definida se producirá un error.

Para ejecutarlo y probar el código escribe el siguiente comando:

```bash
go run .
# Hello, World!
```

Para generar el binario escribe el siguiente comando:

```bash
go build .
```

Se crea un binario con el nombre del módulo `hello` y para ejecutarlo escribir `./hello`.

{{% blockquote type="important" %}}
Si compilas en macOS, tu codigo solo funcionará en macOS. Si compulas en Linux o en Windows es igual. Debes crear un binario por sistema operativo y arquitectura del procesador.

El proyecto [GoReleaser](https://goreleaser.com) te permite simplificar la creación de binarios dentro de tus pipes (CI/CD) cuando haces una release.
{{% /blockquote %}}
