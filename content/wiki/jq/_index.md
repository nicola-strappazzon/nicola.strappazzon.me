+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'jq'
tags = ["bash", "jq", "json"]
+++

# Wiki / JQ

[jq](https://jqlang.org) es una tool que permite manipular el JSON en la terminal.


```json
{
  "name":"Foo Bar Baz",
  "score": 4,
  "color":"red",
  "options":[
    "red",
    "green",
    "blue"
  ],
  "items": [
    {"id": 0},
    {"id": 1, "label": "foo"},
    {"id": 2, "label": "bar"}
  ]
}
```

Imprimir un campo llamado `name`:

```bash
cat demo.json | jq -r '.name'
```

```
Foo Bar Baz
```

Imprimir todos los campos llamados `label` dentro una lista:

```bash
cat demo.json | jq -r '.items[].label'
```

```
null
foo
bar
```

Ejemplos de como filtrar que el campo `score` sea igual al valor `4`:

```bash
cat demo.json | jq -r 'select(.score == 4)'
```

Filtra que el campo `label` tenga un valor, muestra las columnas `name` y `label` y lo convierte a `csv`.

```bash
cat demo.json | jq -r '[.name, .score] | @csv'
```

```csv
"Foo Bar Baz",4
```

Minify, hacerlo mas compacto:

```bash
cat demo.json | jq -r tostring
```

```
{"name":"Foo Bar Baz","score":4,"color":"red","options":["red","green","blue"],"items":[{"id":0},{"id":1,"label":"foo"},{"id":2,"label":"bar"}]}
```
