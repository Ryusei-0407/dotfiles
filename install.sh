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

if ! [ -d $HOME/dotfiles ]; then
    echo >&2 "Download dotfiles"
    cd && git clone git@github.com:Ryusei-0407/dotfiles.git
fi

echo >&2 "Install any packages"
brew bundle -v --file=~/dotfiles/Brewfile

if ! [ -d $HOME/.config ]; then
    mkdir $HOME/.config
fi

if ! [ -x "$(command -v rustup)" ]; then
    echo >&2 "Install rustup"
    curl https://sh.rustup.rs -sSf | sh
fi

stow -v -d $HOME/dotfiles/packages -t $HOME zsh fzf git tmux emacs hammerspoon p10k hyper
stow -v -d $HOME/dotfiles/packages -t $HOME/.config config
