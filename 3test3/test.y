%{
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include "test.h"
#include "test.tab.h"
extern int yylineno;
%}

%union {
	struct structmeminfo *smi;
	struct structinfo *si;
	char *word;
	unsigned int type;
}
%token <type> STRUCT
%token <type> CONST
%token <type> UNSIGNED
%token <type> LONG
%token <type> INT
%token <type> VOID
%token <word> WORD
%type <si> declareStruct
%type <type> type
%type <smi> declareVar statements block

%%
declareStruct : STRUCT WORD block ';' { $$=NULL;printf("struct %s is defined",$3->name);};
block : '{' statements '}' {} ;
statements : declareVar {}
	   | statements declareVar {};
declareVar : type WORD ';' { $$=simpletest($2,$1);}
	   | type '*' WORD ';'{}
	   | STRUCT WORD WORD ';' {}
	   | STRUCT block WORD ';' {};
type : INT { $$=$1; }
     | CONST { $$=$1; }
     | LONG { $$=$1; }
     | VOID { $$=$1; } 
     | type type { $$=$1|$2; };

%%

int main(){
	return yyparse();
}
