{
  description = "A usefull description";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config = { allowUnfree = true; };
        };
    in
    {
      packages.minimal = import ./default.nix {
        pkgs = nixpkgs.legacyPackages.${system};
      };

      defaultPackage = self.packages.${system}.minimal;

      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          self.defaultPackage.${system}.minimal
          self.packages.${system}.minimal
        ];

        devShell = ''
          ${self.packages.${system}.minimal}/bin/bash
        '';
      };
    }
  );
}
