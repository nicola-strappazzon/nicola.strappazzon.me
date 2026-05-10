+++
title = 'photorec'
tags = ["bash"]
+++

Mi hijo tiene una cámara fotográfica de esas de niños, china, y la verdad es que son de mala calidad. Ya llevamos dos, pero ellos son felices… y más si el papá les resuelve uno que otro problema, como el de este post.

A veces, por alguna razón "desconocida", todas las fotos se eliminan de la SD, incluso si la sacan sin apagarla. Esto me ha pasado varias veces, por eso dejo aquí anotadas las herramientas y pasos para recuperarlas.

[TestDisk](https://www.cgsecurity.org/wiki/TestDisk) Es un conjunto de herramientas para recuperar particiones y archivos borrados. Entre ellas tenemos `photorec`.

## Instalación

```bash
brew install testdisk
```

Antes de ejecutar la aplicación, deberás conocer la ruta del volumen que vas a leer, usa los comandos `lsblk` ó `diskutil list` dependiendo del S.O.

```bash
sudo photorec
```

Al ejecutar la tool te va preguntando una serie de cosas como la ruta, el file system, y donde guardarás lo recuperado. Una vez que hayas indicado lo necesario empezara a buscar y recuperar, verás algo por el estilo:

```
PhotoRec 7.2, Data Recovery Utility, February 2024
Christophe GRENIER <grenier@cgsecurity.org>
https://www.cgsecurity.org

Disk /dev/disk4 - 63 GB / 59 GiB (RO)
     Partition                  Start        End    Size in sectors
 1 P FAT32 LBA                     64  124735487  124735424 [NO NAME]

Destination /Users/nicola/Documents/matias/recup_dir

Pass 1 - Reading sector    2800448/124735424, 147 files found
Elapsed time 0h01m23s - Estimated time to completion 1h00m13
jpg: 144 recovered
tx?: 2 recovered
sqlite: 1 recovered
```

Al usar `sudo` todo lo que crea dentro del directorio destino estará para el usuario `root`, al terminar vamos a cambiar los permisos:

```bash
sudo chown -R "$(whoami)" ./
```

Ahora renombramos los archivos con la nomenclatura esperada por la cámara:

```bash
i=1
for f in *.jpg; do
  printf -v new "IMG%05d.JPG" "$i"
  mv "$f" "$new"
  ((i++))
done
cp *.JPG /Volumes/NO\ NAME/IMG/
```
