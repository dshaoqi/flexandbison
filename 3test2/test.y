%{
#include <stdio.h>
#include <stdlib.h>
extern int yylineno;
struct structmeminfo{
	char *name;
	unsigned int type;
	struct structmeminfo *next;
};

struct structinfo{
	char *flleName;
	unsigned int lineNumber;
	struct structmeminfo *smi;
};

struct meminfo * simpletest(char *name,unsigned int type){	
	struct meminfo *res=(struct meminfo *)malloc(sizeof(struct meminfo));
	res->name=name;
	res->type=type;
	res->next=null;
	return res;
}
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
%type <sm> declareStruct
%type <type> type
%type <smi> declareVar statements block

%%
declareStruct : STRUCT WORD block ';' { $$=null;printf("struct %s is defined",$3.name);};
block : '{' statements '}' {} ;
statements : declareVar {}
	   | statements statements {};
declareVar : type WORD ';' { $$=simpletest($2,$1);}
	   | type '*' WORD ';'{}
	   | STRUCT WORD WORD ';' {}
	   | STRUCT block WORD ';' {};
type : INT { $$=$1; }
     | CONST { $$=$1; }
     | LONG { $$=$1; }
     | VOID { $$=$1; } 
     | type type { $$=$1|$2 };

%%

int main(){
	return yyparse();
}
