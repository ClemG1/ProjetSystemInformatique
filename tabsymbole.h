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

void setRowToDefault(symbol row);
void initTabSymbol ();
void deleteRow ();
void addRow(char * name, char * vtype, int constant);
void setInit (char * name, int depth);
int getAddress (char * name, int depth);

#endif
