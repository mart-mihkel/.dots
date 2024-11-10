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
        username = "kubujuss";
        homeDirectory = "/home/kubujuss";
        packages = with pkgs; [
            neofetch
            gnumake
            ripgrep
            nodejs
            rustc
            cargo
            gcc
        ];

        stateVersion = "24.05";
    };
}
