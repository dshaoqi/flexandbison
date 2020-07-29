%{
#include "test.tab.h"
%}

%%
"struct" { return STRUCT; }
"unsigned" { return UNSIGNED; }
"long" { return LONG; }
"int" { return INT; }
"const" { return CONST; }
"void" { return VOID; }
[a-zA-Z_][a-zA-Z0-9_]* { return WORD; }
[ \t\n] { }
%%

