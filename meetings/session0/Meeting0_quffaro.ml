type num = Zero | Succ of num

let rec numprint n = match n with
  | Zero -> 0
  | Succ m -> 1 + numprint m