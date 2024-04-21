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
      wget
      home-manager
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

  #fix vscode
  programs.nix-ld.enable = true;

  # fish
  programs.fish.enable = true;
  programs.fish.loginShellInit = "cd ~";
  users.defaultUserShell = pkgs.fish;

  time.timeZone = "Europe/Rome";
  system.stateVersion = "24.05";
}
