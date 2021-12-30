#!/bin/sh

set -e

if [ ! -f /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ ! -f /opt/homebrew/bin/git ]; then
    brew install git
fi

if [ ! -f /opt/homebrew/bin/starship ]; then
    brew install starship
fi

if [ ! -d ~/dotfiles ]; then
    cd && git clone git@github.com:Ryusei-0407/dotfiles.git
fi

brew bundle -v --file=~/dotfiles/Brewfile

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# Rustup
if [ ! -f ~/.cargo/bin/rustup ]; then
    curl https://sh.rustup.rs -sSf | sh
else
    rustup update
fi

stow -v -d ~/dotfiles/packages -t ~ zsh fzf git tmux .hammerspoon
stow -v -d ~/dotfiles/packages -t ~/.config config
