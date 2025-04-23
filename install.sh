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
brew bundle --file="${brewfile_path}" -v install || pwarn "bundle encountered errors, continuing"