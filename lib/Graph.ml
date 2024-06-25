open Categories

type graph_ob = V | E

type graph_hom = Id_V | Id_E | Src | Tgt

module GraphSchema = struct 
  type ob = graph_ob
  type hom =  graph_hom
  
  let dom = (fun f -> match f with
    | Id_V -> V
    | Id_E -> E
    | Src -> E
    | Tgt -> E
  )
  let codom = (fun f -> match f with
    | Id_V -> V
    | Id_E -> E
    | Src -> V
    | Tgt -> V
  )
  let id = (fun x -> match x with
    | V -> Id_V
    | E -> Id_E
  )
  let compose_impl f g =  match (f,g) with
    | (_, Id_V) -> f
    | (_, Id_E) -> f
    | (Id_V, _) -> g
    | (Id_E, _) -> g
    | _ -> raise Dom_codom_mismatch
end

module GraphCat = CatMake(GraphSchema)

module DualGraphCat = Dual(GraphCat)
