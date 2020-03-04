number [0-9]
integer {number}+
exponent [eE][+-]{integer}
letter [A-Za-z]
name {letter}({number}|{letter}|_)*
separator [ \t]+

%%

"main" {printf("tkMain ");}
"{" {printf("tkOpenBrace ");}
"}" {printf("tkCloseBrace ");}
"const" {printf("tkConstDeclare ");}
"int" {printf("tkIntDeclare ");}
"printf" {printf("tkPrintf ");}
"+" {printf("tkAdd ");}
"-" {printf("tkSub ");}
"*" {printf("tkMul ");}
"/" {printf("tkDiv ");}
"=" {printf("tkEq ");}
"(" {printf("tkOpenBracket ");}
")" {printf("tkCloseBracket ");}
"," {printf("tkComma ");}
\n {printf("\n");}
";" {printf("tkSemiColon");}
{name} {printf("tkName ");}
{integer} {printf("tkInt ");}
{exponent} {printf("tkExponent ");}
{separator} {}
. {printf("tkError ");}

%%
int yywrap(void) {return 1;}
int main() {while(yylex()!=0);return 0;}
