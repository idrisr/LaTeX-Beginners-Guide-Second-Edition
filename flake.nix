{
  inputs.nixpkgs.url = "nixpkgs";
  description = "";
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system} = rec {
        pres = with pkgs; mkShell { buildInputs = [ texlab tectonic ]; };
        default = pres;
      };
    };
}
