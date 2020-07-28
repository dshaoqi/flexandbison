%{
#include <stdio.h>
void yyerror(const char * msg){}
%}
%token KEY_IF
%token KEY_ELSE


%%
statement : expr KEY_SEMICOLON
expr : WORD {}
     | NUM  {}	
     | expr KEY_COMP expr {}
%%

int main(){
	return yyparse();
}
