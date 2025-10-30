+++
draft = true
title = 'git'
tags = ["bash", "git"]
+++

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
