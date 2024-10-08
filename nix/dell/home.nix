{ pkgs, ... }:

{
    home.username = "mart";
    home.homeDirectory = "/home/mart";

    home.packages = with pkgs; [
        neofetch
        gnumake
        ripgrep
        neovim
        nodejs
        rustc
        cargo
        curl
        btop
        gcc
        git
    ];

    home.file = {
        ".bash_profile".source = ../bash/.bash_profile;
        ".bashrc".source = ../bash/.bashrc;

        ".config/alacritty".source = ../alacritty;
        ".config/waybar".source = ../waybar;
        ".config/dunst".source = ../dunst;
        ".config/hypr".source = ../hypr;
        ".config/wofi".source = ../wofi;
        ".config/nvim".source = ../nvim;
    };

    programs.git = {
        enable = true;
        userName = "mart-mihkel";
        userEmail = "mart.mihkel.aun@gmail.com";
        extraConfig.core.editor = "nvim";
    };

    programs.home-manager.enable = true;

    home.stateVersion = "24.05";
}
