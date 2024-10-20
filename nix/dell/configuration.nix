{ pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix 
        ./networking.nix
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.systemd-boot.enable = true;

    time.timeZone = "Europe/Tallinn";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "et";
    };

    users.users.mart = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" ];
    };

    environment.systemPackages = with pkgs; [ vim tmux ];
    virtualisation.docker.enable = true;
    services.openssh.enable = true;
    system.stateVersion = "24.05";
}

