{
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    extraConfig = ''
      set -g status-left-length 32

      set -g status-bg "#181818"
      set -g status-fg "#f8f8f8"
      set -g status-right ""
    '';
  };
}
