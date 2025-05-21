+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'Restore'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

# Restaura los certificados

Supongamos que tiene una copia de seguridad de la clave prublica y privada en un Pendrive, use los siguientes comandos para importarlos y por último no olvide verificar:

```
gpg --import myprivatekeys.asc
gpg --import mypubkeys.asc
gpg --import-ownertrust otrust.txt
gpg --list-secret-keys
gpg --list-keys
```
