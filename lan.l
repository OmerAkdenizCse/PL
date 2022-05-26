%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}

%%
"int"     {
		return BIN;
		}
"print"		{  
		 return PRINT;
		}
"exit"		{
		return EXIT;
		}
"if"		{
		return IF;
		}
"else"		{
		return ELSE;
		}
"while"		{
		return WHILE;
		}
">="            {
		return GE;
		}
"<="            {
		return LE;
		}
"=="  		{
		return EQ;
		}
"!="            {
		return NE;
		}
"||"		{
		return OR;
		}
"&&"		{
		return AND;
		}
[a-zA-Z]* {	
		yylval.id = yytext[0]; return VARIABLE;
		}
0		{
		yylval.num = atoi(yytext); return INTEGER;
		}
[1-9][0-9]*	{
		yylval.num = atoi(yytext); return INTEGER;
		}
[ \t\n]		;
[-+(){}/*=;<>]	{
		return yytext[0];
		}
.		{
		ECHO; yyerror("unexpected character");
		}
%%

int yywrap (void) {
	return 1;
}