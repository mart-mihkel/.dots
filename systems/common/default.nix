{ pkgs, ... }:

{
  imports = [
    ./locale.nix
    ./users.nix
    ./hosts.nix
    ./ssh.nix
    ./ssl.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld.enable = true;

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [ 
    gnumake
    nodejs
    cargo
    tmux
    curl
    wget
    git
    gcc
    vim
    uv
  ];
}
