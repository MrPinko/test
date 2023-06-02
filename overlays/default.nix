{ outputs, inputs, pkgs, ... }: {
  modifications = final: prev: {
    awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
  };
}
