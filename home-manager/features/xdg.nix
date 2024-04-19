{ config, ... }:
let
  lnDots = config.lib.file.mkOutOfStoreSymlink config.home.homeDirectory + "/nsworld/dotfiles";
in
{
  home.sessionPath = [
    "${lnDots}/bin"
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.emacs.d/bin"
  ];

  home.sessionVariables = {
    VISUAL = "micro";
    EDITOR = "emacs";
  };

  home.file = {
    ".proxychains/proxychains.conf".source = "${lnDots}/proxychains.conf";
  };

  xdg.configFile = {
    "cava".source = "${lnDots}/cava";
    "wofi".source = "${lnDots}/wofi";
    "foot".source = "${lnDots}/foot";
    "kitty".source = "${lnDots}/kitty";
    "wezterm".source = "${lnDots}/wezterm";
    "gtklock".source = "${lnDots}/gtklock";
    "swaylock".source = "${lnDots}/swaylock";
    "nix-init".source = "${lnDots}/nix-init";
    "alacritty".source = "${lnDots}/alacritty";
    "radioboat".source = "${lnDots}/radioboat";

    "doom".source = "${lnDots}/doom";
    "emacs/elisp".source = "${lnDots}/emacs/elisp";
    "emacs/init.el".source = "${lnDots}/emacs/init.el";
    "emacs/early-init.el".source = "${lnDots}/emacs/early-init.el";

    "lf".source = "${lnDots}/lf";
    "mpv".source = "${lnDots}/mpv";
    "mako".source = "${lnDots}/mako";
    "helix".source = "${lnDots}/helix";
    "waybar".source = "${lnDots}/waybar";
    "yt-dlp".source = "${lnDots}/yt-dlp";
    "starship.toml".source = "${lnDots}/starship.toml";
    "sway/custom.conf".source = "${lnDots}/sway/custom.conf";
    "hypr/custom.conf".source = "${lnDots}/hypr/custom.conf";
    "hypr/hyprlock.conf".source = "${lnDots}/hypr/hyprlock.conf";
  };

  xdg.dataFile = {
    "goodvibes".source = "${lnDots}/goodvibes";
    "color-schemes/Genshin.colors".source = "${lnDots}/misc/kde-color-Genshin.colors";
  };
}
