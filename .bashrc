# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude=tags'

alias ll='ls -lh'
alias lll='ls -lha'
alias sudo='sudo '
alias vim='nvim '
alias v='nvim '

complete -cf sudo

parse_git_branch() {
    local branch
    if branch=$(git branch 2>/dev/null | grep '^*'); then
        printf " (%s)" "${branch:2}"
    fi
}

PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[1;33m\]\$(parse_git_branch)\[\e[00m\] $ "
