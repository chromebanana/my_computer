#!/usr/bin/env bash

set -euo pipefail

if [ ! -d "$HOME/.dotfiles" ]; then
    echo "[Bootstrap] Cloning dotfiles"
    git clone --recursive https://github.com/chromebanana/my_computer.git "$HOME/.dotfiles"
fi

# install homebrew
if ! command -v brew; then
    echo "[Bootstrap] Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd "$HOME/.dotfiles"
./install.sh