############
# OHMYZSH SETTINGS
############

export ZSH="/Users/william.cragg/.oh-my-zsh"

#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

HYPHEN_INSENSITIVE="true"

# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd.mm.yyyy"

## Plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.

plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh
