(lang dune 3.11)

(name cct_reading_group)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "LocalCharts contributors")

(maintainers "Owen Lynch" "Five Grant")

(license LICENSE)

(package
 (name cct_reading_group)
 (synopsis "Collected code for the computational category theory reading group")
 (depends ocaml dune)
 (tags
  (category-theory learning)))