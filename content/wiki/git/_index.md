+++
title = 'Git'
tags = ["bash", "git"]
+++

Git es un sistema de control de versiones. Esta página reúne los comandos que uso con más frecuencia y algunos flujos de trabajo seguros.

## Configuración

Ver la configuración efectiva:

```bash
git config --list
```

Configuración básica para un equipo nuevo:

```bash
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global push.autoSetupRemote true
git config --global user.email "user@domain.com"
git config --global user.name "Fulano Mengano"
```

Cambiar la URL remota de un repositorio:

```bash
git remote -v
git remote set-url origin <nueva_url_git>
```

## Ramas

Consultar la rama actual y las ramas disponibles:

```bash
git branch
git branch --all
```

Cambiar a una rama ya existente:

```bash
git switch main
```

Crear una rama y cambiarse a ella:

```bash
git switch -c feature/foo
```

## Registrar cambios

Antes de crear un commit, revisar qué se ha modificado:

```bash
git status
git diff
```

Añadir los cambios y confirmar el trabajo:

```bash
git add <archivo>
git commit -m "feat: añadir búsqueda de usuarios"
```

Evitar `git add .` cuando no se haya revisado el estado: puede incluir archivos que no deberían formar parte del commit.

### Conventional Commits

[Conventional Commits](https://www.conventionalcommits.org/es/v1.0.0/) propone un formato consistente para los mensajes de commit:

```text
tipo(alcance opcional): descripción breve
```

- `feat`: nueva funcionalidad.
- `fix`: corrección de un error.
- `refactor`: mejora interna sin cambiar el comportamiento esperado.
- `docs`: cambios en la documentación.
- `test`: añadir o ajustar pruebas.
- `chore`: tareas rutinarias, mantenimiento o configuración sin afectar al código fuente.
- `style`: cambios de formato que no afectan a la lógica.
- `build`: cambios en la construcción, dependencias o empaquetado.
- `ops`: cambios operacionales, por ejemplo IaC o CI/CD.
- `perf`: mejora de rendimiento.

Un buen commit explica qué cambió y por qué. Para más ejemplos, consultar la [guía de tipos de commit](https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13).

## Sincronizar con el remoto

Enviar la rama actual al remoto:

```bash
git push
```

Traer e integrar los cambios remotos. Con `pull.rebase=true`, configurado arriba, Git reubica los commits locales sobre la última versión remota:

```bash
git pull
```

Una *pull request* permite revisar los cambios antes de integrarlos en otra rama. Conviene comprobar el diff, las pruebas y los comentarios antes de aprobarla.

## Reescribir el último commit

Para incluir cambios olvidados sin modificar el mensaje del último commit:

```bash
git add <archivo>
git commit --amend --no-edit
```

Para cambiar su mensaje:

```bash
git commit --amend
```

Si el commit ya se había publicado, habrá que actualizar el remoto. Preferir siempre `--force-with-lease`, que evita sobrescribir trabajo remoto que no tenemos localmente:

```bash
git push --force-with-lease
```

{{% blockquote type="warning" %}}
Reescribir historial compartido puede complicar el trabajo de otras personas. Confirmar antes que nadie depende de esos commits.
{{% /blockquote %}}

## Unir commits con rebase interactivo

Para unir los tres últimos commits en uno:

```bash
git rebase -i HEAD~3
```

En el editor, dejar el primer commit como `pick` y cambiar los siguientes a `squash` (o `s`). Guardar, cerrar y editar el mensaje del nuevo commit. Si esos commits ya estaban en el remoto, publicar el historial reescrito:

```bash
git push --force-with-lease
```

## Rebase de una rama sobre `main`

Actualizar la rama base y reubicar una rama de trabajo sobre ella:

```bash
git switch main
git pull
git switch TICKET-123
git rebase main --rebase-merges
```

Si termina con `Successfully rebased and updated refs/heads/TICKET-123.`, el rebase ha finalizado correctamente. Después se puede actualizar la rama remota:

```bash
git push --force-with-lease origin TICKET-123
```

Si aparecen conflictos, Git indicará los archivos afectados. Resolverlos, validar el resultado y continuar:

```bash
git status
# editar los archivos en conflicto
git add <archivos_resueltos>
git rebase --continue
```

Para aceptar por completo una versión durante un rebase:

```bash
# La versión de la rama sobre la que se está aplicando el commit
git checkout --ours -- <archivo>

# La versión del commit que se está reaplicando
git checkout --theirs -- <archivo>
```

En un rebase, el significado de `ours` y `theirs` puede resultar contraintuitivo: revisar siempre el contenido del archivo antes de añadirlo. Si se quiere cancelar todo el proceso y volver al estado anterior:

```bash
git rebase --abort
```

## Cambios temporales con stash

Listar los cambios guardados:

```bash
git stash list
```

Guardar los cambios actuales, opcionalmente con un comentario:

```bash
git stash
git stash push -m "descripción del cambio"
```

Aplicar el último stash, uno concreto, o aplicarlo y eliminarlo:

```bash
git stash apply
git stash apply stash@{1}
git stash pop
```

Eliminar un stash o todos los stashes:

```bash
git stash drop stash@{0}
git stash clear
```

## Recuperar el estado remoto

Tras un *force push* de otra persona, primero revisar qué cambiaría:

```bash
git fetch origin
git log --oneline HEAD..origin/main
```

Si se quiere descartar los cambios locales de `main` y dejarla igual que el remoto:

```bash
git switch main
git reset --hard origin/main
```

{{% blockquote type="warning" %}}
`git reset --hard` descarta los cambios locales no confirmados. Guardarlos o usar `git stash` antes si se necesitan.
{{% /blockquote %}}

## Tags

Crear y publicar un tag:

```bash
git tag v0.1.0
git push origin v0.1.0
```

Eliminar un tag local y remoto:

```bash
git push origin --delete v0.1.0
git tag -d v0.1.0
```
