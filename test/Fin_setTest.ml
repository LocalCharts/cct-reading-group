open Cct_reading_group.Fin_set

let valid_fin_func = mk_fin_function 10 [|1; 9; 8 |]

let test_func_domain () = 
  Alcotest.(check int) "domain initialized" 3 valid_fin_func.dom 

let test_func_codomain () = 
  Alcotest.(check int) "codomain initialized" 10 valid_fin_func.codom 

let test_func_values () = 
    Alcotest.(check int) "retrievable values" 8 valid_fin_func.values.(2)
  
(* let test_raises () = 
  Alcotest.Test_error (check int) "First target does not match" 1 (g.ap_hom Tgt).values.(0) *)


(* Run it *)
let () =
  let open Alcotest in
  run "Finite Set Tests" [
      "finite set constructor", [
          test_case "Values" `Quick test_func_values;
          test_case "Domain" `Quick test_func_domain;
          test_case "Codomain" `Quick test_func_codomain;
        ];
    ]