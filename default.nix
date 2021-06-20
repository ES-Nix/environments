{ pkgs ?  import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "minimal";
  buildInputs = with pkgs; [ bashInteractive coreutils ];

  # https://nix.dev/anti-patterns/language#reproducability-referencing-top-level-directory-with
  src = builtins.path { path = ./.; name = "minimal"; };
  installPhase = ''
    mkdir --parent $out/bin

    install -t $out/bin ${pkgs.bashInteractive}/bin
    install -t $out/bin ${pkgs.coreutils}/bin
  '';

  phases = [ "buildPhase" "installPhase" "fixupPhase" ];
}
