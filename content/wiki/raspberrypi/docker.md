+++
title = 'Docker'
weight = 2
+++

En el [sitio oficial](https://docs.docker.com/engine/install/debian/#set-up-the-repository) explica cómo instalarlo, igual dejo aquí todos los pasos a seguir:

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
```

## Samba

```bash
docker run \
    --detach \
    --name samba \
    --restart=always \
    --publish 445:445 \
    --env "NAME=Data" \
    --env "USER=myuser" \
    --env "PASS=mysecretpassword" \
    --volume "${PWD:-.}/samba:/storage" \
    dockurr/samba
```

## slskd

```bash
docker run \
    --detach \
    --name slskd \
    --restart=always \
    --publish 5030:5030 \
    --publish 5031:5031 \
    --publish 50300:50300 \
    --env SLSKD_REMOTE_CONFIGURATION=true \
    --volume ${PWD:-.}/samba/slskd:/app \
    slskd/slskd:latest
```

Usuario y clave por defecto: `slskd`

## Navidrome

```bash
docker run \
    --detach \
    --name navidrome \
    --restart=always \
    --user $(id -u):$(id -g) \
    --volume "${PWD:-.}/samba/music:/music:ro" \
    --volume "${PWD:-.}/samba/navidrome:/data:rw" \
    --publish 8080:4533 \
    --env ND_LOGLEVEL=info \
    --env ND_ENABLEINSIGHTSCOLLECTOR=false \
    --env ND_ENABLETRANSCODINGCONFIG=true \
    --env ND_SUBSONIC_ARTISTPARTICIPATIONS=true \
    --env ND_SUBSONIC_DEFAULTREPORTREALPATH=true \
    deluan/navidrome:latest
```

## LMS - Lightweight Music Server


https://github.com/epoupon/lms
https://hub.docker.com/r/epoupon/lms
https://github.com/dweymouth/supersonic

```bash
docker run \
    --detach \
    --name lms \
    --restart=always \
    --user 0:0 \
    --publish 8080:5082 \
    --env "${PWD:-.}/samba/music:/music:ro" \
    --env "${PWD:-.}/samba/lms:/var/lms:rw" \
    epoupon/lms
```

## PiHole

```bash
docker run \
    --detach \
    --name pihole\
    --restart=always \
    --publish 53:53/tcp\
    --publish 53:53/udp\
    --publish 80:80/tcp\
    --publish 443:443/tcp\
    --env TZ=Europe/Madrid\
    --env FTLCONF_webserver_api_password="mysecretpassword"\
    --env FTLCONF_dns_listeningMode=all\
    --volume ./etc-pihole:/etc/pihole\
    --volume ./etc-dnsmasq.d:/etc/dnsmasq.d\
    --cap-add NET_ADMIN\
    --restart unless-stopped \
    pihole/pihole:latest
```
