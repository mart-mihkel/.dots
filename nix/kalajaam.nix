{ pkgs, lib, config, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    (import ./networking.nix { inherit lib; })
    (import ./packages.nix { inherit pkgs; })

    ./locale.nix
    ./users.nix 
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  boot = {
    loader.systemd-boot.enable = true;
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  virtualisation.docker.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "24.05";
}
