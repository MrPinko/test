{ inputs, lib, config, pkgs, ... }:
let 
  hostName = "desktop";
in
{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../common/global
      ../common/users/fede

      # desktop 
      (../common/optional/awesomewm.nix ( { user = "fede"; } ))

      # optional
      ../common/optional/gamemode.nix
      ../common/optional/pipewire.nix
      ../common/optional/quietboot.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  networking = {
    hostName = ${hostName};
    wireless.enable = true;
    useDHCP = false;

    networkmanager.enable = true;

    # interfaces.enp8s0 = {
    #   useDHCP = true;
    #   wakeOnLan.enable = true;

    #   ipv4 = {
    #     addresses = [{
    #       address = "192.168.0.12";
    #       prefixLength = 24;
    #     }];
    #   };
    #   ipv6 = {
    #     addresses = [{
    #       address = "2804:14d:8084:a484::2";
    #       prefixLength = 64;
    #     }];
    #   };
    # };
  };

  console.keyMap = "it2";



  # Configure console keymap

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
