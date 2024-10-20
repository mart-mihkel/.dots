{ pkgs, ... }:

{
    imports = [
        (import ./nvim.nix { pkgs = pkgs; })
        ./bash.nix
        ./tmux.nix
        ./git.nix
    ];

    programs.home-manager.enable = true;

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

        stateVersion = "24.05";
    };
}
