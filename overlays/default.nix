{ outputs, inputs, pkgs, ... }:
# let
# 	inherit pkgs;
# in
{
  modifications = final: prev: {
      awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
    };
  # awesome-git = final: prev: {
  #     awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
  # };
}
