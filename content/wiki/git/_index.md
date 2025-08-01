+++
draft = true
title = 'git'
tags = ["bash", "git", "json"]
+++






Forced update

```bash
git add . && git commit --amend --no-edit && git push -f
```

Git pull after forced update

```bash
git fetch
git reset origin/main --hard
```
