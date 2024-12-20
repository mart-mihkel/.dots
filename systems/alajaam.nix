{ lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./common
  ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };

    initrd = {
      availableKernelModules = [ "xhci_pci" ];
      kernelModules = [ ];
    };

    kernelModules = [ ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  networking = {
    hostName = "alajaam";
    networkmanager.enable = false;
  };

  system.stateVersion = "24.05";
}
