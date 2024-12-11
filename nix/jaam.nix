{ pkgs, lib, config, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./common.nix
    ./cachix.nix 
    ./nvidia.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
    config.allowUnfree = true;
  };

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

  fileSystems."/media/ssd-256gb-sata" = {
    device = "/dev/disk/by-uuid/2ce0b7e8-7a9f-4a76-94ec-ad7b54205db9";
    fsType = "ext4";
  };

  fileSystems."/media/hdd-1tb-sata" = {
    device = "/dev/disk/by-uuid/9cccec85-218d-4db8-a00a-e00e1275a2ac";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  virtualisation.docker.enable = true;

  services.getty.autologinUser = "kubujuss";
  services.openssh.enable = true;

  system.stateVersion = "24.05";
}
