# DESKTOP CONFIGURATION

{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    # minimal configuration 
    ./global

    ./features/web/chromium.nix

    ./features/programs/discord.nix
    ./features/programs/alacritty.nix
    ./features/programs/thunar.nix

    # games
    #./features/games
    #./features/games/honkers.nix
  ];

}
