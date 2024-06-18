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

module Fin_cat : Cat = struct
  type ob = int
  type hom = fin_function

  let dom f = f.dom
  let codom f = f.codom

  let id x = { dom = x; codom = x; values = Array.init x (fun i -> i) }

  let compose f g = {
      dom = f.dom;
      codom = g.codom;
      values = Array.init f.dom (fun x -> g.values.(f.values.(x)))
    }
end

(*    
let fin_cat : (int, fin_function) cat = {
  dom = (fun f -> f.dom);
  codom = (fun f -> f.codom);
  id = (fun n -> { 
    dom = n;
    codom = n;
    values = Array.init n (fun i -> i)
  });
  (*
  When we compose f and g to make (f;g), this new
  function should satisfy (f;g)(i) = g(f(i))
  *)
  compose = (fun f g ->  
    if f.codom == g.dom
    then {
      dom = f.dom;
      codom = g.codom;
      values = Array.init f.dom (fun x -> g.values.(f.values.(x)))
    }
    else raise Categories.Dom_codom_mismatch);
} *)



(* let fin_cat_op = dual_cat fin_cat *)
