{
  # derived from https://github.com/jyssh/work-and-stretch/blob/main/flake.nix
  description = "CCT - OCaml";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      systems = [ "x86_64-darwin" "aarch64-darwin" "x86_64-linux" ];
      createDevShell = system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.mkShell {
          buildInputs = [
            pkgs.ocaml
            pkgs.dune_2
            pkgs.ocamlformat
            pkgs.ocamlPackages.findlib
            pkgs.ocamlPackages.ocaml-lsp
            pkgs.ocamlPackages.owl
          ];
        };
    in
    {
      devShell = nixpkgs.lib.genAttrs systems createDevShell;
    };
}
