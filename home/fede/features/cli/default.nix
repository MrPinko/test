{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./starship.nix
    ./ranger.nix
  ];
  home.packages = with pkgs; [
    htop
    neofetch
  ];
}