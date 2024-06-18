(*type ('v, 'e) path =
  | Empty of 'v
  | Cons of ('v, 'e) path * 'e * 'v*)

(*let free_category (q : ('v, 'e) Quiver.t) : ('v, ('v, 'e) path) Categories.cat = {
  dom = (fun p -> match p with
    | Empty x -> x
    | Cons (p', _, _) -> dom p');
  codom = (fun p -> match p with
    | Empty x -> x
    | Cons (_, _, x) -> x);
  id = (fun x -> Empty x);
  compose = (fun p q -> match (p, q) with
    | (Empty x, Empty y) -> if x == y then Empty x else raise Categories.Dom_codom_mismatch
    | (Empty x, p) -> if dom p == x then p else raise Categories.Dom_codom_mismatch
    | (p, Empty x) -> if codom p == x then p else raise Categories.Dom_codom_mismatch
    | (p, Cons (q, e, x)) -> Cons (compose p q, e, x)
  )
} *)