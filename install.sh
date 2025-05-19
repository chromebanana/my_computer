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

pinfo "Installing homebrew bundle"
brewfile_path="${DOTFILES}/homebrew/brewfile"
pinfo "Installing brewfile from ${brewfile_path}"
brew bundle --file="${brewfile_path}" -v install || pwarn "bundle encountered errors, continuing"

pinfo "Running topic installers"
find "${DOTFILES}" -name 'install.sh' -mindepth 2 -print0 | while read -rd $'\0' file; do
    pinfo "Running installer ${file}"
    bash -eu -o pipefail "${file}"
done