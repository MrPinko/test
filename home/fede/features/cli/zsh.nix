{ pkgs, lib, config, ... }:
let
  inherit (lib) mkIf;
  hasPackage = pname: lib.any (p: p ? pname && p.pname == pname) config.home.packages;
  hasExa = hasPackage "exa";
  hasNeovim = config.programs.neovim.enable;
in
{
  programs.zsh = {
    enable = true;
    # shellAbbrs = rec {
    #   jqless = "jq -C | less -r";

    #   n = "nix";
    #   nd = "nix develop -c $SHELL";
    #   ns = "nix shell";
    #   nsn = "nix shell nixpkgs#";
    #   nb = "nix build";
    #   nbn = "nix build nixpkgs#";
    #   nf = "nix flake";

    #   nr = "nixos-rebuild --flake .";
    #   nrs = "nixos-rebuild --flake . switch";
    #   snr = "sudo nixos-rebuild --flake .";
    #   snrs = "sudo nixos-rebuild --flake . switch";
    #   hm = "home-manager --flake .";
    #   hms = "home-manager --flake . switch";

    #   ls = mkIf hasExa "exa";

    #   vim = mkIf hasNeovim "nvim";
    #   vi = vim;
    #   v = vim;

    # };
    shellAliases = {
      # Clear screen and scrollback
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
    };
  };
}