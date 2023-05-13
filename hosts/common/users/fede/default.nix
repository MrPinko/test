{ pkgs, config, ... }:
let 
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
  user = "fede";
in
{
  users.users.${user} = {
    isNormalUser = true;
    group = "users";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "network"
      "wireshark"
      "i2c"
      "mysql"
      "docker"
      "git"
    ];

    packages = with pkgs; [ 
        # home-manager

        firefox
        xfce.thunar

        vim
    ];
  };

  home-manager.users.${user} = import ../../../../home/${user}/${config.networking.hostName}.nix;

}