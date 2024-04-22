{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      mkHost =
        {
          hostname,
          username,
          nixpkgs ? inputs.nixpkgs,
          system ? "x86_64-linux",
          defaultModules ? true,
          hmEnable ? true,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs self username;
          };
          modules =
            [
              # nixos setup
              { networking.hostName = "${hostname}"; }
            ]
            ++ nixpkgs.lib.optionals hmEnable [
              # home-manager module
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  backupFileExtension = "hm_bak~";
                  extraSpecialArgs = {
                    inherit inputs;
                  };
                  users.${username} = import ../home-manager/${username};
                };
              }
            ]
            ++ nixpkgs.lib.optionals defaultModules [ self.nixosModules.default ]
            ++ extraModules;
        };
    in
    {

	  # sudo nixos-rebuild switch --flake .#desktop
      desktop = mkHost {
        username = "pinko";
        hostname = "desktop";
        extraModules = [ ./desktop ];
      };

	  # sudo nixos-rebuild switch --flake .#wsl
	  # or
      # nix build .#nixosConfigurations.wsl.config.system.build.tarballBuilder
      wsl = mkHost {
        username = "pinko";
        hostname = "wsl";
        defaultModules = false;
        extraModules = [
          ./wsl
          ../nixos/fonts.nix
          ../nixos/nixconfig.nix
          inputs.nixos-wsl.nixosModules.wsl
		  inputs.vscode-server.nixosModules.default
        ];
      };
    };
}
