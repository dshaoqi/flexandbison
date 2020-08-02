%option noyywrap nodefault yylineno
%{
#include "test.tab.h"
#include "test.h"
char *saveword(char *yytext){
	int len=strlen(yytext);
	char *res=(char *)malloc(len+1);
	strcpy(res,yytext);
	printf("res=%s,yytext=%s",res,yytext);
	return res;
}
%}

%%
";" |
"{" |
"}" { return yytext[0]; }
"struct" { yylval.type=1;return STRUCT; }
"unsigned" { yylval.type=2;return UNSIGNED; }
"long" { yylval.type=4;return LONG; }
"int" { yylval.type=8;return INT; }
"const" { yylval.type=16;return CONST; }
"void" { yylval.type=32;return VOID; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.word=saveword(yytext); return WORD; }
. { }
%%

