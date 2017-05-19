let () =
  let input = Lexing.from_string (read_line ()) in
  let program = Parser.program Lexer.read input in
  print_endline @@ string_of_int program
