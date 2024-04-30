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

exception Dom_codom_mismatch

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
    else raise Dom_codom_mismatch);
}

let fin_cat_op = dual_cat fin_cat
