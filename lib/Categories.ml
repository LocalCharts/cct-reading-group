
module type Cat = sig
  type ob
  type hom

  val dom : hom -> ob
  val codom : hom -> ob

  val id : ob -> hom
  val compose : hom -> hom -> hom
end

exception Dom_codom_mismatch

exception Bad_identity_implementation

(* checks - 
  id returns the values it was given 
  compose (every): domain of f = codomain of g
*)


module type Homorphisms = sig
  type ob
  type hom
  val dom : hom -> ob
  val codom : hom -> ob
  val id : ob -> hom
  val compose_impl: hom -> hom -> hom 
end 

module CatMake = functor
  (Hom : Homorphisms)
 -> struct
  type ob = Hom.ob
  type hom = Hom.hom
  let dom = Hom.dom
  let codom = Hom.codom
  let id = Hom.id(* let result = (Hom.apply (Hom.id x) x) in if x == result 
    then result
    else raise Bad_identity_implementation*)
  let compose f g = if (codom f) == (dom g)
    then Hom.compose_impl f g
    else raise Dom_codom_mismatch
end

(*
module type CatFunctor = sig
  type so = Cat.ob
  type sh = Cat.hom
  type to = Cat.ob
  type th = Cat.hom
  val source : s
  val target : t
  val ap_ob : so -> to
  val ap_hom: sh -> th
end
*)

(*
module CatFunctorMake = functor (C: Cat) (D: Cat) -> struct
  type ob = C.ob
  type hom = C.hom
  let source = C
  let target = D
  let ap_ob = (fun x -> C.dom x)
  let ap_hom = (fun x -> C.dom x)
end
*)

module Dual = functor (C: Cat) -> struct
  type ob = C.ob
  type hom = C.hom
  let dom = C.codom
  let codom = C.dom
  let id = C.id
  let compose f g = C.compose g f
end
