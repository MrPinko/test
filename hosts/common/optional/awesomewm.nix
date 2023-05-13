{ inputs, lib, config, pkgs, user, ... }: {
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      layout = "it";
      xkbVariant = "";

      displayManager = {
        autoLogin = {
          enable = true;
          user = user;
        };

        defaultSession = "none+awesome";

        lightdm = {
          enable = true;
        };
      };

      windowManager = {
        awesome = {
          enable = true;

          luaModules = lib.attrValues {
            inherit (pkgs.luaPackages) lgi ldbus luadbi-mysql luaposix;
          };
        };
      };

    };
  };
}
