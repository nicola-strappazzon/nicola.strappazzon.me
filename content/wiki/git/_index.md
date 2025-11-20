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
