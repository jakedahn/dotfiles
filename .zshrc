export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
export EDITOR=/usr/bin/vim
export TERM=xterm-256color

plugins=(git git-extras django pip python redis-cli systemd vagrant yarn)

source $ZSH/oh-my-zsh.sh

alias nsv='source .venv/bin/activate'
alias pwdc='echo "cd `pwd`" | xsel --clipboard'
alias dpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias dpycache='find . -name "*__pycache__" -exec rm -rf {} \;'
alias ne='PATH=$(npm bin):$PATH' # This lets us run locally installed node binaries (within the node_modules)

# This pretty-prints the contents of a jwt.
alias jwt="tr '.' '\n' | head -n2 | awk '{ a=0; while (a++<length(\$0) % 4) s=s \"=\"; print \$0 s }' | base64 --decode | jq"

export PATH=/opt/local/bin:/opt/local/sbin:/opt/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
