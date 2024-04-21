{ pkgs }:
{
  default = pkgs.mkShell {
    buildInputs = with pkgs; [
      git
      home-manager
      nixfmt-rfc-style
    ];
    name = "startup";
    shellHook = ''
        fish && exit
      '';
  };

  ###############################################
  ##  Golang
  ###############################################
  go = pkgs.mkShell {
    buildInputs = with pkgs; [
      go
      gotools
      gccgo
      delve
      pkg-config
      alsa-lib
      flac
    ];
	shellHook = ''
      fish && exit
    '';
  };

  ###############################################
  ##  Rust
  ###############################################
  # https://github.com/BKSalman/ytdlp-gui/blob/main/flake.nix
  rust = pkgs.mkShell {
    doCheck = false;
    buildType = "debug";
    # OPENSSL_NO_VENDOR = 1;
    buildInputs = with pkgs; [
      cargo
      rustc
      meson
      ninja
      clang
      openssl
      pkg-config
      curl
      cmake

      gtk4
      glib
      libadwaita
      wrapGAppsHook4
      appstream-glib
      desktop-file-utils
      libxml2
      dbus

      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly

      alsa-lib
      lame
      # libxkbcommon
      # xorg.libX11
      # xorg.libxcb
      # xorg.xcbutil
      # xorg.xcbutilwm
      # xorg.xcbutilimage
      # xorg.xcbutilkeysyms
      # freetype
      # fontconfig
    ];
	shellHook = ''
      fish && exit
    '';
  };

  ###############################################
  ##  Python
  ###############################################
  # python setup.py install --root=/home/iab/devs/
  python = pkgs.mkShell {
    buildInputs = with pkgs; [
      python3
      virtualenv
      python3Packages.pip
    ];
    propagatedBuildInputs = with pkgs.python3.pkgs; [
      requests
      chardet
      docutils
      markdown
      markups
      pyenchant
      pygments
      # pyqt5
      # pyqt6
    ];
	shellHook = ''
      fish && exit
    '';
  };

}
