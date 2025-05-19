#!/usr/bin/env bash

set -euo pipefail

# install homebrew
if ! command -v brew; then
    echo "[Bootstrap] Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "[Bootstrap] Installing git"
    brew install git

    echo "[Bootstrap] Adding Homebrew to PATH for Apple Silicon"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ ! -d "$HOME/.dotfiles" ]; then
    echo "[Bootstrap] Cloning dotfiles"
    git clone --recursive https://github.com/chromebanana/my_computer.git "$HOME/.dotfiles"
fi



cd "$HOME/.dotfiles"
./install.sh