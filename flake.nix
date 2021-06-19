{
  description = "A usefull description";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: {
    packages.minimal = import ./default.nix {
      pkgs = nixpkgs.legacyPackages.${system};
    };

    defaultPackage = self.packages.${system}.minimal;
  });

}
