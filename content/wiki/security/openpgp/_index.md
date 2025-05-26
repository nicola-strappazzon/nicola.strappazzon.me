+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'OpenPGP'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

Que podemos hacer con OpenPGP, muchas cosas, yo lo uso para cifrar mis respaldos, claves, auth en github y firmar mis commits.

A la hora de escoger una Security Key debe verificar que soporte openpgp y también se debe asegurar que también soporte la longitud RSA del cifrado deseado. Dejo una lista de proveedores que soportan openpgp y su longitud máxima hasta la fecha de este documento.

- [token2](https://www.token2.eu/) Hasta 2048
- [yubico](https://www.yubico.com/) Hasta 4096
- [Nitrokey](https://www.nitrokey.com/) Hasta 4096

En [esta páginia](https://keys.openpgp.org) puedes validar la identidad de una persona buscando por su clave pública, es recomendable que subas tu clave pública para que puedan verificar tu identidad ó recibir mensajes cifrados que solo tú puedes leer usando la clave privada.

Dividimos el documento en múltiples secciones: