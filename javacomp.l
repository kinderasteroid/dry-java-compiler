%{
#include "y.tab.h"
%}

%%

[ \t\n]+    ;   // Ignore whitespace and newlines
"int"       { return INT; }
"if"        { return IF; }
[a-zA-Z][a-zA-Z0-9]* { yylval.str = strdup(yytext); return ID; }
[0-9]+      { yylval.str = strdup(yytext); return NUM; }
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"="         { return ASSIGN; }
"=="        { return EQ; }
"!="        { return NEQ; }
"<"         { return LT; }
">"         { return GT; }

.           { printf("Invalid token: %s\n", yytext); }
%%

