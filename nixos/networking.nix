{ lib, ... }:
{
  services = {
    openssh = {
      enable = true;
      # Forbid root login through SSH.
      settings.PermitRootLogin = lib.mkDefault "no";
    };
  };

  networking = {
	# set inside hosts/default.nix
    # hostName = "...";

    networkmanager = {
      enable = true; # conflict with networking.wireless
    };
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # defaultGateway = "192.168.2.1";
    # interfaces.eno1.useDHCP = true;
    # interfaces.wlp1s0.useDHCP = true;

    firewall = {
      # enable = false; # true by default
      # allowedUDPPorts = [ 53317 ];
      # allowedTCPPorts = [ 53317 ];
    };
  };
}
