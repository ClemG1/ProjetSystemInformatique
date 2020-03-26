all :
	yacc -d compiler.y
	flex compiler.l
	gcc lex.yy.c y.tab.c tabsymbole.c asm.c -o compiler

clean :
	rm -f lex.yy.c compiler
