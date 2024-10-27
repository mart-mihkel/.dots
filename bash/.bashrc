[[ $- != *i* ]] && return

PS1="\[\033[01;34m\]\w\[\033[00m\]\n\[\e[1m\]〉\[\e[0m\]"

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

if [[ -z "$TMUX" ]]; then
    tmux attach || tmux new
fi

alias vim="nvim"
alias ls="ls --color"
alias grep="grep --color"

alias pyenv-common="source ~/.venvs/common/bin/activate"
alias jupyter-common="(source ~/.venvs/common/bin/activate && jupyter-notebook)"
alias jupyter-common-remote="ssh -N -f -L 8888:localhost:8888 mart@muumimaja.kleinesonne.ee"
