{
  lib,
  pkgs,
  inputs,
  config,
  nixosConfig,
  ...
}:
{
  home.packages = with pkgs; [
  ];

  services = {
  };

  ###############################################
  ##  Desktop Environment
  ###############################################
  home.sessionVariables = {
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    mimeApps = {
      enable = false;
      defaultApplications = lib.mkMerge [
        {
          "video/*" = "mpv.desktop";
          "audio/mpeg" = "qmmp.desktop";
          "audio/flac" = "qmmp.desktop";
          "audio/x-vorbis+ogg" = "qmmp.desktop";
          "text/html" = "chrome.desktop";
        }
        (lib.mkIf nixosConfig.services.xserver.desktopManager.gnome.enable {
          "image/*" = "org.gnome.Loupe.desktop";
          "text/plain" = "org.gnome.TextEditor.desktop";
          "application/pdf" = "org.gnome.Evince.desktop";
        })
        (lib.mkIf nixosConfig.services.desktopManager.plasma6.enable {
          "image/*" = "org.kde.gwenview.desktop";
          "text/plain" = "org.kde.kwrite.desktop";
          "application/pdf" = "org.kde.okular.desktop";
        })
      ];
    };
  };
}
