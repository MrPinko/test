{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
  ];

  #probabilmente crasha
  home.packages = with pkgs; [
    vscode
  ];

}
