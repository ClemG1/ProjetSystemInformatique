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
{name} return(tNAME);
{integer} {
    yylval=atoi(yytext);
    return(tINT);}
{exponent} return(tEXPONENT);
{separator} {}

%%
int yywrap(void) {return 1;}

