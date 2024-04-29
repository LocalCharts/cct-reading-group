type ('o, 'a) cat = {
  dom : 'a -> 'o;
  codom : 'a -> 'o;
  id : 'o -> 'a;
  compose : 'a -> 'a -> 'a;
}

type ('oA, 'aA, 'oB, 'aB) catfunctor = {
  source:  ('oA, 'aA) cat;
  arrow: ('oA -> 'oB) * ('aA -> 'aB);
  target: ('oB, 'aB) cat;
}

let dual_cat : ('o, 'a) cat -> ('o, 'a) cat = fun {dom; codom; id; compose} -> {dom = dom; codom = codom; id = id; compose = (fun g f -> compose f g)}
let dual_functor : ('oA, 'aA, 'oB, 'aB) catfunctor -> ('oA, 'aA, 'oB, 'aB) catfunctor = fun {source; arrow; target} -> {source = (dual_cat source); arrow = arrow; target = (dual_cat target)}
