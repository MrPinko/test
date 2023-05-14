# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? import <nixpkgs> { } }: rec {

  # Packages with an actual source
  #ex: name = pkgs.callPackage ./folder { };

  # Personal scripts

}
