# Dotfiles

## Setup

### Make hidden files visible in the Finder

```sh
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "scale"
defaults write com.apple.dock "mru-spaces" -bool "false"
```

```sh
defaults write com.apple.finder AppleShowAllFiles TRUE
defaults read com.apple.finder AppleShowAllFiles
killall Finder
```

### Don't create .DS_Store

```sh
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```

### Enabling continuous input by pressing and holding a key

```sh
defaults write -g ApplePressAndHoldEnabled -bool true
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
