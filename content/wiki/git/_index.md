+++
title = 'git'
tags = ["bash", "git"]
+++

Ver tu configuración:

```bash
git config --list
```

Configuración básica:

```bash
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global push.autoSetupRemote true
git config --global user.email nicola@strappazzon.me
git config --global user.name "Nicola Strappazzon."
```

Renombrar URL del repositorio:

```bash
git remote -v
git remote set-url origin <new_git_url>
```

Forzando a sobrescribir cambios:

```bash
git add . && git commit --amend --no-edit && git push -f
```

Git pull luego de hacer `forced update`:

```bash
git fetch
git reset origin/main --hard
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
