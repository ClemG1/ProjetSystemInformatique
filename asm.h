#ifndef ASM
#define ASM

	//fill the array with '-1'
void initInstruction();
	//add an instruction in the array
void addInstruction (int code, int result, int value1, int value2);
	//add a temporary variable
void addTemporary();

int getTemporaryAddress();

void deleteTemporary();

int operationAllowed();

int copyAllowed();

void translate();

#endif