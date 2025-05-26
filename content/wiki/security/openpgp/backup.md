+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'Backup'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

Existen varias formas de respaldar la clave publica y privada.

1. Copiarlos en un pendrive + cifrar la unidad con [VeraCrypt](https://veracrypt.io/en/Home.html).
2. Imprimir el contenido la clave publica y privada.
3. Genarar un una serie de codigos QR para luego imprimirlos y guardarlos en un lugar seguro.

## Codigos QR

```bash
gpg --export-secret-key user@example.me | base64 > pk.base64
split -d -C 2500 pk.base64
qrencode -r x00 -o x00.png
qrencode -r x01 -o x01.png
qrencode -r x02 -o x02.png
qrencode -r x03 -o x03.png
qrencode -r x04 -o x04.png
convert *.png pk.pdf
```
