%{
#include <stdio.h>
#include <stdlib.h>
%}

%token INT IF ID NUM ADD SUB MUL DIV ASSIGN EQ NEQ LT GT

%start program

%%

program: statement
       | program statement
       ;

statement: ID ASSIGN expression
         | IF '(' expression ')' statement
         | INT ID ';'
         ;

expression: expression ADD term
          | expression SUB term
          | term
          ;

term: term MUL factor
     | term DIV factor
     | factor
     ;

factor: NUM
       | ID
       | '(' expression ')'
       ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(const char* msg) {
    fprintf(stderr, "Parser Error: %s\n", msg);
}

