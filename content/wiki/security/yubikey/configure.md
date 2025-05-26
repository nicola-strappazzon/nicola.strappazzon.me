+++
date = '2025-05-09T10:56:29+02:00'
title = 'Configuración'
+++

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
