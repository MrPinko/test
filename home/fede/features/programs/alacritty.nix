# { pkgs, ... }: {
{ 
  programs.alacritty = {
    enable = true;

    settings = {
      font = rec {
        normal.family = "FiraCode Nerd Font";
        bold = { style = "Bold"; };
      };

      window.dimensions = {
        lines = 100;
        columns = 100;
      };
    };
  };

  
  home = {
    sessionVariables = {
      TERMINAL = "alacritty";
    };
  };
}