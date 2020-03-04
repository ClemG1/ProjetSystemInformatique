all :
	flex lexical.l
	gcc lex.yy.c -o lexer

clean :
	rm -f lex.yy.c lexer
