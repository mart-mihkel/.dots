{
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    initExtra = ''
      tmux attach-session -t seire || tmux new-session -s seire btop
    '';
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g status off
    '';
  };

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      update_ms = 500;
    };
  };

  home = {
    username = "seire";
    homeDirectory = "/var/seire";

    stateVersion = "24.05";
  };
}
