+++
title = 'git'
tags = ["bash", "git"]
+++

Ver tu configuración:

```bash
git config --list
```

Configuración básica:

````bash
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global push.autoSetupRemote true
git config --global user.email user@domain.com
git config --global user.name "Fulano Mengano"
````

Renombrar URL del repositorio:

```bash
git remote -v
git remote set-url origin <new_git_url>
```

cambiar de rama

git switch -c feature/foo



Registrar cambios

[Conventional Commits](https://www.conventionalcommits.org/es/v1.0.0/) https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13

- feat: Nueva funcionalidad.
- fix: Corrección de un error.
- refactor: Mejoras en el código sin alterar funcionalidad.
- docs: Documentacíon.
- test: Pruebas.
- chore: Actividades rutinarias ... , Mantenimiento o configuración que no afecta al codigo fuente.
- style: 
- build: 
- ops: Cambios en aspectos operacionales cómo IaC o CI/CD.

- perf: 

Un buen commit te ayuda a entender que cambió y por qué.


Sincronizar el código

git push y git pull

Pull Request

Revisar antes de integrar.



Forzando a sobrescribir cambios:

```bash
git add . && git commit --amend --no-edit && git push -f
```

Git pull luego de hacer `forced update`:

```bash
git fetch
git reset origin/main --hard
git pull
```

Unir los últimos 3 commits en uno reescribiendo el historial remoto:

```bash
git rebase -i HEAD~3
```

Se abrira un editor de texto, deja el primero `pick` y el resto renombralos como `squash`, guarda y cierra. Luego git te pedirá editar el mensaje del nuevo commit unico, guarda y cierra. Ahora podrás hacer `git push --force`.

Editar el mensaje del último commit.

```bash
git commit --amend
```

Se abrira un editor de texto para modificar el mensaje, guarda y cierra. Hahora podrás hacer `git push --force`.

Crear un tag

```bash
git tag v0.1.0
git push origin v0.1.0
```

Eliminar un tag

```bash
git push origin --delete v0.1.0
git tag -d v0.1.0
```

## Cambios temporales

Listar

```bash
git stash list
```

Guardar

```bash
# Guarda
git stash
# Guardar con comentario
git stash push -m "comment.."
```

Recuperar o aplicar

```bash
# Aplicar el último
git stash apply
# Aplicar uno en específico
git stash apply stash@{1}
# Aplicar y eliminar
git stash pop
```

Eliminar

```bash
# Borrar uno en específico
git stash drop stash@{0}
# Borrar todos
git stash clear
```

## Rebase



```bash
git checkout main
git pull
git checkout TICKET-123
git rebase main --rebase-merges
```

Si muestra el mensaje `Successfully rebased and updated refs/heads/TICKET-123.` es que todo ha ido bien y podemos ejecutar el siguiente comando.

```bash
git push --force-with-lease origin KITT-518
```

Si hay conflictos verás un mensaje cómo `CONFLICT (content): Merge conflict in ...`

... haces los cambios si hay conflicto ...

git checkout --ours -- libs/agent/agent_brand_general.go
git checkout --ours -- 

... compilar y validar que todo esta bien es un paso adicional ...

git add .
git rebase --continue
git push --force-with-lease


git rebase --abort
