all:
	lex CS315s20_group20.lex
	yacc CS315s20_group20.yacc
	gcc -o parser y.tab.c
	./parser < CS315s20_group.test
