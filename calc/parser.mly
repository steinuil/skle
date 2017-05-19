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

expression:
  | n = NUMBER
    { n }
  | o = op x = expression y = expression
    { o x y }
  | LPAREN e = expression RPAREN
    { e }

program:
  e = expression EOF
  { e }
