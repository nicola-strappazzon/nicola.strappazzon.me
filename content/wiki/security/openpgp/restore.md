+++
draft = false
title = 'Restore'
tags = ["bash", "security", "yubikey", "openpgp"]
weight = 4
+++

Supongamos que tiene una copia de seguridad de la clave pública y privada en un Pendrive, use los siguientes comandos para importarlos y por último no olvide verificar:

```bash
gpg --import myprivatekeys.asc
gpg --import mypubkeys.asc
gpg --import-ownertrust otrust.txt
gpg --list-secret-keys
gpg --list-keys
```
