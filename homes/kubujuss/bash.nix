{
  programs.bash = {
    enable = true;
    historyControl = [ "ignoredups" ];

    shellAliases = {
      wake-jaam = "wol --port=9 9C:6B:00:13:EE:B0";
    };

    initExtra = ''
      PS1="\[\033[01;34m\]\W\[\033[00m\] "

      if [[ -z $TMUX ]]; then
        tmux attach-session -t $HOSTNAME || tmux new-session -s $HOSTNAME
      fi

      bind 'set show-all-if-ambiguous on'
      bind 'TAB:menu-complete'
    '';
  };
}
