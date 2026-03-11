#!/usr/bin/env bash

set -euo pipefail

if ! command -v brew; then
    echo "[Bootstrap] Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "[Bootstrap] Installing git"
    brew install git

    echo "[Bootstrap] Adding Homebrew to PATH for Apple Silicon"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ ! -d "$HOME/.dotfiles.git" ]; then
    echo "[Bootstrap] Cloning dotfiles as bare repo"
    git clone --bare git@github.com:chromebanana/my_computer.git "$HOME/.dotfiles.git"

    echo "[Bootstrap] Configuring bare repo"
    alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME/.config'
    dotfiles config status.showUntrackedFiles no
    dotfiles config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
    dotfiles fetch origin
    dotfiles branch --set-upstream-to=origin/main main

    echo "[Bootstrap] Checking out dotfiles into ~/.config"
    dotfiles checkout || {
        echo "[Bootstrap] Backing up conflicting files"
        mkdir -p "$HOME/.config-backup"
        dotfiles checkout 2>&1 | grep "^\t" | awk '{print $1}' | while read -r f; do
            mkdir -p "$HOME/.config-backup/$(dirname "$f")"
            mv "$HOME/.config/$f" "$HOME/.config-backup/$f"
        done
        dotfiles checkout
    }
fi

"$HOME/.config/install.sh"
