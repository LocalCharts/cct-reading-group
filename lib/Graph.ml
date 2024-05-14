open Categories
open Fin_set

type graph_ob = V | E

type graph_hom = Id_V | Id_E | Src | Tgt

let graph_schema: (graph_ob, graph_hom) cat = {
  dom = (fun f -> match f with
    | Id_V -> V
    | Id_E -> E
    | Src -> E
    | Tgt -> E
  );
  codom = (fun f -> match f with
    | Id_V -> V
    | Id_E -> E
    | Src -> V
    | Tgt -> V
  );
  id = (fun x -> match x with
    | V -> Id_V
    | E -> Id_E
  );
  compose = (fun f g -> match (f,g) with
    | (_, Id_V) -> f
    | (_, Id_E) -> f
    | (Id_V, _) -> g
    | (Id_E, _) -> g
    | _ -> raise Dom_codom_mismatch
  )
}

type graph = (graph_ob, graph_hom, int, fin_function) catfunctor