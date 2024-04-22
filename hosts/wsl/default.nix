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
      home-manager
      # GUI

    ];
  };

  services.vscode-server.enable = true;
  environment.systemPackages = [
    pkgs.wget
  ];

  wsl = {
    enable = true;
    defaultUser = "${username}";
    startMenuLaunchers = true;
    nativeSystemd = true;

    extraBin = with pkgs; [
      { src = "${coreutils}/bin/uname"; }
      { src = "${coreutils}/bin/dirname"; }
      { src = "${coreutils}/bin/readlink"; }
    ];
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
