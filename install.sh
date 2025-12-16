#!/bin/sh

set -e

ARCH=$(uname -m)

if ! [ $ARCH = arm64 ]; then
  echo >&2 "Error: This dotfiles support only Apple Silicon Mac."
  exit 1
fi

if ! [ -x "$(command -v brew)" ]; then
  echo >&2 "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! [ -x "$(command -v git)" ]; then
  echo >&2 "Install 'git'"
  brew install git
fi

if ! [ -x "$(command -v devenv)" ]; then
  echo >&2 "Install 'nix' and 'devenv'"
  curl -L https://github.com/NixOS/experimental-nix-installer/releases/download/0.27.0/nix-installer.sh | sh -s -- install
  nix-env --install --attr bashInteractive -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable
  nix-env --install --attr devenv -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable
fi

if ! [ -d $HOME/dotfiles ]; then
  echo >&2 "Download dotfiles"
  cd && git clone git@github.com:Ryusei-0407/dotfiles.git
fi

echo >&2 "Install any packages"
brew bundle -v --file=~/dotfiles/Brewfile

if ! [ -d $HOME/.config ]; then
  mkdir $HOME/.config
fi

stow -d $HOME/dotfiles/packages -t $HOME $(/bin/ls /Users/$(whoami)/dotfiles/packages | grep -v config | xargs)
stow -d $HOME/dotfiles/packages -t $HOME/.config config
