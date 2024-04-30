# Exercises

1. Make all this stuff run locally on your machine
2. Add good docstrings for all types and functions
3. Make a function that builds a fin_function, checking whether or not it is valid along the way. (First: when is a fin_function valid??)
4. Generalize the graph schema example in the following way

```ocaml
type ('v, 'e) quiver = {
  source: 'e -> 'v;
  target: 'e -> 'v;
}

let free_category (q: ('v, 'e) quiver) -> ('v, 'e list) cat = ...
```

In this free category, identity should be empty list, and composition should be concatenation. What is the problem with that statement (hint: what's the codomain of the empty list??)? Can you fix this so that it actually works (Hint: try `('v, `v * `v * `e list) cat` or something like that).

5. Write a function that makes building graphs easier.

```ocaml
type graph_simple = {
  vertices: int;
  edges: int;
  src: int array;
  tgt: int array;
}

let to_graph (g: graph_simple): graph = ...
```