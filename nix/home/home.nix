{ pkgs, ... }:

{
    imports = [
        (import ./nvim.nix { pkgs = pkgs; })
        ./bash.nix
        ./tmux.nix
        ./git.nix
    ];

    home = {
        username = "mart";
        homeDirectory = "/home/mart";

        packages = with pkgs; [
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

        file = {
            ".config/alacritty".source = ../../alacritty;
            ".config/waybar".source = ../../waybar;
            ".config/dunst".source = ../../dunst;
            ".config/hypr".source = ../../hypr;
            ".config/wofi".source = ../../wofi;
            ".config/nvim".source = ../../nvim;
        };

        stateVersion = "24.05";
    };

    programs.home-manager.enable = true;
}
