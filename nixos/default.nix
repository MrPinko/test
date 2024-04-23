{
  flake.nixosModules = {
    default = {
      imports = [
        ./base.nix
        ./user.nix
        ./sound.nix
        ./fonts.nix
        ./nixconfig.nix
        ./networking.nix
      ];
    };

    gnome = {
      imports = [ ./desktop/gnome.nix ];
    };

    kde = {
      imports = [ ./desktop/kde.nix ];
    };

	# imports = [
	# 	self.nixosModules.hyprland
	# ];
    hyprland = {
      imports = [
        ./desktop/hyprland.nix
      ];
    };

    no-rgb = {
      imports = [ ./no-rgb.nix ];
    };
  };
}
