+++
draft = false
title = 'Revoke'
tags = ["bash", "security", "yubikey", "openpgp"]
weight = 5
+++

Ejecute el siguiente comando para crear el certificado para revocar, durante el proceso se hacen varias preguntas.

```bash
$ gpg --output revoke.asc --gen-revoke user@example.me

sec  rsa4096/8E97CAEEEE861362 2024-01-31 User Example <user@example.me>

Create a revocation certificate for this key? (y/N) y
Please select the reason for the revocation:
  0 = No reason specified
  1 = Key has been compromised
  2 = Key is superseded
  3 = Key is no longer used
  Q = Cancel
(Probably you want to select 1 here)
Your decision? 0
Enter an optional description; end it with an empty line:
> This is a backup revocation certificate in case the key has been compromised.
>
Reason for revocation: No reason specified
This is a backup revocation certificate in case the key has been compromised.
Is this okay? (y/N) y
ASCII armored output forced.
File 'revoke.asc' exists. Overwrite? (y/N) y
Revocation certificate created.
```
