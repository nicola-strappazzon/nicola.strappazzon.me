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

## Cloudflare tunnel

```bash
docker run \
    --detach \
    --name=cloudflare-tunnel-name \
    --restart=always \
    --network=host
    cloudflare/cloudflared:latest tunnel --no-autoupdate run --token $CLOUDFLARE_TOKEN
```

## Samba

```bash
docker run \
    --detach \
    --name samba \
    --restart always \
    --publish 445:445 \
    --env "NAME=Data" \
    --env "USER=myuser" \
    --env "PASS=mysecretpassword" \
    --volume /home/nicola/media:/storage \
    dockurr/samba
```

## transmission

```bash
docker run \
    --detach \
    --name transmission \
    --restart always \
    --env PUID=1000 \
    --env PGID=1000 \
    --env TZ=Etc/UTC \
    --publish 9091:9091 \
    --publish 51413:51413 \
    --publish 51413:51413/udp \
    --volume /home/nicola/config/transmission/data:/config \
    --volume /home/nicola/samba/transmission:/downloads \
    --volume /home/nicola/config/transmission/watch:/watch \
    lscr.io/linuxserver/transmission:latest
```

## slskd

```bash
docker run \
    --detach \
    --name slskd \
    --restart always \
    --publish 5030:5030 \
    --publish 5031:5031 \
    --publish 50300:50300 \
    --env SLSKD_REMOTE_CONFIGURATION=true \
    --volume /home/nicola/media/downloads:/app \
    slskd/slskd:latest
```

Usuario y clave por defecto: `slskd`

## PiHole

```bash
docker run \
    --detach \
    --name pihole\
    --restart always \
    --publish 53:53/tcp \
    --publish 53:53/udp \
    --publish 80:80/tcp \
    --env TZ=Europe/Madrid \
    --env FTLCONF_webserver_api_password="mysecretpassword" \
    --env FTLCONF_dns_listeningMode=all \
    --volume /home/nicola/config/pihole:/etc/pihole \
    --volume /home/nicola/config/dnsmasq:/etc/dnsmasq.d \
    --cap-add NET_ADMIN \
    pihole/pihole:latest
```

## DNSCrypt

```bash
docker run \
    --detach \
    --name dnscrypt \
    --restart always \
    --publish 443:443/udp \
    --publish 443:443/tcp \
    --volume /etc/dnscrypt-server/keys:/opt/encrypted-dns/etc/keys \
    jedisct1/dnscrypt-server init -N example.com -E '192.168.1.10:443'
```

## jellyfin

```bash
mkdir -p /home/nicola/jellyfin/{config,cache}
docker run \
    --detach \
    --name pihole\
    --restart always \
    --volume /home/nicola/jellyfin/config:/config \
    --volume /home/nicola/jellyfin/cache:/cache \
    --volume /home/nicola/media:/media \
    --net=host \
    jellyfin/jellyfin:latest
```
