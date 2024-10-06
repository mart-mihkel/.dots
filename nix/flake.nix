{
    description = "nas flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { nixpkgs, home-manager, ... }:
    let
        system = "x86_64-linux";
    in
    {
        nixosConfigurations = {
            nas = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [ ./configuration.nix ];
            };
        };
        homeConfigurations  = {
            mart = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system};
                modules = [ ./home.nix ];
            };
        };
    };
}
