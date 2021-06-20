{ pkgs ?  import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "minimal";
  buildInputs = with pkgs; [ bashInteractive coreutils hello ];

  # https://nix.dev/anti-patterns/language#reproducability-referencing-top-level-directory-with
  src = builtins.path { path = ./.; name = "minimal"; };
  installPhase = ''
    mkdir --parent $out/bin

    install -t $out/bin ${pkgs.bashInteractive}/bin/bash
    install -t $out/bin ${pkgs.coreutils}/bin/coreutils
    install -t $out/bin ${pkgs.coreutils}/bin/wc
    install -t $out/bin ${pkgs.coreutils}/bin/ls
    install -t $out/bin ${pkgs.coreutils}/bin/rm
    install -t $out/bin ${pkgs.coreutils}/bin/echo
    install -t $out/bin ${pkgs.coreutils}/bin/readlink
    install -t $out/bin ${pkgs.hello}/bin/hello
  '';

  phases = [ "buildPhase" "installPhase" "fixupPhase" ];
}
