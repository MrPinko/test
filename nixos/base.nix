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
  ];

  # make `xdg-open` works inside FHS envs
  xdg.portal.xdgOpenUsePortal = true;
}
