{ lib, config, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ./filesystems.nix
    ./networking.nix
    ./jupyterhub.nix
    ./nvidia.nix
    ./cachix.nix
    ./boot.nix

    ../common
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  system.stateVersion = "24.05";
}
