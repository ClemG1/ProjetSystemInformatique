#include <string.h>
#include <stdio.h>
#include "tabsymbole.h"
#define tabSymbolSize 100

int currentDepth = 0;
int currentIndex = 0; //free to write
int currentAddress = 0; //next address available
char * currentVtype = "int"; //used to fill the type when a row is added
int isConstant = 0; //used to determine if a var is constant when a row is added

symbol tabSymbol[tabSymbolSize];

void depthUp () {
    currentDepth++;
}

void depthDown () {
    currentDepth--;
	deleteRow();
}

void initTabSymbol () {
    for (int k = 0; k < tabSymbolSize; k++) {
        tabSymbol[k].name = "";
		tabSymbol[k].address = -1;
		tabSymbol[k].vtype = "";
		tabSymbol[k].constant = 0;
		tabSymbol[k].init = 0;
		tabSymbol[k].depth = -1;    
    }
}

void deleteRow () {
    for (int k = 0; k < tabSymbolSize; k++) {
        if (tabSymbol[k].depth > currentDepth) {
            if(strcmp(tabSymbol[k].vtype,"int") == 0) {
                currentAddress -= 2;    
            }
            tabSymbol[k].name = "";
			tabSymbol[k].address = -1;
			tabSymbol[k].vtype = "";
			tabSymbol[k].constant = 0;
			tabSymbol[k].init = 0;
			tabSymbol[k].depth = -1;
            currentIndex--;     
        }    
    }
}

//Declare a var
void addRow(char * name) {
    tabSymbol[currentIndex].name = name;
    tabSymbol[currentIndex].address = currentAddress;
    tabSymbol[currentIndex].vtype = currentVtype;
    tabSymbol[currentIndex].constant = isConstant;
    tabSymbol[currentIndex].depth = currentDepth;
    if(strcmp(currentVtype,"int") == 0) {
        currentAddress += 2;    
    }
    currentIndex++;
}

//Affectation
int setInit (char * name) {
	int found = -1;
    int address = getAddressCopy(name);
    if (address != -1) {
        tabSymbol[address/2].init = 1;
        found = 0;
    }
	return found;
}

int getAddress (char * name) {
    int address = -1;
    for (int k = 0; k < tabSymbolSize; k++) {
        if( (strcmp(name,tabSymbol[k].name) == 0) && (currentDepth == tabSymbol[k].depth) ) {
            address = tabSymbol[k].address;        
        }       
    }
    return address;
} 

int getAddressCopy (char * name) {
    int address = -1;
    for (int k = 0; k < tabSymbolSize; k++) {
        if( (strcmp(name,tabSymbol[k].name) == 0)) {
            address = tabSymbol[k].address;        
        }       
    }
    return address;
} 

void setIsConstant (int value) {
	isConstant = value;
}

void setCurrentVtype (char * type) {
	currentVtype = type;
}

void displayTab() {
	int endTab = 0;
	int k = 0;
	printf("Tab :\n");
	while((endTab == 0) && (k < tabSymbolSize)) {
		if( strcmp(tabSymbol[k].name,"") == 0) {
			endTab = 1;
		}
		else {
			printf("|%s | %d | %s | %d | %d | %d |\n", tabSymbol[k].name, tabSymbol[k].address, tabSymbol[k].vtype, tabSymbol[k].constant, tabSymbol[k].init, tabSymbol[k].depth);
			k++;
		}		
	}
}
