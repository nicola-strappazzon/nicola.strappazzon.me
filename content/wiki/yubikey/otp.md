+++
title = 'OTP'
+++

Las YubiKey 5C tienen un OTP integrado, podemos añadir hasta 64 cuentas y es suficiente para guardas las importantes. Lo primero es verificar si está activa la aplicación `OATH`:

```bash
~$ ykman info
Device type: YubiKey 5C
Serial number: 01234567
Firmware version: 5.7.4
Form factor: Keychain (USB-C)
Enabled USB interfaces: FIDO, CCID

Applications
Yubico OTP      Disabled
FIDO U2F        Disabled
FIDO2           Enabled
OATH            Disabled
PIV             Disabled
OpenPGP         Enabled
YubiHSM Auth    Disabled
~$
```

Si no lo está, así la activas:

```bash
ykman config usb --enable oath
```

Para añadir una cuenta:

```bash
~$ ykman oath accounts uri "otpauth://totp/GitHub:user@example.com?secret=ABCDEFGHIJKLMNOP&issuer=GitHub"
OATH account added.
~$
```

Para listar las cuentas:

```bash
~$ ykman oath accounts list
GitHub:user@example.com
~$
```

Y para obtener el OTP de una cuenta:

```bash
~$ ykman oath accounts code github
012345
~$
```
