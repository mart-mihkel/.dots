{ pkgs, ... }:

{
    imports = [ ./hardware-configuration.nix ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.systemd-boot.enable = true;

    networking.hostName = "dell";
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Tallinn";

    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "et";
    };

    users.users.mart = {
        isNormalUser = true;
        extraGroups = [ "wheel" "network" "docker" ];
    };

    environment.systemPackages = with pkgs; [ vim ];

    virtualisation.docker.enable = true;
    services.openssh.enable = true;

    system.stateVersion = "24.05";
}

