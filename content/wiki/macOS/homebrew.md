+++
draft = false
title = 'Homebrew'
+++

```bash
brew update
brew install --cask 1password-cli # Command-line interface for 1Password.
brew install --cask chatgpt       # ChatGPT Desktop.
brew install --cask freelens      # Kubernetes IDE.
brew install --cask insomnia      # API Client.
brew install --cask iterm2        # Terminal emulator.
brew install --cask librewolf     # Web browser.
brew install --cask pgadmin4      # PostgreSQL Client.
brew install --cask viscosity     # OpenVPN Client.
brew install ast-grep             # grep/sed alternative.
brew install atuin                # History.
brew install awscli               # Amazon Web Service CLI.
brew install azure-cli            # Azure CLI.
brew install bash
brew install bash-completion@2
brew install bat
brew install btop
brew install colima               # Container runtimes on macOS (and Linux) with minimal setup.
brew install font-hack-nerd-font
brew install fzf
brew install gh                   # GitHub CLI
brew install glow                 # Markdown.
brew install go                   # The GO programming language.
brew install helix
brew install jq
brew install kubernetes-cli       # kubectl.
brew install lsd
brew install m1ddc                # Display manager.
brew install macfuse
brew install mcat                 # View images or videos on terminal.
brew install percona-toolkit      # Percona toolkit.
brew install resterm              # Terminal API Client.
brew install sequel-ace           # MySQL Client for MAC OS
brew install superfile
```

Configura tu terminal (iTerm2) para que use el nuevo bash con la siguiente ruta `/opt/homebrew/bin/bash`. No olvides de revisar la versión del básh con `echo $BASH_VERSION`

Recuerda que algunas aplicaciones pierden sus privilegios luego de ser actualizadas, por lo que deberás asignarlos nuevamente de forma manual hasta que esto se haya resuelto en `homebrew`.

```bash
xattr -dr com.apple.quarantine /Applications/LibreWolf.app
```
