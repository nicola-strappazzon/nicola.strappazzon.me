+++
draft = true
title = 'git'
tags = ["bash", "git"]
+++






Forced update. Sobre escribir cambios forzando.

```bash
git add . && git commit --amend --no-edit && git push -f
```

Git pull luego de hacer `forced update`:

```bash
git fetch
git reset origin/main --hard
```
