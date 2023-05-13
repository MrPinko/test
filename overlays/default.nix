{ outputs, inputs, pkgs, ... }:
let
	inherit pkgs;
in
{

  awesome-git = final: prev: {
      awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
  };
}
