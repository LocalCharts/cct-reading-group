type ('v, 'e) t = {
  source: 'e -> 'v;
  target: 'e -> 'v;
}

type person = Joe | Bob | Sarah

type friendship = JoeBob | SarahBob

let frienship_quiver: (person, friendship) t = {
  source = (fun fship -> match fship with
    | JoeBob -> Joe
    | SarahBob -> Sarah);
  target = (fun fship -> match fship with
    | JoeBob -> Bob
    | SarahBob -> Bob);
}