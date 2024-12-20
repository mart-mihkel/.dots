{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: let
    x86 = "x86_64-linux";
    arm = "aarch64-linux";

    homes = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users = {
        kubujuss = import ./homes/kubujuss;
        seire = import ./homes/seire;
      };
    };
  in {
    nixosConfigurations = {
      jaam = nixpkgs.lib.nixosSystem {
        system = "${x86}";
        modules = [
          ./systems/jaam.nix

          home-manager.nixosModules.home-manager { 
            home-manager = homes;
          }
        ];
      };

      alajaam = nixpkgs.lib.nixosSystem {
        system = "${arm}";
        modules = [
          ./systems/alajaam.nix 

          home-manager.nixosModules.home-manager { 
            home-manager = homes;
          }
        ];
      };
    };
  };
}
