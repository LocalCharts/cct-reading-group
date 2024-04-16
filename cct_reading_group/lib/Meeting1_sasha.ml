type num = Zero | Succ of num 

let rec print n = match n with
 | Zero -> 0
 | Succ n -> 1 + print n


 