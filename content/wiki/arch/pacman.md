+++
title = 'Pacman'
tags = ["linux", "bash", "package"]
+++

## Update installed packages

```bash
sudo pacman -Syu
```
## Check for updates

```bash
sudo pacman -Syu 
```

## Install packages

```bash
sudo pacman -Syu [PackageName]
```

## Uninstall packages

```bash
sudo pacman -Rns [PackageName]
```

## Search for a package

```bash
sudo pacman -Ss [PackageName]
```

## Query package info

```bash
sudo pacman -Fy [PackageName]
```

## Clean cache

```bash
sudo pacman -Scc
```

## Check for orphaned packages

```bash
pacman -Qdtq
```

## Remove all orphans

```bash
pacman -Qdtq | pacman -Rns -
```
