{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        jaam = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./nix/jaam ];
        };

        uss = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./nix/uss ];
        };
      };

      homeConfigurations  = {
        kubujuss = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./kubujuss ];
        };
      };
    };
}
