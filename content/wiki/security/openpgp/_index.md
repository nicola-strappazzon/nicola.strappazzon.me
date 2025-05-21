+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'OpenPGP'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

# Wiki / OpenPGP

Que podemos hacer con OpenPGP, muchas cosas, yo lo uso para cifrar mis respaldos, claves, auth en github y firmar mis commits.

comentar que hay que tener en cuenta que no todas las Security Key soportan openpgp, y la que lo soportan, se debe asegurar que tambien soporte la longitud RSA del cifrado deseado.

- [token2](https://www.token2.eu/) Hasta 2048
- [yubico](https://www.yubico.com/) Hasta 4096
- [Nitrokey](https://www.nitrokey.com/) Hasta 4096

Dividimos el documento en dos secciones, la configuracion propietaria del dispositivo, y la del cifrado.

## OpenPGP

En [esta URL](https://keys.openpgp.org) puedes validar la identidad de una persona buscando su clave publica, por lo que se recomienda subir la propia.
