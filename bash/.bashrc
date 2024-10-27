[[ $- != *i* ]] && return

PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "

if [[ -r "/usr/share/bash-completion/bash_completion" ]]; then
    source "/usr/share/bash-completion/bash_completion"
fi

if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    SESSION="ssh"
else
    SESSION="local"
fi

if [[ -z "$TMUX" ]]; then
    tmux attach-session -t "$SESSION" || tmux new-session -s "$SESSION"
fi

alias vim="nvim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias pyenv-common="source ~/.venvs/common/bin/activate"
alias jupyter-common="(source ~/.venvs/common/bin/activate && jupyter-notebook)"
alias jupyter-common-ssh="ssh -N -f -L 8888:localhost:8888 mart@muumimaja.kleinesonne.ee"
