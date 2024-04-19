/*
wsl --import NixOS $env:USERPROFILE\NixOS\ nixos-wsl.tar.gz
wsl --unregister nixos
*/
{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      wslu
      wsl-open
      # GUI
    ];
  };

  wsl = {
    enable = true;
    defaultUser = "${username}";
    startMenuLaunchers = true;
    nativeSystemd = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;
  };

  # fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  time.timeZone = "Europe/Rome";
  system.stateVersion = "24.05";
}
