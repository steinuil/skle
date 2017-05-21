%{ open Syntax
%}

%token PROC IS
(* %token IF THEN ELSE *)

%token <string> IDENT

%token PERIOD COMMA

%token EOF

%start <Syntax.declaration list> program

%%

program:
| EOF
  { [] }
| d = declaration; r = program
  { d :: r }

declaration:
PROC name = IDENT args = IDENT* IS body = separated_nonempty_list(COMMA, expression) PERIOD
  { Syntax.Def (name, args, body) }

expression:
proc = IDENT; args = IDENT*
{ Syntax.Proc (proc, args) }
