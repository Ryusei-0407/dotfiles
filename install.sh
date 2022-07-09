#!/bin/sh

set -e

ARCH=$(uname -m)

if ! [ $ARCH = arm64 ]; then
    echo >&2 "Error: This dotfiles support only Apple Silicon Mac."
    exit 1
fi

if ! [ -x "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! [ -x "$(command -v git)" ]; then
    brew install git
fi

if [ ! -d $HOME/dotfiles ]; then
    cd && git clone git@github.com:Ryusei-0407/dotfiles.git
fi

brew bundle -v --file=~/dotfiles/Brewfile

if [ ! -d $HOME/.config ]; then
    mkdir $HOME/.config
fi

# Rust
if ! [ -x "$(command -v rustup)" ]; then
    curl https://sh.rustup.rs -sSf | sh
fi

stow -v -d $HOME/dotfiles/packages -t $HOME zsh fzf git tmux hammerspoon p10k
stow -v -d $HOME/dotfiles/packages -t $HOME/.config config
