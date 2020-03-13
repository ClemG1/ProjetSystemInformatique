all :
	yacc -d compiler.y
	flex -d compiler.l
	gcc lex.yy.c y.tab.c -o compiler

clean :
	rm -f lex.yy.c compiler
