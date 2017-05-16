%token <int> NUMBER
%token PLUS
%token MINUS
%token TIMES
%token DIVIDE
%token LPAREN
%token RPAREN
%token EOF

%start program
%type <int> program

%%

expression:
  | n = NUMBER
    { n }
  | TIMES x = expression y = expression
    { x * y }
  | DIVIDE x = expression y = expression
    { x / y }
  | PLUS x = expression y = expression
    { x + y }
  | MINUS x = expression y = expression
    { x - y }
  | LPAREN e = expression RPAREN
    { e }
;

program:
  e = expression EOF
  { e }
;
