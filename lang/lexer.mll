{ open Parser }

rule read = parse
| [ ' ' '\n' '\r' ]
  { read lexbuf }
| "proc"
  { PROC }
| "is"
  { IS }
| ','
  { COMMA }
| '.'
  { PERIOD }
| ['a'-'z'] ['a'-'z' '-']*
  { IDENT (Lexing.lexeme lexbuf) }
| eof
  { EOF }
