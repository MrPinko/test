{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ pure-prompt ];

  programs.fish = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

}
