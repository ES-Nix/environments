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
      packages.dev = import ./default.nix {
        pkgs = nixpkgs.legacyPackages.${system};
      };

      defaultPackage = self.packages.${system}.dev;

      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          self.packages.${system}.dev
          lesspipe
        ];

        shellHook = ''
          # TODO: it needs to be well documented!
          export TMPDIR=/tmp

          export ZSH=${pkgs.zsh}/bin/zsh

          exec ${self.packages.${system}.dev}/bin/zsh
        '';
      };
    }
  );
}
