+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'jq'
tags = ["bash", "jq", "json"]
+++

# Wiki / JQ

[jq](https://jqlang.org) es una tool que permite manipular el JSON en la terminal.

## Imprimir un campo

```bash
jq -r '.Query'
```

## Imprimir un campo dentro una lista

```bash
jq -r '.CacheClusters[].CacheNodeType'
```

## Filtrar

```bash
jq -r 'select( .duration != null )'
```

## Convertir a CSV

```bash
jq -r 'select( .duration != null ) | [.duration,.status, .url] | @csv' > log.csv
```
