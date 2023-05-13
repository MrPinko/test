{ pkgs, lib, inputs, ... }:

let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    profiles.fede = {
      bookmarks = { };
      extensions = with addons; [
        ublock-origin
      ];
    };
  };

  home = {
    sessionVariables.BROWSER = "firefox";
  };

}
