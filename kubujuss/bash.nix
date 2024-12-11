{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
    };

    initExtra = ''
      PS1="\[\033[01;34m\]\W\[\033[00m\]\$ "

      if [[ -z $SSH_TTY ]]; then 
        btop
      elif [[ -z $TMUX ]]; then
        tmux attach-session -t $HOSTNAME || tmux new-session -s $HOSTNAME
      fi
    '';
  };
}
