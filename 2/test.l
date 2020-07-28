%{
 enum yytoken{
	WORD
 };
%}
%%
[a-zA-Z_][a-zA-Z0-9_]* { printf("WORD"); }
%%
struct wordinfo{
	char *filePath;
	int lineNumber;
}

struct wordtree{
	char *value;
	struct wordinfo *link;
	struct wordtree *left;
	struct wordtree *right;
}

int main(){
	yylex();
	return 0;
}
