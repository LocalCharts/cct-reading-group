{ pkgs }: {
  deps = [
    pkgs.ocaml
    pkgs.ocamlformat
    pkgs.opam
    pkgs.dune_3
    pkgs.ocamlPackages.findlib
    pkgs.ocamlPackages.utop
    pkgs.ocamlPackages.ocaml-lsp
    pkgs.ocamlPackages.owl
  ];

  env = {
    CAML_LD_LIBRARY_PATH = "${pkgs.ocaml}/lib/ocaml/stublibs:${pkgs.ocaml}/lib/ocaml:${pkgs.ocamlPackages.utop}/lib/ocaml";
  };
}