#include <string.h>
#include "tabsymbole.h"
#define tabSymbolSize 100

int currentDepth = 0;
int currentIndex = 0; //free to write
int currentAddress = 0; //next address available

symbol tabSymbol[tabSymbolSize];

void depthUp () {
    currentDepth++;
}

void depthDown () {
    currentDepth--;
}

void setRowToDefault(symbol row) {
    row.name = "";
    row.address = -1;
    row.vtype = "";
    row.constant = 0;
    row.init = 0;
    row.depth = -1;    
}

void initTabSymbol () {
    for (int k = 0; k < tabSymbolSize; k++) {
        setRowToDefault(tabSymbol[k]);    
    }
}

void deleteRow () {
    for (int k = 0; k < tabSymbolSize; k++) {
        if (tabSymbol[k].depth > currentDepth) {
            if(strcmp(tabSymbol[k].vtype,"int") == 0) {
                currentAddress -= 2;    
            }
            setRowToDefault(tabSymbol[k]);
            currentIndex--;     
        }    
    }
}

//Declare a var
void addRow(char * name, char * vtype, int constant) {
    tabSymbol[currentIndex].name = name;
    tabSymbol[currentIndex].address = currentAddress;
    tabSymbol[currentIndex].vtype = vtype;
    tabSymbol[currentIndex].constant = constant;
    tabSymbol[currentIndex].depth = currentDepth;
    if(strcmp(vtype,"int") == 0) {
        currentAddress += 2;    
    }
    currentIndex++;
}

//Affectation
void setInit (char * name, int depth) {
    for (int k = 0; k < tabSymbolSize; k++) {
        if( (strcmp(name,tabSymbol[k].name) == 0) && (depth == tabSymbol[k].depth) ) {
            tabSymbol[k].init = 1;               
        }
    }
}

int getAddress (char * name, int depth) {
    int address = -1;
    for (int k = 0; k < tabSymbolSize; k++) {
        if( (strcmp(name,tabSymbol[k].name) == 0) && (depth == tabSymbol[k].depth) ) {
            address = tabSymbol[k].address;        
        }       
    }
    return address;
} 
