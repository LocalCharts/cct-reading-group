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

let test_vert_count () = 
  Alcotest.(check int) "vertices initialized" 3 (g.ap_ob V)
  
let test_identity () = 
  Alcotest.(check int) "identity returns input" 1 (g.ap_hom Id_V).values.(1)

let test_source () = 
  Alcotest.(check int) "First source does not match" 0 (g.ap_hom Src).values.(0)

let test_target () = 
  Alcotest.(check int) "First target does not match" 1 (g.ap_hom Tgt).values.(0)


(* Run it *)
let () =
  let open Alcotest in
  run "Graph Tests" [
      "simple graph", [
          test_case "Vertex count" `Quick test_vert_count;
          test_case "Identities" `Quick test_identity;
          test_case "Target" `Quick test_target;
          test_case "Source" `Quick test_source;
        ];
    ]