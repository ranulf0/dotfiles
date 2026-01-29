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

kd() {
    local selection
    # 1. Find both files (-type f) and directories (-type d)
    # 2. Sort by depth so shallow items appear first
    # 3. Pass to fzf for selection
    selection=$(find . -not -path '*/.*' \( -type d -o -type f \) 2> /dev/null | \
        awk -F/ '{print NF, $0}' | \
        sort -n -s | \
        cut -d" " -f2- | \
        fzf --tmux=center,70% --border-label="Files and Directories" --style=minimal)

    # Exit early if nothing was selected (Esc/Ctrl-C)
    [[ -z "$selection" ]] && return

    if [[ -d "$selection" ]]; then
        # If it's a directory, change into it
        cd "$selection"
    else
        # If it's a file, copy the path to clipboard
        echo -n "$selection" | xclip -selection clipboard
    fi
}
