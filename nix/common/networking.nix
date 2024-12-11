{ lib, ... }:

{
  networking = {
    hostName = "jaam";
    useDHCP = lib.mkDefault true;

    networkmanager.enable = false;

    firewall.allowedTCPPorts = [ 22 ];
    firewall.allowedUDPPorts = [ 9 ];

    interfaces.enp9s0.wakeOnLan.enable = true;

    hosts = {
      "192.168.10.2" = [ "jaam" ];
      "192.168.10.3" = [ "dell" ];
      "192.168.10.4" = [ "kalajaam" ];
    };
  };
}
