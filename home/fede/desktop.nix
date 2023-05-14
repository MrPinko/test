{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global

    ./features/chat/discord.nix

    # games
    #./features/games/honkers.nix
  ];

  home.packages = with pkgs; [

    # TERMINAL
    alacritty

    # FILE
    xfce4.thunar

    # CHAT
    discord
  ];

}
