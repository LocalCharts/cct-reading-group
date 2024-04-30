type ('o, 'a) cat = {
  dom : 'a -> 'o;
  codom : 'a -> 'o;
  id : 'o -> 'a;
  (* if f : x -> y, and g : y -> z
  then (compose f g) : x -> z

  This means that when we compose, we have to check
  that `codom f == dom g`, (because codom f == y in the
  above statement).
  *)
  compose : 'a -> 'a -> 'a;
}

type ('oA, 'aA, 'oB, 'aB) catfunctor = {
  source:  ('oA, 'aA) cat;
  target: ('oB, 'aB) cat;
  ap_ob: ('oA -> 'oB);
  ap_hom: ('aA -> 'aB);
}

let dual_cat (c: ('o, 'a) cat): ('o, 'a) cat = {
  dom = c.codom;
  codom = c.dom;
  id = c.id;
  compose = (fun f g -> c.compose g f)
}