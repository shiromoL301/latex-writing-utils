{
  description = "Python Utilities for Writing with LaTeX ";
  inputs = {
    stable.url = "github:NixOS/nixpkgs/nixos-21.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  
  outputs = { self, stable, unstable, flake-utils }:
    with flake-utils.lib; eachSystem allSystems (system:
      let
        pkgs = unstable.legacyPackages.${system};
      in rec {
        packages = {
          document = pkgs.stdenvNoCC.mkDerivation rec {
            name = "latex-writing-utils";
            src = self;
            buildInputs = [
              pkgs.coreutils
              pkgs.python3
              pkgs.python3Packages.img2pdf
              pkgs.python3Packages.pillow
            ];
          };
        };
        defaultPackage = packages.document;
    });
}