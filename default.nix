{ pkgs ?  import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "minimal";
  buildInputs = with pkgs; [ bashInteractive coreutils ];
}

