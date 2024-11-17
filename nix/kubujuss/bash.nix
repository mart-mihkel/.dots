{
    programs.bash = {
        enable = true;
        shellAliases = {
            ls = "ls --color=auto";
            grep = "grep --color=auto";
            pyenv-common = "nix-shell ~/git/dotfiles/nix/shells/py-common.nix";
        };

        initExtra = ''
            PS1="\[\033[01;34m\]\W\[\033[00m\]\$ "

            SESSION="$HOSTNAME"
            if [[ -z $TMUX ]]; then
                tmux attach-session -t $SESSION || tmux new-session -s $SESSION
            fi
        '';
    };
}
