{ lib, config, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./jupyterhub
    ./common
    ./cuda
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot = {
    loader.systemd-boot.enable = true;

    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
      kernelModules = [ ];
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    "/media/ssd-256gb-sata" = {
      device = "/dev/disk/by-label/ssd-256gb-sata";
      fsType = "ext4";
    };

    "/media/hdd-1tb-sata" = {
      device = "/dev/disk/by-label/hdd-1tb-sata";
      fsType = "ext4";
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  networking = {
    hostName = "jaam";

    networkmanager.enable = false;

    interfaces.enp9s0.wakeOnLan.enable = true;
    firewall.allowedUDPPorts = [ 9 ];
  };

  system.stateVersion = "24.05";
}
