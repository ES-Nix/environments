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

        shellHook = ''
          # TODO: it needs to be well documented!
          export TMPDIR=/tmp

          export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/

          # Customize your oh-my-zsh options here
          ZSH_THEME="agnoster"
          plugins=(git)
          source $ZSH/oh-my-zsh.sh

          ${self.packages.${system}.minimal}/bin/zsh
        '';
      };
    }
  );
}
