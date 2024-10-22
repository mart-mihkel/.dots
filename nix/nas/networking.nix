{
    boot.kernelModules = [ "iwlwifi" ];

    networking = {
        hostName = "nas";
        firewall.enable = false;
        networkmanager.enable = false;

        hosts = {
            "192.168.239.247" = [ "dell" ];
            "192.168.0.2" = [ "dell-eth" ];
        };

        wireless = {
            enable = true;
            networks.kanamees54.psk = "pooltaldrikutonsalat";
        };

        interfaces = {
            wlp8s0.wakeOnLan.enable = true;
            enp9s0 = {
                useDHCP = false;
                wakeOnLan.enable = true;
                ipv4.addresses = [ {
                    address = "172.16.0.1";
                    prefixLength = 24;
                } ];
            };
        };
    };
}
