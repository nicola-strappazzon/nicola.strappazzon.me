+++
draft = false
title = 'Backup'
tags = ["bash", "security", "yubikey", "openpgp"]
weight = 3
+++

Existen varias formas de respaldar la clave pública y privada.

1. Copiarlos en un pendrive + cifrar la unidad con [VeraCrypt](https://veracrypt.io/en/Home.html).
2. Imprimir el contenido la clave pública y privada.
3. Generar una serie de códigos QR para luego imprimirlos y guardarlos en un lugar seguro.

## Códigos QR

Lo más interesante del código QR es que tiene niveles de redundancia, se puede configurar del 7% hasta el 30%, en caso de que la imagen o papel se deteriore, el algoritmo intentará recuperarlo con la redundancia disponible.

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
