+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'YubiKey'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

# YubiKey

En mi caso personal, [escogi esta marca y la serie 5](https://www.yubico.com/products/yubikey-5-overview/) porque soporta un cifrado RSA hasta 4096 que es lo mas seguro hasta el momento y tiene soporte para OpenPGP, por último tiene soporte con USB C el cual es bastante practico hoy en día.

> Se recomienda tener dos dispositivos o más por seguridad, uno de ellos deberá guardarlo en un lugar seguro en caso de perdida.

Existe una cli open source para administrar el dispositivo llamada [YubiKey Manager CLI](https://github.com/Yubico/yubikey-manager).

Instalar en Arch linux:

```bash
sudo pacman -Sy yubikey-manager
```

Instalar en MAC OS:

```bash
brew install ykman
```

## Configuración

Antes, deberá verificar que reconoce el dispositivo y conocer las funcionalidades que ofrece:

```bash
$ ykman list
YubiKey 5C (5.7.4) [OTP+FIDO+CCID] Serial: 12345678
```

Tenga en cuenta que dependiendo del modelo del dispositivos, puede que la funcionalidad del `NFC`, o `OpenPGP` no este soportada. Ejecute los siguientes comandos para configurarlo a gusto y por último verifique el resultado:

```bash
ykman config usb --disable OTP
ykman config usb --disable U2F
ykman config usb --enable FIDO2
ykman config usb --disable OATH
ykman config usb --disable PIV
ykman config usb --disable HSMAUTH
ykman config usb --enable OpenPGP
ykman info
```

Por último, configuro el `OpenPGP` para usar el touch que es bastante práctico:

```bash
ykman openpgp keys set-touch aut on
ykman openpgp keys set-touch sig on
ykman openpgp keys set-touch enc on
ykman openpgp info
```

## Reiniciar

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
