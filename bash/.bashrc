[[ $- != *i* ]] && return

PS1="\[\033[01;34m\]\W\[\033[00m\]\$ "

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

if [[ -z "$TMUX" ]]; then
    tmux attach || tmux
fi

alias vim="nvim"
alias ls="ls --color"
alias grep="grep --color"

alias wol-muumimaja="wol --port=9 9c:6b:00:13:ee:b0"
alias bluetooth-headset="bluetoothctl connect 14:3F:A6:DA:AA:00"

alias pyenv-common="source ~/.venvs/common/bin/activate"
alias jupyter-common="(source ~/.venvs/common/bin/activate && jupyter-notebook)"
alias jupyter-common-remote="ssh -N -f -L 8888:localhost:8888 mart@muumimaja.kleinesonne.ee"
