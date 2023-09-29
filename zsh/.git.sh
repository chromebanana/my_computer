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

