a.out : test.l test.y
	bison -d test.y
	flex test.l
	gcc test.tab.c lex.yy.c 
