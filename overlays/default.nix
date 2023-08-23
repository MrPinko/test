{ inputs, pkgs, ... }: {

  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
  };
}
