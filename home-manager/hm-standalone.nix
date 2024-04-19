{ inputs, ... }:
{
  flake.homeConfigurations =
    let
      mkHome =
        {
          username,
          nixpkgs ? inputs.nixpkgs,
          system ? "x86_64-linux",
          extraModules ? [ ],
        }:
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            overlays = builtins.attrValues inputs.self.overlays;
            config.allowUnfree = true;
          };

          extraSpecialArgs = {
            inherit inputs;
          };

          modules = [
            ./features/git.nix
            ./features/cli.nix
            ./features/xdg.nix
            ./features/fish.nix
            ./features/tmux.nix
            ./features/non-nixos.nix

            {
              home.username = "${username}";
              home.homeDirectory = "/home/${username}";
              home.stateVersion = "24.05";
            }
          ] ++ extraModules;
        };
    in
    {

      # other user at nixos
      guest = mkHome {
        username = "guest";
        extraModules = [
          ./features/gui.nix
          ./features/bash.nix
          ./features/editor.nix
          ./features/browsers.nix
        ];
      };
    };
}
