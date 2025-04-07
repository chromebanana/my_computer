#!/usr/bin/env bash

set -euo pipefail

if [ ! -d "$HOME/.dotfiles" ]; then
    echo "[Bootstrap] Cloning dotfiles"
    git clone --recursive https://github.com/chromebanana/my_computer.git "$HOME/.dotfiles"
fi

cd "$HOME/.dotfiles"
./install.sh