{ inputs, lib, pkgs, config, outputs, ... }:
let
	inherit pkgs;
in
{
	imports = [

		../features/cli
		../features/web/firefox.nix
		../features/programs/vscode.nix

	] ++ (builtins.attrValues outputs.homeManagerModules);

	nixpkgs = {
		overlays = builtins.attrValues outputs.overlays;
		# overlays = [
		# 	outputs.overlays.awesome-git
		# ];
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};

	nix = {
		package = lib.mkDefault pkgs.nix;
		settings = {
			experimental-features = [ "nix-command" "flakes" "repl-flake" ];
		};
	};

    # Nicely reload system units when changing configs
	# systemd.user.startServices = "sd-switch";

	programs = {
		home-manager.enable = true;
		git.enable = true;
	};

	home = {
		username = lib.mkDefault "fede";
		homeDirectory = lib.mkDefault "/home/${config.home.username}";
		sessionPath = [ "$HOME/.local/bin" ];

		# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
		stateVersion = "23.05";

	};

}