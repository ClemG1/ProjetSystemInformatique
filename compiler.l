%{
    #include "y.tab.h"
    #include <stdlib.h>
%}

number [0-9]
integer {number}+
exponent [eE][+-]{integer}
letter [A-Za-z]
name {letter}({number}|{letter}|_)*
separator [ \t]+

%%

"main" return(tMAIN);
"if" return(tIF);
"else" return(tELSE);
"while" return(tWHILE);
"{" return(tOPENBRACE);
"}" return(tCLOSEBRACE);
"const" return(tCONSTDECLARE);
"int" {
	yylval.str=strdup(yytext);
	return(tINTDECLARE);}
"printf" return(tPRINTF);
"+" return(tADD);
"-" return(tSUB);
"*" return(tMUL);
"/" return(tDIV);
"=" return(tEQ);
"<" return(tINF);
">" return(tSUP);
"(" return(tOPENBRACKET);
")" return(tCLOSEBRACKET);
"," return(tCOMMA);
\n {}
";" return(tSEMICOLON);
{name} {
    yylval.str=strdup(yytext);    
    return(tNAME);}
{integer} {
    yylval.nb=atoi(yytext);
    return(tINT);}
{exponent} {
    yylval.nb=(int)atof(yytext);
    return(tEXPONENT);}
{separator} {}

%%
int yywrap(void) {return 1;}

