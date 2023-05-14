let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha = "sha256:18xl7d2rvy1hblak752m7yqranhd8cw75vhqgkz2l26k8va07x2l";
  });
in
{
  imports = [
    aagl-gtk-on-nix.module
  ];

  nix.settings = {
    substituters = [ "https://ezkea.cachix.org" ];
    trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
  };

  programs.the-honkers-railway-launcher.enable = true;
}