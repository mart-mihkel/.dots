{ pkgs, ... }:

{
  imports = [
    (import ./gpu.nix { inherit pkgs; })
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
 
  time.timeZone = "Europe/Tallinn";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "et";
  };

  environment.systemPackages = with pkgs; [ 
    tmux 
    curl 
    wget 
    git 
    vim 
  ];

  virtualisation.docker.enable = true;
  services.openssh.enable = true;

  system.stateVersion = "24.05";
}
