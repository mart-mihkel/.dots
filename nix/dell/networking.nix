{
    networking = {
        hostName = "dell";
        networkmanager.enable = true;

        interfaces."enp0s31f6" = {
            useDHCP = false;
            ipv4.addresses = [ {
                address = "192.168.1.1";
                prefixLength = 24;
            } ];
        };
    };
}
