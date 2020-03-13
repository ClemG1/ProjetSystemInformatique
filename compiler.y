%{
    #include <stdio.h>
    int yylex();
    void yyerror(char * str);
%}

%union{
    int nb;
    char* str;
}

%token tMUL tDIV tADD tSUB tEQ
%token tMAIN tPRINTF
%token tOPENBRACE tCLOSEBRACE tOPENBRACKET tCLOSEBRACKET
%token tCONSTDECLARE tINTDECLARE
%token tCOMMA tSEMICOLON
%token <str> tNAME
%token <nb> tINT tEXPONENT
%type <nb> Expression 
%type <nb> Value



%right tEQ
%left tADD tSUB
%left tMUL tDIV




%start File;

%%

    File : tINTDECLARE tMAIN tOPENBRACKET tCLOSEBRACKET tOPENBRACE Body tCLOSEBRACE;

    Body :
        /*vide*/
        | Instruction Body
        ;
    
    Instruction : 
        Definition
        | Allocation
        | Function
        ;

    Definition : Prefix DefVar DefVarN tSEMICOLON {printf("reconnu def");};

    Prefix :
        Type
        | tCONSTDECLARE Type
        ;

    Type : tINTDECLARE;

    DefVar :
        tNAME 
        | tNAME tEQ  Value
        ;
    
    DefVarN :
        /*vide*/
        | tCOMMA DefVar
        ;
    
    Value : 
        tINT {$$=$1;}
        ;

    Allocation : tNAME tEQ Expression tSEMICOLON;

    Expression :
        Value {$$=$1;}
        | Expression tADD Expression {$$ =$1+$3;}
        | Expression tSUB Expression {$$ =$1-$3;}
        | Expression tMUL Expression {$$ =$1*$3;}
        | Expression tDIV Expression {$$ =$1/$3;}
        | tSUB Expression {$$ =-$2;}
        | tOPENBRACKET Expression tCLOSEBRACKET{$$ =$2;}
        ;

    Function : 
        tPRINTF tOPENBRACKET tNAME tCLOSEBRACKET tSEMICOLON {printf("%s",$3);}
        | tPRINTF tOPENBRACKET Expression tCLOSEBRACKET tSEMICOLON {printf("%d",$3);}
        ;

%%
void yyerror(char * str){printf("%s",str);}
int main(){yyparse();return 0;}
