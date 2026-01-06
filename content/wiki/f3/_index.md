+++
title = 'f3'
tags = ["bash"]
+++

[F3 - Fight Flash Fraud](https://github.com/AltraMayor/f3) Es una herramienta para verificar sectores defectuosos en memorias de tipo USB, SD y discos externos.

## Instalación

```bash
brew install f3
```

## Uso

Supongamos que conoces la ruta donde está montada la memoria cómo por ejemplo `/mount/usb/`.

**Escribir:** Esto llenará el dispositivo con archivos de prueba. No destruye los datos de la memoria.

```bash
f3write /mount/usb/
```

**Leer:** Esto leerá todos los archivos de prueba del dispositivo.

```bash
f3read /mount/usb/
```

En este ejemplo se aprecia que hay sectores corruptos:

```
$ f3read /mount/usb/
F3 read 9.0
Copyright (C) 2010 Digirati Internet LTDA.
This is free software; see the source for copying conditions.


                  SECTORS      ok/corrupted/changed/overwritten
Validating file 1.h2w ...       0/  2097152/      0/      0
Validating file 2.h2w ...       0/  2097152/      0/      0
Validating file 3.h2w ...       0/  2097152/      0/      0
Validating file 4.h2w ...       0/  2097152/      0/      0
Validating file 5.h2w ... 15.32% -- 18.02 MB/s -- 23:04^C
$
```
