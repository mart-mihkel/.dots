{ lib, ... }:

{
  networking = {
    hostName = "uss";
    useDHCP = lib.mkDefault true;

    networkmanager.enable = false;

    firewall.allowedUDPPorts = [ 9 ];
    interfaces.enp9s0.wakeOnLan.enable = true;
  };
}
