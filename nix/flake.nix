{
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
            muumimaja = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [ ./muumimaja/configuration.nix ];
            };
        };

        homeConfigurations  = {
            kubujuss = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system};
                modules = [ ./home/home.nix ];
            };
        };
    };
}
