{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      jaam = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./nix/jaam ];
      };

      uss = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [ ./nix/uss ];
      };
    };

    homeConfigurations = {
      kubujuss = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ ./kubujuss ];
      };

      kubujuss-arm = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-linux";
        modules = [ ./kubujuss ];
      };
    };
  };
}
