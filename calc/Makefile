all: calc

lexer.ml: lexer.mll
	ocamllex -q lexer.mll

parser.mli parser.ml: parser.mly
	menhir parser.mly

parser.cmi: parser.mli
	ocamlc -c parser.mli

lexer.cmi lexer.cmo: lexer.ml parser.cmi
	ocamlc -c lexer.ml

parser.cmo: lexer.cmi parser.cmi
	ocamlc -c parser.ml

calc.cmi calc.cmo: calc.ml lexer.cmi parser.cmi
	ocamlc -c calc.ml

calc: calc.cmo parser.cmo lexer.cmo
	ocamlc -o calc lexer.cmo parser.cmo calc.cmo

clean:
	rm -f *.cmi *.cmo lexer.ml parser.ml parser.mli calc
