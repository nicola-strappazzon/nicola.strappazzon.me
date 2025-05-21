+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'Import'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

# Importar desde un USB Security Key

> La clave privada se queda dentro del USB Security Key y es imposible extraerla

El proceso que se sigue a continuación permite importar la clave publica e indicar que la clave privada está dentro de una USB Security Key de confianza.

1. Conecta el USB Security Key y verifica la información:

```bash
gpg --card-status
````

2. Inicia el proceso de importación accediendo al dispositivo:

```bash
gpg --card-edit
```

3. Dentro del prompt de gpg, escribe:

```
fetch
```

4. Esto importará los datos del dispositivo. Luego, sal del prompt de gpg:

```bash
quit
```

5. Verificar que la clave se ha importado:

```bash
gpg --list-keys
```

6. Asignar confianza al dispositivo

Si la clave aparece en `gpg --list-keys`, marca que confías en ella para que funcione correctamente:

```bash
gpg --edit-key user@example.me
```

Dentro del prompt de gpg, escribe `trust`, escoge la opción número `5` y escribe `save` para terminar.
