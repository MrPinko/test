{
  lib,
  inputs,
  pkgs,
  ...
}:
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = builtins.attrValues inputs.self.overlays;
  };

  nix = {

    # nix config show nix-path | tr " " "\n"
    nixPath = lib.mapAttrsToList (name: path: "${name}=${path}") inputs ++ [
      "nixos-config=${inputs.self}"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };

    package = pkgs.nixVersions.unstable;

    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      auto-allocate-uids = true;
      use-cgroups = true;
      # max-jobs = 8; # limit the number of parallel jobs
      flake-registry = ""; # disable global registry

      # for direnv GC roots
      # keep-outputs = true;
      # keep-derivations = true;

      substituters = [
        "https://nix-community.cachix.org"
      ];

      trusted-users = [
        "root"
        "@wheel"
      ];
      # List of binary cache URLs that non-root users can use
      trusted-substituters = [ ];
      trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];

      experimental-features = [
        "flakes"
        "nix-command"
        # "configurable-impure-env"

        # Allows Nix to automatically pick UIDs for builds, rather than creating nixbld* user accounts
        "auto-allocate-uids"

        # Allows Nix to execute builds inside cgroups
        "cgroups"
      ];
    };
  };
}