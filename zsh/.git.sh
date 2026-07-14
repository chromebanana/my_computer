############
# Git
############

alias gco='git checkout'
alias gcob='git checkout -b'
alias gc='git commit'
alias gca='git commit --amend'
alias gcanv='git commit --amend --no-verify'
alias gcnv='git commit --no-verify'
alias gs='git status'
alias stash='git stash'
alias pop='git stash pop'

co-author () {
        git log --author=$1 | grep -m 1 $1 | sed 's/Author/Co-authored-by/'
}

cwt() {
  # list worktrees, show only the paths
  local dir
  dir=$(git worktree list --porcelain | awk '/^worktree / {print $2}' | fzf --prompt="Worktree> ")
  if [ -n "$dir" ]; then
    # Deactivate current venv if active
    if [ -n "$VIRTUAL_ENV" ]; then
      echo "Deactivating venv: $VIRTUAL_ENV"
      deactivate
    fi

    cd "$dir" || return
    echo "Switched to worktree: $dir"

    # Activate venv in new worktree if present
    if [ -f "$dir/.venv/bin/activate" ]; then
      echo "Activating venv: $dir/.venv"
      source "$dir/.venv/bin/activate"
    fi
  fi
}
