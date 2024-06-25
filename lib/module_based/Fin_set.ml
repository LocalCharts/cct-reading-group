open Categories

(*
This represents a function from the set {0,...,dom-1}
to the set {0,...,codom-1}. The value of the function
at an argument i is values.(i).
*)
type fin_function = {
  dom: int;
  codom: int;
  values: int array;
}

exception Values_out_of_codomain

let mk_fin_function codomain values = 
  let 
    max_val = Array.fold_left max min_int values
  in
    if  max_val <= codomain 
    then {
      dom = Array.length values;
      codom = codomain;
      values = values;
    }
    else raise Values_out_of_codomain


module FinSetHoms = struct
  type ob = int
  type hom = fin_function
  let dom f = f.dom
  let codom f = f.codom
  let id x = { dom = x; codom = x; values = Array.init x (fun i -> i) }
  let compose_impl f g = {
      dom = f.dom;
      codom = g.codom;
      values = Array.init f.dom (fun i -> g.values.(f.values.(i)))
    }
end

module FinSetCat = CatMake(FinSetHoms)

module DualFinSetCat = Dual(FinSetCat)
