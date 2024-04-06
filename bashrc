#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude=tags'

alias ll='ls -lh'
alias sudo='sudo '
alias vim='nvim '
alias ctagss='ctags -R --exclude={unit_test,unit-test,ut-stubs,macosx,freertos,windows}'

complete -cf sudo

#PS1='[\u@\h \W]\$ '

parse_git_branch() {
    local branch
    if branch=$(git branch 2>/dev/null | grep '^*'); then
        printf " (%s)" "${branch:2}"
    fi
}

PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[1;33m\]\$(parse_git_branch)\[\e[00m\] $ "

PATH="/home/ranulfo/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ranulfo/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ranulfo/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ranulfo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ranulfo/perl5"; export PERL_MM_OPT;
