export ZSH_PATH="$HOME/my_configs/zsh/"
source $ZSH_PATH.git.sh
source $ZSH_PATH.python.sh
source $ZSH_PATH.history.sh
source $ZSH_PATH.fzf.sh
source $ZSH_PATH.powerline.sh
source $ZSH_PATH.zsh.sh
source $ZSH_PATH.secrets.sh

export EDITOR=vim # editor for 'crontab -e'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/Users/william.cragg/.local/bin"
