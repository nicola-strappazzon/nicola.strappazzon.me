+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'YubiKey'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

En mi caso personal, [escogi esta marca y la serie 5](https://www.yubico.com/products/yubikey-5-overview/) porque soporta un cifrado RSA hasta 4096 que es lo mas seguro hasta el momento y tiene soporte para OpenPGP, por último tiene soporte con USB C el cual es bastante practico hoy en día.

{{% blockquote type="tip" %}}
Se recomienda tener dos dispositivos o más por seguridad, uno de ellos deberá guardarlo en un lugar seguro en caso de perdida.
{{% /blockquote %}}

Existe una cli open source para administrar el dispositivo llamada [YubiKey Manager CLI](https://github.com/Yubico/yubikey-manager).

Instalar en Arch linux:

```bash
sudo pacman -Sy yubikey-manager
```

Instalar en MAC OS:

```bash
brew install ykman
```
