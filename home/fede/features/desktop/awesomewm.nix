{ config, pkgs, ... }: {
  home.file = {
    ".config/awesome" = {
      source = "../../../../../dotfiles/awesome";
      recursive = true;
    };
  };

}