{ pkgs, ... }:

{
    home.username = "mart";
    home.homeDirectory = "/home/mart";

    home.packages = with pkgs; [
        neofetch
        gnumake
        ripgrep
        nodejs
        rustc
        cargo
        curl
        btop
        gcc
    ];

    home.file = {
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

    programs.bash = {
        enable = true;
    };

    programs.neovim = {
        enable = true;
        vimAlias = true;
        extraPackages = with pkgs; [
            typescript-language-server
            lua-language-server
            rust-analyzer
            pyright

            prettierd
            stylua
        ];
    };

    programs.home-manager.enable = true;

    home.stateVersion = "24.05";
}
