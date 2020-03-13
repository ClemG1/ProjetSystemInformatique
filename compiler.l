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
"{" return(tOPENBRACE);
"}" return(tCLOSEBRACE);
"const" return(tCONSTDECLARE);
"int" return(tINTDECLARE);
"printf" return(tPRINTF);
"+" return(tADD);
"-" return(tSUB);
"*" return(tMUL);
"/" return(tDIV);
"=" return(tEQ);
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
