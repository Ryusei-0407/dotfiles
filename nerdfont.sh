#!/bin/bash

set -e

if [ $# != 1 ]; then
    echo "Invalid arguments"
    exit 1
fi

if ! [ -d "$1" ]; then
    echo "Invalid directory"
    exit 1
fi

echo >&2 "Installing Nerd Fonts..."

git clone git@github.com:ryanoasis/nerd-fonts.git

if ! [ -x "$(command -v fontforge)" ]; then
    echo >&2 "Install fontforge"
    brew install fontforge
fi

fontforge -script ./nerd-fonts/font-patcher $1 -c

echo >&2 "Delete nerd-fonts"
rm -rf nerd-fonts

read -p "Do you want to delete fontforge? [y/N] " yn

case $yn in
    [Yy]* )
        echo >&2 "Uninstall fontforge"
        brew uninstall -f fontforge
        ;;
    * )
        ;;
esac


echo >&2 "Done"
