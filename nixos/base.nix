{
  lib,
  pkgs,
  config,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    git
    tree
    wget
    curl
    nix-ld
    home-manager
  ];

  # make `xdg-open` works inside FHS envs
  xdg.portal.xdgOpenUsePortal = true;
}
