#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "

CMP=/usr/share/bash-completion/bash_completion
[ -r "$CMP" ] && . "$CMP"

[ -f "$HOME/.cargo" ] && . "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias vi="nvim"
alias vim="nvim"
alias ls="ls --color=auto"
alias pyenv="source ~/.venvs/common/bin/activate"
