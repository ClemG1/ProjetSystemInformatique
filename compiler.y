%{
    #include <stdio.h>
	#include <stdlib.h>
	#include "tabsymbole.h"
    #include "asm.h"
    int yylex();
    void yyerror(char * str);
%}

%union{
    int nb;
    char* str;
}

%token tMUL tDIV tADD tSUB tEQ tINF tSUP
%token tMAIN tPRINTF tIF tELSE
%token tOPENBRACE tCLOSEBRACE tOPENBRACKET tCLOSEBRACKET
%token tCONSTDECLARE 
%token tCOMMA tSEMICOLON
%token <str> tNAME tINTDECLARE
%token <nb> tINT tEXPONENT

%right tEQ tINF tSUP
%left tADD tSUB
%left tMUL tDIV

%start File;

%%

    File : 
		tINTDECLARE tMAIN {initTabSymbol(); initInstruction();} tOPENBRACKET tCLOSEBRACKET tOPENBRACE Body tCLOSEBRACE {displayTab();translate();};

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
        | tNAME tEQ  Expression {
							addRow($1);
							setInit($1);
                            if(copyAllowed() == -1) {
                                yyerror("Error : no temporary variable\n");
                            }
                            addInstruction(5,getAddressCopy($1),getTemporaryAddress()-2,-1);deleteTemporary();}
        ;
    
    DefVarN :
        /*vide*/
        | tCOMMA DefVar
        ;
    
    Value : 
        tINT {addInstruction(6,getTemporaryAddress(),$1,-1);addTemporary();}
        | tNAME {addInstruction(5,getTemporaryAddress(),getAddress($1),-1);addTemporary();}
        ;

    Allocation : 
		tNAME tEQ Expression tSEMICOLON {if(setInit($1) == -1) {
											yyerror("Error : Variable not declared\n");	
										}
                                        if(copyAllowed() == -1) {
                                            yyerror("Error : no temporary variable\n");
                                        }
                                        addInstruction(5,getAddressCopy($1),getTemporaryAddress()-2,-1);deleteTemporary();
                                        }
        ;

    Expression :
        Value
        | Expression tADD Expression {
                                        if(operationAllowed() == -1) {
                                            yyerror("Error : no temporary variable\n");
                                        }
                                        addInstruction(1,getTemporaryAddress()-4,getTemporaryAddress()-4,getTemporaryAddress()-2);deleteTemporary();
                                    }
        | Expression tSUB Expression {
                                        if(operationAllowed() == -1) {
                                            yyerror("Error : no temporary variable\n");
                                        }
                                        addInstruction(3,getTemporaryAddress()-4,getTemporaryAddress()-4,getTemporaryAddress()-2);deleteTemporary();
                                    }
        | Expression tMUL Expression {
                                        if(operationAllowed() == -1) {
                                            yyerror("Error : no temporary variable\n");
                                        }
                                        addInstruction(2,getTemporaryAddress()-4,getTemporaryAddress()-4,getTemporaryAddress()-2);deleteTemporary();
                                    }
        | Expression tDIV Expression {
                                        if(operationAllowed() == -1) {
                                            yyerror("Error : no temporary variable\n");
                                        }
                                        addInstruction(4,getTemporaryAddress()-4,getTemporaryAddress()-4,getTemporaryAddress()-2);deleteTemporary();
                                    }
        | tSUB {addInstruction(6,getTemporaryAddress(),0,-1);addTemporary();} Expression {
                                                                                            if(operationAllowed() == -1) {
                                                                                                yyerror("Error : no temporary variable\n");
                                                                                            }
                                                                                            addInstruction(3,getTemporaryAddress()-4,getTemporaryAddress()-4,getTemporaryAddress()-2);
                                                                                            }
        | tOPENBRACKET Expression tCLOSEBRACKET
        ;

    Function : 
        tPRINTF tOPENBRACKET Expression tCLOSEBRACKET tSEMICOLON {
                                                                    if(copyAllowed() == -1) {
                                                                        yyerror("Error : no temporary variable\n");
                                                                    }
                                                                    addInstruction(12,getTemporaryAddress()-2,-1,-1); deleteTemporary();}
        ;
	
	Condition :
		tIF tOPENBRACKET Test {
                                addInstruction(8,getTemporaryAddress()-2,-1,-1);
                                deleteTemporary();
                                } 
                                tCLOSEBRACKET tOPENBRACE {depthUp();} Body tCLOSEBRACE {
                                                                                        depthDown();
                                                                                        writeJumpIF();
                                                                                        } Alternative
        ;

	Alternative :
		/*vide*/	
		| tELSE {
                addInstruction(7,-1,-1,-1);
                writeJumpIF();
                } tOPENBRACE {depthUp();} Body tCLOSEBRACE {
                                                            depthDown();
                                                            writeJump();
                                                            }
		;

	Test :
		Expression tEQ Expression {
                                    if(operationAllowed() == -1) {
                                        yyerror("Error : no temporary variable\n");
                                    }
                                    addInstruction(11,getTemporaryAddress()-4,getTemporaryAddress()-4,getTemporaryAddress()-2);
                                    deleteTemporary();
                                    }
        | Expression tSUP Expression {
                                    if(operationAllowed() == -1) {
                                        yyerror("Error : no temporary variable\n");
                                    }
                                    addInstruction(10,getTemporaryAddress()-4,getTemporaryAddress()-4,getTemporaryAddress()-2);
                                    deleteTemporary();
                                    }
        | Expression tINF Expression {
                                    if(operationAllowed() == -1) {
                                        yyerror("Error : no temporary variable\n");
                                    }
                                    addInstruction(9,getTemporaryAddress()-4,getTemporaryAddress()-4,getTemporaryAddress()-2);
                                    deleteTemporary();
                                    }
        ;

%%
void yyerror(char * str){printf("%s",str);}
int main(){yyparse();return 0;}
