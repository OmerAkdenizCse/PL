%{
void yyerror (char *s);
int yylex();
#include <stdio.h>    
#include <stdlib.h>
#include <ctype.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}

%union {
    char id;
    int num;
};

%token BIN
%token <num> INTEGER
%token <id> VARIABLE
%token WHILE IF PRINT EXIT THEN ELSE

%left GE LE EQ NE OR AND 
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%nonassoc IFX

%type <id> stmt stmtlist expr

%%

program:
        function                { }
        ;

function:
          function stmt         { }
        |
        ;

stmt:
          ';'                            {  }
        | expr ';'                       {  }
        | PRINT expr ';'                 {  }
        | EXIT ';'                       { exit(EXIT_SUCCESS); }
        | BIN VARIABLE '=' expr ';'      {  }
        | WHILE '(' expr ')' stmt        {  }
        | IF '(' expr ')' stmt %prec IFX {  }
        | IF '(' expr ')' stmt ELSE stmt {  }
        | '{' stmtlist '}'              {  }
        ;

stmtlist:
          stmt                  { }
        | stmtlist stmt        {  }
        ;

expr:
          INTEGER               { }
        | VARIABLE              { }
        | '-' expr %prec UMINUS { }
        | expr '+' expr         { }
        | expr '-' expr         { }
        | expr '*' expr         { }
        | expr '/' expr         { }
        | expr '<' expr         { }
        | expr '>' expr         { }
        | expr GE expr          { }
        | expr LE expr          { }
        | expr NE expr          { }
        | expr EQ expr          { }
        | expr OR expr          { }
        | expr AND expr         { }
        | '(' expr ')'          { }
        ;

%%
void yyerror(char *s) {
    fprintf(stdout, "%s\n", s);
}

int main(void) {
    return yyparse();
}