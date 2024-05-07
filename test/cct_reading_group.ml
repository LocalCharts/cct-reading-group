open Cct_reading_group.Categories
open Cct_reading_group.Graph
open Cct_reading_group.Fin_set

let g: graph = {
  source = graph_schema;
  target = fin_cat;
  ap_ob = (fun x -> match x with
    | V -> 3
    | E -> 2
  );
  ap_hom = (fun f -> match f with
    | Id_V -> fin_cat.id 3
    | Id_E -> fin_cat.id 2
    | Src -> {
        dom = 2;
        codom = 3;
        values = [|0;1|];
      }
    | Tgt -> {
        dom = 2;
        codom = 3;
        values = [|1;2|];
      }
  );
}

exception Test_failure

let () = if g.ap_ob V == 3 then () else raise Test_failure
let () = if (g.ap_hom Id_V).values.(1) == 1 then () else raise Test_failure
let () = if (g.ap_hom Src).values.(0) == 0 then () else raise Test_failure
let () = if (g.ap_hom Tgt).values.(0) == 1 then () else raise Test_failure