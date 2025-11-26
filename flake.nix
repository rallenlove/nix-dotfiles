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
    let
      themeName = "catppuccin";
      theme = (import ./common/home/themes.nix).${themeName};
      specialArgs = {
        inherit inputs self theme;
      };
    in
    {
      darwinConfigurations = {
        "Rosss-MacBook-Air" = nix-darwin.lib.darwinSystem {
          modules = [
            ./common
            ./personal
          ];
          inherit specialArgs;
        };

        "ross-lovelace" = nix-darwin.lib.darwinSystem {
          modules = [
            ./common
            ./work
          ];
          inherit specialArgs;
        };
      };
    };
}
