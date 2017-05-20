let string_of_expr = function
  Syntax.Proc (name, args) ->
    name ^ "(" ^ (String.concat ", " args) ^ ")"

let string_of_decl = function
  Syntax.Def (name, body) ->
    "def " ^ name ^ "(" ^ "" ^ ")\n  "
    ^ (String.concat "\n  " (List.map string_of_expr body)) ^ "\nend"
    (*^ (String.concat "\n\t" (List.map string_of_expr body)) ^ "\n"*)

let slurp () =
  let rec loop out =
    try loop (out ^ (read_line ()) ^ "\n")
    with End_of_file -> out
  in loop ""

let () =
  let input = Lexing.from_string @@ slurp () in
  let program = Parser.program Lexer.read input in
  let str = String.concat "\n\n" @@ List.map string_of_decl program in
  print_endline str