let slurp () =
  let rec loop out =
    try loop (out ^ (read_line ()) ^ "\n")
    with End_of_file -> out
  in loop ""

let gsub x y =
  String.map @@ fun c -> if c = x then y else c

let cify = gsub '-' '_'

let string_of_var_decl (var, typ) = cify typ ^ " " ^ cify var

let string_of_expr = function
  Syntax.Call (name, args) ->
    cify name ^ "(" ^ (String.concat ", " @@ List.map cify args) ^ ")"

let string_of_decl (name, args, body) =
  string_of_var_decl name
  ^ "(" ^ (args |> List.map string_of_var_decl |> String.concat ", ") ^ ") {\n  "
  ^ (String.concat "\n  " (List.map string_of_expr body))
  ^ "\n}"

let () =
  let input = Lexing.from_string @@ slurp () in
  let program = Parser.program Lexer.read input in
  let str = String.concat "\n\n" @@ List.map string_of_decl program in
  print_endline str
