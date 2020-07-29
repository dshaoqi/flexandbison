%{
 enum yytoken{
	WORD
 };
void getStrInfo(const char * s);
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { getStrInfo(yytext); }
%%

struct wordinfo{
	char *filePath;
	int lineNumber;
};


struct wordtree{
	char *value;
	struct wordinfo *wlink;
	struct wordtree *left;
	struct wordtree *right;
};
 
void getStrInfo(const char *s){
	printf("%s",s);
}

int main(){
	yylex();
	return 0;
}
