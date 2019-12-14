# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function cd_up() {
    cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias gc='git checkout'
alias gp='git pull'
alias gb='git branch'
alias s='git status'
alias grpo='git remote prune origin'
alias c='clear'