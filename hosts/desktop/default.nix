# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/fede

    ../common/optional/awesomewm.nix

    # optional
    #../common/optional/gamemode.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/printer.nix
    ../common/optional/font.nix

    ../common/optional/gc.nix
    ../common/optional/optimize-store.nix
  ];

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
