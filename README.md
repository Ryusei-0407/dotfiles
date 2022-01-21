# Dotfiles

## Setup

### Make hidden files visible in the Finder

```sh
sudo defaults write com.apple.finder AppleShowAllFiles TRUE
sudo defaults read com.apple.finder AppleShowAllFiles
killall Finder
```

### Don't create .DS_Store

```sh
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores true
sudo defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```

### Enabling continuous input by pressing and holding a key

```sh
sudo defaults write -g ApplePressAndHoldEnabled -bool true
```

### Install Rosetta2

```sh
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
```

### Run install Shell Script

```sh
curl -o - https://raw.githubusercontent.com/Ryusei-0407/dotfiles/main/install.sh | sh
```

### Reboot Computer

```sh
sudo reboot
```
