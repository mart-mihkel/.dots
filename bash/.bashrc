[[ $- != *i* ]] && return

if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    SESSION="ssh"
else
    SESSION="local"
fi

PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -f "$HOME/.cargo" ] && . "$HOME/.cargo/env"
[ -r "/usr/share/bash-completion/bash_completion" ] && . "/usr/share/bash-completion/bash_completion"

alias vi="nvim"
alias vim="nvim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias pyenv-common="source ~/.venvs/common/bin/activate"
alias jupyter-common="(source ~/.venvs/common/bin/activate && jupyter-notebook)"

if [[ -z "$TMUX" ]]; then
    tmux attach-session -t "$SESSION" || tmux new-session -s "$SESSION"
fi
