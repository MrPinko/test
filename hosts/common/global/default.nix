# This file (and the global directory) holds config that i use on all hosts
{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./auto-upgrade.nix
    ./locale.nix
    ./steam-hardware.nix
    ./zsh.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  nix.settings.experimental-features = [ "nix-command" "flakes" "repl-flake" ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
}
