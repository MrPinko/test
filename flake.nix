{
  description = "NIX SAVE THE WORLD";

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
	  vscode-server,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        ./hosts
        ./nixos
        ./overlays
      ];

      perSystem =
        {
          inputs',
          pkgs,
          system,
          ...
        }:
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = builtins.attrValues self.overlays;
            config = {
              allowUnfree = true;
            };
          };

          # access pkgs from self & overlays
          legacyPackages = pkgs;

          # nix develop .#rust
          devShells = import ./devshells.nix { inherit pkgs; };
        };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
	vscode-server.url = "github:nix-community/nixos-vscode-server";
  };
}
