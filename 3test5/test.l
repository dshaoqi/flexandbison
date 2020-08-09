%option noyywrap nodefault yylineno
%{
#include "test.tab.h"
#include "test.h"
char *saveword(char *yytext){
	int len=strlen(yytext);
	char *res=(char *)malloc(len+1);
	strcpy(res,yytext);
	res[len]='\0';
	printf("res=%s,yytext=%s\n",res,yytext);
	return res;
}
%}

%%
";" |
"{" |
"}" { printf("ORIGIN:%c\n",yytext[0]);return yytext[0]; }
"struct" { printf("STRUCT\n");yylval.type=1;return STRUCT; }
"unsigned" { yylval.type=2;return UNSIGNED; }
"long" { yylval.type=4;return LONG; }
"int" { printf("INT\n");yylval.type=8;return INT; }
"const" { yylval.type=16;return CONST; }
"void" { yylval.type=32;return VOID; }
[a-zA-Z_][a-zA-Z0-9_]* { printf("WORD\n");yylval.word=saveword(yytext); return WORD; }
[ \n] { }
. { printf("stange char %d",yytext[0]);}
%%

