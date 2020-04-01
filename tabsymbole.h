#ifndef TABSYMBOLE
#define TABSYMBOLE

typedef struct {
    char* name;
    int address;
    char* vtype;
    int constant;
    int init;
    int depth;
}symbol;

void depthUp ();
void depthDown ();

void initTabSymbol ();
void deleteRow ();
void addRow(char * name);
int setInit (char * name);
int getAddress (char * name);
int getAddressCopy (char * name);
void setIsConstant (int value);
void setCurrentVtype (char * type);
void displayTab();

#endif
