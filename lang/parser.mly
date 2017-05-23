%{
open Syntax

let with_default x = function | Some y -> y | None -> x
%}

%token <string> IDENT

%token PROC OF IS
(* %token IF THEN ELSE *)
%token PERIOD COMMA COLON

%token EOF

%start <Syntax.declaration list> program

%%

program:
| EOF
  { [] }
| d = declaration; r = program
  { d :: r }


declaration:
| PROC name = var_decl
  IS body = separated_nonempty_list(COMMA, expression)
  PERIOD
  { (name, [], body) }

| PROC name = var_decl
  OF args = separated_nonempty_list(COMMA, var_decl)
  IS body = separated_nonempty_list(COMMA, expression)
  PERIOD
  { (name, args, body) }


var_decl:
| var = IDENT
  { (var, "void") }
| var = IDENT COLON type_ = IDENT
  { (var, type_) }


expression:
| proc = IDENT; args = IDENT*
  { Syntax.Call (proc, args) }
