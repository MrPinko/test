{
  inputs,
  self,
  pkgs,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    # self.nixosModules.gnome
    # self.nixosModules.kde
    self.nixosModules.hyprland
    self.nixosModules.no-rgb
  ];

  home.packages = with pkgs; [
  ];

  services.xserver = {
    enable = true;

    desktopManager.plasma6.enable = true;
  };

  # SSH
  services.openssh = {
    settings.PermitRootLogin = "yes";
  };
}
