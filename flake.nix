{
  description = "Your new nix config";

  nixConfig = {
    extra-substituters = [ "https://cache.m7.rs" ];
    extra-trusted-public-keys = [ "cache.m7.rs:kszZ/NSwE/TjhOcPPQ16IuUiuRSisdiIwhKZCxguaWg=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      user = "fede";

      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];

      # function for loading nixos configurations
      mkNixos = modules: nixpkgs.lib.nixosSystem {
        inherit modules;
        specialArgs = { inherit inputs outputs; };
      };

      # function for loading home configurations
      mkHome = modules: pkgs: home-manager.lib.homeManagerConfiguration {
        inherit modules pkgs;
        extraSpecialArgs = { inherit inputs outputs; };
      };

      pkgs = nixpkgs.legacyPackages."x86_64-linux";

    in
    {
      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      overlays = import ./overlays { inherit inputs outputs pkgs; };

      # NixOS configuration entrypoint
      # Available through 'sudo nixos-rebuild switch --flake .#your-hostname'
      # sudo nixos-rebuild switch --flake ~/.config/dotnix/#desktop
      nixosConfigurations = {
        desktop = mkNixos [ ./hosts/desktop ];
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager switch --flake ~/.config/dotnix/#your-username@your-hostname'
      # home-manager switch --flake ~/.config/dotnix/#fede@desktop
      homeConfigurations = {
        "fede@desktop" = mkHome [ ./home/fede/desktop.nix ] pkgs;
      };
    };
}
