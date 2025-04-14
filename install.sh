#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/utils.sh"

cd "$(dirname ${0})"

shopt -s globstar nullglob

pinfo "Installing homebrew bundle"
brewfile_path="${dirpath}/homebrew/brewfile"
pinfo "Installing brewfile from ${brewfile_path}"
pwarn "Some commands may require sudo priviledges"
brew bundle --file="${brewfile_path}" -v --no-lock install || pwarn "bundle encoutered errors, continuing"