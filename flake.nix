{
  description = "CCT OCaml dev environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = [
        pkgs.ocaml
        pkgs.ocamlformat
        pkgs.opam
        pkgs.dune_3
        pkgs.ocamlPackages.findlib
        pkgs.ocamlPackages.utop
        pkgs.ocamlPackages.ocaml-lsp
        pkgs.ocamlPackages.owl
        pkgs.ocamlPackages.alcotest
        ];
      };
      env = {
        CAML_LD_LIBRARY_PATH = "${pkgs.ocaml}/lib/ocaml/stublibs:${pkgs.ocaml}/lib/ocaml:${pkgs.ocamlPackages.utop}/lib/ocaml";
      };
    };
}
