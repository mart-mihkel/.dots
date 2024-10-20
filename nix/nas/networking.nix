{
    boot.kernelModules = [
        "nct6775"
    ];

    networking = {
        hostName = "nas";
        networkmanager.enable = false;
        firewall.allowedTCPPorts = [ 22 ];

        wireless = {
            enable = true;
            networks."kanamees54".psk = "pooltaldrikutonsalat";
        };

        interfaces."enp9s0" = {
            useDHCP = false;
            ipv4.addresses = [ {
                address = "192.168.1.2";
                prefixLength = 24;
            } ];
        };
    };
}
