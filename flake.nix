{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
    }:
    {
      darwinConfigurations = {
        "Rosss-MacBook-Air" = nix-darwin.lib.darwinSystem {
          modules = [
            ./common
            ./personal
          ];
          specialArgs = { inherit inputs self; };
        };

        "ross-lovelace" = nix-darwin.lib.darwinSystem {
          modules = [
            ./common
            ./work
          ];
          specialArgs = { inherit inputs self; };
        };
      };
    };
}
