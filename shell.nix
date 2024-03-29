let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-22.11") { };
in
pkgs.mkShell {
  buildInputs = [
    # Elm
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-test
    pkgs.elmPackages.elm-format
    pkgs.elmPackages.elm-json

    # NIX
    pkgs.nixpkgs-fmt
  ];
}
