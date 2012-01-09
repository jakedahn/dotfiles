alias ll="ls -l"
alias la="ls -al"
alias tailf="tail -f"
alias cd..="cd .."

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

export PS1='\[\e[1;32m\][\W\[\e[1;31m\]$(parse_git_branch)\[\e[0m\]\[\e[1;32m\]]\$\[\e[0m\] '

export PATH=$PATH:/usr/local/sbin:/usr/local/Cellar/python/*/bin:/usr/local/share/python
