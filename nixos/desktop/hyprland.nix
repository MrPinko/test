{ pkgs, lib, username, ... }:
{
  # DisplayManager
  services.greetd = {
    enable = true;
    settings = {
      default_session.command = "${lib.getExe pkgs.greetd.tuigreet} --time --cmd Hyprland";
      # Autologin
      initial_session = {
        command = "Hyprland";
        user = "${username}";
      };
    };
  };

  programs.hyprland.enable = true;

  home-manager.users.${username} = {

    home.packages = with pkgs; [
      # hyprpaper # wallpaper
      hyprpicker
      hyprlock
    ];

    home.sessionVariables = {
      NIXOS_OZONE_WL = 1; # Electron wayland native
    };
  }
}
