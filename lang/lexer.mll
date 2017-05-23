{ open Parser }

rule read = parse
| [ ' ' '\n' '\r' ]
  { read lexbuf }
| "proc"
  { PROC }
| "is"
  { IS }
| "of"
  { OF }
| ','
  { COMMA }
| '.'
  { PERIOD }
| ':'
  { COLON }
| ['a'-'z'] ['a'-'z' '-']*
  { IDENT (Lexing.lexeme lexbuf) }
| eof
  { EOF }
