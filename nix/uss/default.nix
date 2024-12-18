{ lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ./filesystems.nix
    ./networking.nix
    ./boot.nix

    ../common
  ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";

  system.stateVersion = "24.05";
}
