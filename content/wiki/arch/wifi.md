+++
title = 'Wifi'
tags = ["linux", "bash", "wifi"]
+++

## Wifi on Arch Install

```bash
systemctl start iwd
iwctl
station list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect TheForce
exit
ifconfig
ping google.com
```

## Network Manager terminal config tool

```bash
nmtui
```

```bash
nmcli device wifi
nmcli device wifi connect TheForce password <IAmYourFather>
```
