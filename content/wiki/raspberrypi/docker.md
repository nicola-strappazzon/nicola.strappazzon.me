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

## navidrome

```bash
sudo docker run -d \
   --name navidrome \
   --restart=always \
   --user $(id -u):$(id -g) \
   --volume "${PWD:-.}/samba/music/files:/music" \
   --volume "${PWD:-.}/samba/music/data:/data" \
   --publish 8080:4533 \
   --env ND_LOGLEVEL=info \
   --env ND_ENABLEINSIGHTSCOLLECTOR=false \
   --env ND_ENABLETRANSCODINGCONFIG=true \
   deluan/navidrome:latest
```
