let hello () = print_string("hello world")

# exercise 3
type nat = Z | S of nat

let rec numprint n : nat
