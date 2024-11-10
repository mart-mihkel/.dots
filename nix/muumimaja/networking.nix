{
    boot.kernelModules = [ "iwlwifi" ];

    networking = {
        hostName = "nas";
        firewall.enable = false;
        networkmanager.enable = false;

        hosts = {
            "192.168.10.3" = [ "dell" ];
        };

        interfaces = {
            enp9s0 = {
                useDHCP = false;
                wakeOnLan.enable = true;
                ipv4.addresses = [ {
                    address = "192.168.10.2";
                    prefixLength = 24;
                } ];
            };
        };
    };
}
