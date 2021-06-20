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
        ];

        shellHook = ''
          # TODO: it needs to be well documented!
          export TMPDIR=/tmp

          export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/

          # Customize your oh-my-zsh options here
          export ZSH_THEME="agnoster"
          plugins=(git)
          source $ZSH/oh-my-zsh.sh

          exec ${self.packages.${system}.dev}/bin/zsh
        '';
      };
    }
  );
}
