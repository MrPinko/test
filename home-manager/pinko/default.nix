{ pkgs, lib, nixosConfig, ... }:
{
  imports =
    [
      ../features/git.nix
      ../features/cli.nix
      ../features/xdg.nix
      ../features/fish.nix
      ../features/tmux.nix
    ]
    ++ lib.optionals nixosConfig.services.xserver.enable [
      ../features/gui.nix
      ../features/editor.nix
      ../features/browsers.nix
      ../features/mods/polkit.nix
    ]
    ++ lib.optionals nixosConfig.services.desktopManager.plasma6.enable [ ../features/kderc.nix ]
    ++ lib.optionals nixosConfig.services.xserver.desktopManager.gnome.enable [ ../features/dconf.nix ];

  home.stateVersion = nixosConfig.system.stateVersion;
  home.enableNixpkgsReleaseCheck = false;
}
