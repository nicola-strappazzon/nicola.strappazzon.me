+++
draft = false
title = 'Settings'
+++

## To play X, stop playing on another device.

```bash
defaults write com.apple.Music no-bouncing -bool TRUE
```

## Upgrade Bash

```bash
brew update && brew install bash
sudo bash -c 'echo /opt/homebrew/Cellar/bash/5.2.37/bin/bash >> /etc/shells' && sudo -k
chsh -s /opt/homebrew/Cellar/bash/5.2.37/bin/bash
```

## Disk Not Ejected

```bash
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd
```

## How to disable System Integrity Protection and enable it

```bash
csrutil disable
```

## Globally disabling the assessment system needs to be confirmed in System Settings.

```bash
spctl --master-disable
```
