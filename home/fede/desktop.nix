# DESKTOP CONFIGURATION

{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    # minimal configuration 
    ./global

    # desktop 
    ./features/desktop/awesomewm.nix

    ./features/web/chromium.nix

    ./features/programs/alacritty.nix
    ./features/programs/discord.nix
    ./features/programs/thunar.nix

    # games
    #./features/games
  ];

}
