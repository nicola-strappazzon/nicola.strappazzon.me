+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'Export'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

# Exportar los certificados al USB Security Key

Al insertar dispositivo podrá ejecutar el siguiente comando para listar los detalles.

```bash
$ gpg --card-status
```

Al ser nueva, observará algo como esto:

```
Reader ...........: Yubico YubiKey OTP FIDO CCID
Application ID ...: A0123456789012345678901234567890
Application type .: OpenPGP
Version ..........: 3.4
Manufacturer .....: Yubico
Serial number ....: 12345678
Name of cardholder: [not set]
Language prefs ...: [not set]
Salutation .......:
URL of public key : [not set]
Login data .......: [not set]
Signature PIN ....: not forced
Key attributes ...: rsa2048 rsa2048 rsa2048
Max. PIN lengths .: 127 127 127
PIN retry counter : 3 0 3
Signature counter : 0
KDF setting ......: off
UIF setting ......: Sign=off Decrypt=off Auth=off
Signature key ....: [none]
Encryption key....: [none]
Authentication key: [none]
General key info..: [none]
```

Ahora vamos a configurarla, y vamos hacer todo esto antes de exportar la clave privada.

1. Definir una clave `PIN` para el usuario, por defecto es `123456`.
2. Definir una clave `PIN` para el usuario admin, por defecto es `12345678`.
3. Definir el lenguaje.
4. Definir los datos del propietario.
5. Definir un login.
6. Definir la URL de la clave publica.

El `PIN` no tiene nada que ver con el passphrase de la clave privada.

```bash
gpg --card-edit


gpg/card> admin
Admin commands are allowed

---

gpg/card> passwd
gpg: OpenPGP card no. A0123456789012345678901234567890 detected

1 - change PIN
2 - unblock PIN
3 - change Admin PIN
4 - set the Reset Code
Q - quit

Your selection?

PIN: 123456
Admin PIN: 12345678

gpg/card> lang
Language preferences: en

gpg/card> name
Cardholder's surname: Strappazzon
Cardholder's given name: Nicola

gpg/card>

gpg/card> login
Login data (account name): user@example.me

gpg/card> url
URL to retrieve public key: https://keys.openpgp.org/vks/v1/by-fingerprint/9186C4129FFD3D2500B35FA18E97CAEEEE861364

gpg/card>


gpg/card> list

Reader ...........: Yubico YubiKey OTP FIDO CCID
Application ID ...: A0123456789012345678901234567890
Application type .: OpenPGP
Version ..........: 3.4
Manufacturer .....: Yubico
Serial number ....: 12345678
Name of cardholder: User Example
Language prefs ...: en
Salutation .......:
URL of public key : https://keys.openpgp.org/vks/v1/by-fingerprint/9186C4129FFD3D2500B35FA18E97CAEEEE861364
Login data .......: user@example.me
Signature PIN ....: not forced
Key attributes ...: rsa2048 rsa2048 rsa2048
Max. PIN lengths .: 127 127 127
PIN retry counter : 3 0 3
Signature counter : 0
KDF setting ......: off
UIF setting ......: Sign=off Decrypt=off Auth=off
Signature key ....: [none]
Encryption key....: [none]
Authentication key: [none]
General key info..: [none]

gpg/card>



gpg --edit-key user@example.me

gpg (GnuPG) 2.4.7; Copyright (C) 2024 g10 Code GmbH
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Secret key is available.

sec  rsa4096/8E97CAEEEE861364
     created: 2024-02-17  expires: never       usage: SC
     trust: ultimate      validity: ultimate
ssb  rsa4096/DB9D56A1864BF103
     created: 2024-02-17  expires: never       usage: E
[ultimate] (1). User Example <user@example.me>

gpg> keytocard
Really move the primary key? (y/N) y
Please select where to store the key:
   (1) Signature key
   (3) Authentication key
Your selection? 1

sec  rsa4096/8E97CAEEEE861364
     created: 2024-02-17  expires: never       usage: SC
     trust: ultimate      validity: ultimate
ssb  rsa4096/DB9D56A1864BF103
     created: 2024-02-17  expires: never       usage: E
[ultimate] (1). User Example <user@example.me>

Note: the local copy of the secret key will only be deleted with "save".
gpg> keytocard
Really move the primary key? (y/N) y
Please select where to store the key:
   (1) Signature key
   (3) Authentication key
Your selection? 3

sec  rsa4096/8E97CAEEEE861364
     created: 2024-02-17  expires: never       usage: SC
     trust: ultimate      validity: ultimate
ssb  rsa4096/DB9D56A1864BF103
     created: 2024-02-17  expires: never       usage: E
[ultimate] (1). User Example <user@example.me>

Note: the local copy of the secret key will only be deleted with "save".



~$ gpg --card-status
Reader ...........: Yubico YubiKey OTP FIDO CCID
Application ID ...: A0123456789012345678901234567890
Application type .: OpenPGP
Version ..........: 3.4
Manufacturer .....: Yubico
Serial number ....: 12345678
Name of cardholder: User Example
Language prefs ...: en
Salutation .......:
URL of public key : https://keys.openpgp.org/vks/v1/by-fingerprint/9186C4129FFD3D2500B35FA18E97CAEEEE861364
Login data .......: user@example.me
Signature PIN ....: not forced
Key attributes ...: rsa4096 rsa2048 rsa4096
Max. PIN lengths .: 127 127 127
PIN retry counter : 3 0 3
Signature counter : 0
KDF setting ......: off
UIF setting ......: Sign=off Decrypt=off Auth=off
Signature key ....: 9186 C412 9FFD 3D25 00B3  5FA1 8E97 CAEE EE86 1364
      created ....: 2024-02-17 09:56:16
Encryption key....: [none]
Authentication key: 9186 C412 9FFD 3D25 00B3  5FA1 8E97 CAEE EE86 1364
      created ....: 2024-02-17 09:56:16
General key info..: pub  rsa4096/8E97CAEEEE861364 2024-02-17 User Example <user@example.me>
sec>  rsa4096/8E97CAEEEE861364  created: 2024-02-17  expires: never
                                card-no: 0006 12345678
ssb   rsa4096/DB9D56A1864BF103  created: 2024-02-17  expires: never
