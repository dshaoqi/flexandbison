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
	struct structmeminfo *memberInfo;
};
%}

%union {
	struct structmeminfo smi;
	
}
%token STRUCT
%token CONST
%token UNSIGNED
%token LONG
%token INT
%token void
%%
type : INT
     | CONST
     | LONG
     | VOID 
     | type type ;
declareVar : type WORD ';'
	   | type '*' WORD ';'
	   | STRUCT WORD WORD ';'
	   | STRUCT block WORD ';';
statements : declareVar
	   | statements statements;
block : '{' statements '}'
declareStruct : STRUCT WORD block ';';
%%

struct wordExistInfo{
	char *filePath;
	unsigned int *lineNumber;
};

struct word{
	char *value;
	char *defFilePath;
	struct wordExistinfo *earray;
};

void getStrInfo(const char *s){
	printf("%s",s);
}

int main(){
	yylex();
	return 0;
}
