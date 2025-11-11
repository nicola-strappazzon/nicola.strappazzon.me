+++
title = 'Nmap'
+++

Projecto: https://github.com/nmap/nmap

Una caracteristica muy interesante que tiene esta tool es Nmap Script Engine (NSE), son scripts escritos en Lua para determinados propositos. Los scripts los puedes conseguir en la siguiente ruta con la extención .nse.

```
/usr/share/nmap/scripts/
/usr/local/share/nmap/scripts/
/opt/local/share/nmap/scripts/
```

Se cargan usando el parametro `--script` acompañado del nombre de archivo, no hace falta especificar la ruta. Para actualizar los scripts usamos el siguiente comando: nmap `--script-updatedb`.

---

Buscar host en la network:

```bash
nmap -sn 192.168.0.0/24
```

Buscar una raspberri pi por el mac address:

```bash
sudo nmap -sP 192.168.1.0/24 | awk '/^Nmap/{ip=$NF}/B8:27:EB/{print ip}'
```

Buscar todos los puertos:

```bash
nmap -sV 192.168.1.1
```

Falsificar la dirección de Origen:

```bash
sudo nmap -Pn -sS 10.9.1.2 34.212.182.173
```

Obtener el mac address:

```bash
sudo nmap -sU -p 161 -T4 -d -v -n -Pn --script snmp-interfaces 192.168.1.100
```

Su equivalente `arp 192.168.1.100`

Buscar subdominios:

```bash
nmap -v -p 80,443 --script dns-brute.nse strappazzon.me
```

Obtener version del SO y Servicios:

```bash
nmap -A -T4 192.168.1.100
```

Detectar version del servicio:

```bash
nmap -sV localhost
```
