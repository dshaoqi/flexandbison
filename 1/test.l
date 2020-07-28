%{
 enum yytoken {
	NUM,WORD 
 };
%}
%%
\/\*	{ printf("commend out begin"); }
\*\/	{ printf("commend out end"); }
,	{ printf("KEY_COMMA"); }
\(	{ printf("KEY_LP"); }
\)	{ printf("KEY_RP"); }
&	{ printf("KEY_GETADDR"); }
{	{ printf("KEY_LB"); }
}	{ printf("KEY_RB"); }
;	{ printf("KEY_SEMICOLON"); }
\->	{ printf("KEY_GET"); }
struct  { printf("KEY_STRUCT"); }
false	{ printf("KEY_FALSE"); }
true	{ printf("KEY_TRUE"); }
bool	{ printf("KEY_BOOL"); }
#	{ printf("KEY_PREDEL"); }
define	{ printf("KEY_DEFINE"); }
static  { printf("KEY_STATIC"); }
unsigned	{ printf("KEY_UNSIGNED"); }
long	{ printf("KEY_LONG"); }
int	{ printf("KEY_INT"); }
void	{ printf("KEY_VOID"); }
([><=]=)|([<>])|(=[<>])	{ printf("KEY_COMP"); }
\|\|	{ printf("KEY_OR"); }
=	{ printf("KEY_SET"); }
return	{ printf("KEY_RETURN"); }
if	{ printf("KEY_IF"); }
(0x)?[0-9]+ 	{ printf("NUM"); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("WORD"); }
%%

int main(){
	yylex();
	return 0;
}
