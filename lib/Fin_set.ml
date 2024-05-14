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

(*
TODO: DELETE THIS COMMENT
[1 ... dom] -> [x_i in {0..codom}]*)


(*
f = [3, 2, 4] (describes K(3) -> K(4))
g = [1,1,1,2] (describes K(4) -> K(2))


g(f(1)) = g(3) = 1
g(f(99)) INVALID

dom | codom

1 -> 3
2 -> 2
3 -> 9

DESIGN DECISIONS!

1. Is the length of the values correct i.e. length(values) == domain? YES
2. Is the max value in the list the codomain? YES

Answer yes for (1), then means assume. If no, then dom must be passed in manually
Answer yes for (2), then means assume. If no, then codom must be passed in manually

w = set where (1) is true and (2) is true
x = set where (1) is true and (2) is false
y = set where (1) is false and (2) is true
z = set where (1) and (2) are false

w is a subset of all finite set functions. MEANING certain finite functions are not possible to represent with w e.g. F(dom=1, codom=100, [1])
x = y = z = all possible finite set functions. We can represent all finite funcitons with these.

therefore x, y, z are equally valid. x requires the user to pass
in the least amount of information.

----

F(dom=3, codomain=100, values=[1,2,3]) <=== this is not possible if we answer yes to (2)
^ it is possible though if we answer yes to (1)
this is because the length of values will ALWAYS equal the domain.


F can't compose with F because the domain can't codomain
composo

mk_fin_function codomain values = 
  check if max(values) <= codomain
  fin_function {
  dom: length xs | NOT AN ASSUMPTION
  codom: max xs | THIS IS AN ASSUMPTION
  values: xs
}


mk_fin_function xs = fin_function {
  dom: length xs | NOT AN ASSUMPTION
  codom: max xs | THIS IS AN ASSUMPTION
  values: xs
}
*)

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
    else raise Values_out_of_codomain;


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
