{
  lib,
  config,
  username,
  ...
}:
let
  sudoRule = {
    users = [ "${username}" ];
    commands = [
      {
        command = "ALL";
        options = [ "NOPASSWD" ];
      }
    ];
  };
in
{
  users = {
    # mutableUsers = false;
    # defaultUserShell = pkgs.zsh;
  };

  users.users.${username} = {
    isNormalUser = true;
    extraGroups =
      [
        "wheel"
        "audio"
        "video"
        "networkmanager"
      ]
      ++ lib.optionals config.virtualisation.lxd.enable [ "lxd" ]
      ++ lib.optionals config.virtualisation.docker.enable [ "docker" ]
      ++ lib.optionals config.virtualisation.podman.enable [ "podman" ]
      ++ lib.optionals config.virtualisation.libvirtd.enable [ "libvirtd" ]
      ++ lib.optionals config.virtualisation.virtualbox.host.enable [ "vboxusers" ]
      ++ lib.optionals config.programs.adb.enable [ "adbusers" ];
  };

  users.users.guest = {
    isNormalUser = true;
    # `passwd`
    password = "guest";
    extraGroups =
      [
        "wheel"
        "audio"
        "video"
        "networkmanager"
      ]
      ++ lib.optionals config.virtualisation.lxd.enable [ "lxd" ]
      ++ lib.optionals config.virtualisation.docker.enable [ "docker" ]
      ++ lib.optionals config.virtualisation.podman.enable [ "podman" ]
      ++ lib.optionals config.virtualisation.libvirtd.enable [ "libvirtd" ]
      ++ lib.optionals config.virtualisation.virtualbox.host.enable [ "vboxusers" ]
      ++ lib.optionals config.programs.adb.enable [ "adbusers" ];
  };
}
