#!/usr/bin/env bash

set -euo pipefail

# Path to this script
export DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${DOTFILES}/utils.sh"
cd "${DOTFILES}"

pinfo "Creating symlinks"
find "${DOTFILES}" -name "*.symlink" | while read -r file; do
    # %.* removes all characters including and after the dot
    ln -sfv "${file}" "$HOME/.$(basename "${file%.*}" | sed 's/^\.//')"
done

pinfo "Linking Claude Code config"
mkdir -p "$HOME/.claude"
ln -sfv "${DOTFILES}/.claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
ln -sfv "${DOTFILES}/.claude/skills" "$HOME/.claude/skills"

pinfo "Installing homebrew bundle"
brewfile_path="${DOTFILES}/homebrew/brewfile"
pinfo "Installing brewfile from ${brewfile_path}"
brew bundle --file="${brewfile_path}" -v install || pwarn "bundle encountered errors, continuing"

if [ -z "${CI:-}" ]; then
    cargo install tmux-sessionizer
    tms config -p ~/projects ~/.config
    if [ ! -d ~/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
fi
