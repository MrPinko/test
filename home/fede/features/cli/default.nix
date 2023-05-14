{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./starship.nix
    ./ranger.nix
    ./htop.nix
  ];
  home.packages = with pkgs; [
    neofetch
  ];
}