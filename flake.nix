{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            hugo
          ];

          shellHook = ''
            echo "Hugo been installed."
            echo "Run 'hugo server' to start the development server."
          '';
        };
      }
    );
}
