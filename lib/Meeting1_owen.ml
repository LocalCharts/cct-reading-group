type num = Zero | Succ of num

let rec numprint n = match n with
  | Zero -> 0
  | Succ m -> 1 + (numprint m)

let maxint xs =
  let rec helper x ys = match ys with
    | (y::ys') -> if x > y then helper x ys' else helper y ys'
    | [] -> x
  in match xs with
    | (x::xs') -> helper x xs'
    | [] -> 0