%token <int> NUMBER
%token PLUS MINUS TIMES DIVIDE
%token LPAREN RPAREN
%token EOF

%start <int> program

%%

op:
  | PLUS
    { (+) }
  | MINUS
    { (-) }
  | TIMES
    { ( * ) }
  | DIVIDE
    { (/) }

expr:
  | n = NUMBER
    { n }
  | LPAREN e = expression RPAREN
    { e }

expression:
  | n = NUMBER
    { n }
  | o = op x = expr xs = expr+
    { List.fold_right o xs x }

program:
e = expression EOF
  { e }
