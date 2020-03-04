%{
    #include <stdio.h>
    int yylex();
    void yyerror(char * str);
%}

%token tMUL tDIV tADD tSUB tEQ
%token tMAIN tPRINTF
%token tOPENBRACE tCLOSEBRACE tOPENBRACKET tCLOSEBRACKET
%token tCONSTDECLARE tINTDECLARE
%token tCOMMA tSEMICOLON
%token tNAME
%token tINT
%token tEXPONENT

%start File;

%%

    File : tINT tMAIN tOPENBRACKET tCLOSEBRACKET tOPENBRACE Body tCLOSEBRACE;

    Body :
        /*vide*/
        | Instruction Body
        ;
    
    Instruction : 
        Definition
        | Allocation
        | Function
        ;

    Definition : Prefix DefVar DefVarN tSEMICOLON;

    Prefix :
        Type
        | tCONSTDECLARE Type
        ;

    Type : tINTDECLARE;

    DefVAr :
        tName 
        | tNAME tEQ  Value
        ;
    
    DefVarN :
        /*vide*/
        | tCOMMA DefVar
        ;
    
    Value : tINT;

    Allocation : tNAME tEQ Expression tSEMICOLON;

    Expression :
        Value
        | Expression tADD Expression
        | Expression tSUB Expression
        | Expression tMUL Expression
        | Expression tDIV Expression
        | tSUB Expression
        | tOPENBRACKET Expression tCLOSEBRACKET
        ;

    Function : 
        tPRINTF tOPENBRACKET tNAME tCLOSEBRACKET tSEMICOLON
        | tPRINTF tOPENBRACKET Expression tCLOSEBRACKET tSEMICOLON
        ;

%%
void yyerror(char * str){printf("%s",str);}
int main(){yyparse();return 0;}
