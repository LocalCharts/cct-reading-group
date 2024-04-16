let hello () = print_string("hello world")

let m = (3 + 4) * 5

let eval_at_one f = f 1

type ('o, 'a) cat = {
  dom : 'a -> 'o;
  codom : 'a -> 'o;
  id : 'o -> 'a;
  compose : 'a -> 'a -> 'a;
}

let nat_monoid: (unit, int) cat = {
  dom = (fun x -> ());
  codom = (fun x -> ());
  id = (fun x -> 0);
  compose = (fun f g -> f + g);
}

let result1 = nat_monoid.compose 3 4