{ pkgs, lib, nixosConfig, ... }:
{
  imports =
    [
      ../features/git.nix
      ../features/cli.nix
      ../features/xdg.nix
      ../features/fish.nix
      ../features/tmux.nix
      ../features/editor.nix
    ]
    ++ lib.optionals nixosConfig.services.pipewire.enable [
      ../features/xdg-gui.nix
      ../features/browsers.nix
      ../features/mods/polkit.nix
    ]
    ++ lib.optionals nixosConfig.services.desktopManager.plasma6.enable [ ../features/kderc.nix ]
    ++ lib.optionals nixosConfig.services.xserver.desktopManager.gnome.enable [ ../features/dconf.nix ];

  home.stateVersion = nixosConfig.system.stateVersion;
  home.enableNixpkgsReleaseCheck = false;

  # TODO: https://github.com/nix-community/home-manager/issues/5452
  systemd.user.startServices = "sd-switch";
}
