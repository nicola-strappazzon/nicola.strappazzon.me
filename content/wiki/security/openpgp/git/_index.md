+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'GitHub'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

# GitHUB

Para usar [GPG con GitHub](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key), hacer lo siguiente:

```bash
git config --global --unset gpg.format
git config --global user.signingkey 9186C4129FFD3D2500B35FA18E97CAEEEE861364
git config --global commit.gpgsign true
git config --global tag.gpgSign true
if [ -r ~/.bash_profile ]; then echo -e '\nexport GPG_TTY=$(tty)' >> ~/.bash_profile;   else echo -e '\nexport GPG_TTY=$(tty)' >> ~/.profile; fi
brew install pinentry-mac
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
```
