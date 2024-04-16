type num = Zero | Succ of num
let rec numprint n : num = function
  | zero -> 0.0
  | succ n -> 1.0 + numprint n