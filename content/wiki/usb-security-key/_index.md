+++
date = '2025-05-09T10:56:29+02:00'
draft = true
title = 'Yubikey'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

# Wiki / USB Security Key

comentar que hay que tener en cuenta que no todas las Security Key soportan openpgp, y la que lo soportan, se debe asegurar que tambien soporte el cifrado deseado.

- [token2](https://www.token2.eu/) RSA2048
- [yubico](https://www.yubico.com/) RSA4096

Dividimos el documento en dos secciones, la configuracion propietaria del dispositivo, y la del cifrado.

## YubiKey

[YubiKey Manager CLI](https://github.com/Yubico/yubikey-manager)

### Reiniciar

Con el siguiente comando, podra borrar la información importante guardada en la Yubikey.

```
gpg-connect-agent <<EOF
/hex
scd serialno
scd apdu 00 20 00 81 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 81 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 81 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 81 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 83 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 83 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 83 08 40 40 40 40 40 40 40 40
scd apdu 00 20 00 83 08 40 40 40 40 40 40 40 40
scd apdu 00 e6 00 00
scd apdu 00 44 00 00
/echo Yubikey has been successfully reset.
/echo The factory default PINs are 123456 (user) and 12345678 (admin).
EOF
```

## OpenPGP

En [esta URL](https://keys.openpgp.org) puedes validar la identidad de una persona buscando su clave publica, por lo que se recomienda subir la propia.


### Importar un respaldo de los certificados

Supongamos que tiene una copia de seguridad de la clave prublica y privada, use los siguientes comandos para importarlos y por último veridique:

```
gpg --import myprivatekeys.asc
gpg --import mypubkeys.asc
gpg --import-ownertrust otrust.txt
gpg --list-secret-keys
gpg --list-keys
```

### Exportar los certificados a la Security Key

Al insertar la Security Key podrá ejecutar el siguiente comando para listar los detalles.

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
Login data (account name): nicola@strappazzon.me

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
Name of cardholder: Nicola Strappazzon
Language prefs ...: en
Salutation .......:
URL of public key : https://keys.openpgp.org/vks/v1/by-fingerprint/9186C4129FFD3D2500B35FA18E97CAEEEE861364
Login data .......: nicola@strappazzon.me
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



gpg --edit-key nicola@strappazzon.me

gpg (GnuPG) 2.4.7; Copyright (C) 2024 g10 Code GmbH
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Secret key is available.

sec  rsa4096/8E97CAEEEE861364
     created: 2024-02-17  expires: never       usage: SC
     trust: ultimate      validity: ultimate
ssb  rsa4096/DB9D56A1864BF103
     created: 2024-02-17  expires: never       usage: E
[ultimate] (1). Nicola Strappazzon <nicola@strappazzon.me>

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
[ultimate] (1). Nicola Strappazzon <nicola@strappazzon.me>

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
[ultimate] (1). Nicola Strappazzon <nicola@strappazzon.me>

Note: the local copy of the secret key will only be deleted with "save".



~$ gpg --card-status
Reader ...........: Yubico YubiKey OTP FIDO CCID
Application ID ...: A0123456789012345678901234567890
Application type .: OpenPGP
Version ..........: 3.4
Manufacturer .....: Yubico
Serial number ....: 12345678
Name of cardholder: Nicola Strappazzon
Language prefs ...: en
Salutation .......:
URL of public key : https://keys.openpgp.org/vks/v1/by-fingerprint/9186C4129FFD3D2500B35FA18E97CAEEEE861364
Login data .......: nicola@strappazzon.me
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
General key info..: pub  rsa4096/8E97CAEEEE861364 2024-02-17 Nicola Strappazzon <nicola@strappazzon.me>
sec>  rsa4096/8E97CAEEEE861364  created: 2024-02-17  expires: never
                                card-no: 0006 12345678
ssb   rsa4096/DB9D56A1864BF103  created: 2024-02-17  expires: never


## Importar desde Security Key al local

La clave privada se queda dentro de la Security Key y es imposible extraerla, lo que se hace es importar la clave publica e indicar que la clave privada está dentro de una Security Key.

1. Obtener la clave directamente desde la Security Key:

```bash
gpg --card-status
````

Esto debería mostrar información sobre la Security Key, incluyendo el Keygrip y el Key ID.

Si la clave no aparece en tu keyring local, importa la clave desde la Security Key con:

```bash
gpg --card-edit
```

Dentro del prompt de gpg, escribe:

```
fetch
```

Esto importará la clave pública desde la Security Key. Luego, guarda los cambios con:

```bash
quit
```

2. Verificar que la clave se ha importado

Revisa si la clave está en tu keyring con:

```bash
gpg --list-keys
```

3. Asignar confianza a la clave

Si la clave aparece en `gpg --list-keys`, marca que confías en ella para que funcione correctamente:

```bash
gpg --edit-key <KEY-ID>
```

Dentro del prompt, escribe `trust`, escoge la opcion numero 5 y escribe `save` para terminar.
