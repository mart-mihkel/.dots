{
  networking = {
    hostName = "muumimaja";

    networkmanager.enable = false;

    firewall.allowedTCPPorts = [ 22 ];
    firewall.allowedUDPPorts = [ 9 ];

    interfaces.enp9s0.wakeOnLan.enable = true;

    hosts = {
      "192.168.10.3" = [ "dell" ];
    };
  };
}
