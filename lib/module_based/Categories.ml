module type CatElements = sig
  type ob
  type hom

  val dom : hom -> ob
  val codom : hom -> ob

  val id : ob -> hom
  val compose_implementation : hom -> hom -> hom
end

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

(* module CatMake(C: CatElements) : Cat
 = struct
  type ob = C.ob
  type hom = C.hom

  let dom = C.dom
  let codom = C.codom
  let id = C.id
  let compose f g = if (codom f) == (dom g)
    then C.compose_implementation f g
    else raise Dom_codom_mismatch
end *)


module type Objects = sig
  type ob
  type hom
  val id : ob -> hom
end

module type Homomorphisms = sig
  type ob
  type hom

  val dom : hom -> ob
  val codom : hom -> ob
end

module CatMake : functor (
  O : Objects,
  Hom : Homomorphisms
  ) -> Cat
 = struct
  (* type ob = C.ob *)
  (* type hom = C.hom *)
(* 
  let dom = C.dom
  let codom = C.codom *)
  let id x = let result = (O.id x) in if x == result 
    then result
    else raise Bad_identity_implementation
  let compose f g = if (codom f) == (dom g)
    then C.compose f g
    else raise Dom_codom_mismatch
end
