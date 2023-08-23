{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    # minimal configuration 
    ./global

    # desktop 
    ./features/desktop/awesomewm.nix

    ./features/web/firefox.nix

    ./features/programs/alacritty.nix
    ./features/programs/discord.nix
    ./features/programs/git.nix
    ./features/programs/thunar.nix

    # games
    #./features/games
  ];

  # only for quick test 
  home.packages = with pkgs; [ ];

}