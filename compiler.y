%{
    #include <stdio.h>
	#include <stdlib.h>
	#include "tabsymbole.h"
    int yylex();
    void yyerror(char * str);
%}

%union{
    int nb;
    char* str;
}

%token tMUL tDIV tADD tSUB tEQ
%token tMAIN tPRINTF tIF tELSE
%token tOPENBRACE tCLOSEBRACE tOPENBRACKET tCLOSEBRACKET
%token tCONSTDECLARE 
%token tCOMMA tSEMICOLON
%token <str> tNAME tINTDECLARE
%token <nb> tINT tEXPONENT
%type <nb> Expression 
%type <nb> Value




%right tEQ
%left tADD tSUB
%left tMUL tDIV




%start File;

%%

    File : 
		tINTDECLARE tMAIN {initTabSymbol();} tOPENBRACKET tCLOSEBRACKET tOPENBRACE Body tCLOSEBRACE {displayTab();};

    Body :
        /*vide*/
        | Instruction Body
        ;
	
    Instruction : 
        Definition
        | Allocation
        | Function
		| Condition
        ;

    Definition : 
		Prefix DefVar DefVarN tSEMICOLON;

    Prefix :
        Type {setIsConstant(0);}
        | tCONSTDECLARE Type {setIsConstant(1);}
        ;

    Type : 
		tINTDECLARE {setCurrentVtype($1);};

    DefVar :
        tNAME {addRow($1);}
        | tNAME tEQ  Value {
							addRow($1);
							setInit($1);}
        ;
    
    DefVarN :
        /*vide*/
        | tCOMMA DefVar
        ;
    
    Value : 
        tINT {$$=$1;}
        ;

    Allocation : 
		tNAME tEQ Expression tSEMICOLON {if(setInit($1) == -1) {
											yyerror("Error : Variable not declared\n");	
										}};

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
	
	Condition :
		tIF tOPENBRACKET Test tCLOSEBRACKET tOPENBRACE {depthUp();} Body tCLOSEBRACE {depthDown();} Alternative;

	Alternative :
		/*vide*/	
		| tELSE tOPENBRACE {depthUp();} Body tCLOSEBRACE {depthDown();}
		;

	Test :
		tNAME tEQ Value;

%%
void yyerror(char * str){printf("%s",str);}
int main(){yyparse();return 0;}
