{ open Parser }

rule read = parse
  | [' ' '\n' '\r']
    { read lexbuf }
  | ['0'-'9']+
    { NUMBER (int_of_string (Lexing.lexeme lexbuf)) }
  | '+' | "add" | "plus"
    { PLUS }
  | '-' | "sub"
    { MINUS }
  | '*' | "mul"
    { TIMES }
  | '/' | "div"
    { DIVIDE }
  | '('
    { LPAREN }
  | ')'
    { RPAREN }
  | eof
    { EOF }
