# { pkgs, ... }: {
{ 
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal.family = "CaskaydiaCove Nerd Font";
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