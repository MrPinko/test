{ config, pkgs, ... }: {
  home.file.".config/awesome" = {
      source = ../../../../dotfiles;
      recursive = true;
  };
}