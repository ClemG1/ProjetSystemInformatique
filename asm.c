#include <stdio.h>
#include "asm.h"
#define numberInstruction 300
#define numberField 4
#define numberTemporary 100
#define startTemporaryAddress 500

int instructionTab[numberInstruction][numberField];
int instructionIndex = 0;

int temporaryAddress = 500;

	//fill the array with '-1'
void initInstruction() {
	for(int i = 0; i < numberInstruction; i++) {
		for (int j = 0; j < numberField; j++) {
			instructionTab[i][j] = -1;
		}
	}
}

	//add an instruction in the array
void addInstruction (int code, int result, int value1, int value2) {

	switch(code) {

			//3 args
		case 1 ... 4:
		case 9 ... 11 :
			instructionTab[instructionIndex][0] = code;
			instructionTab[instructionIndex][1] = result;
			instructionTab[instructionIndex][2] = value1;
			instructionTab[instructionIndex][3] = value2;
			instructionIndex++;
			break;

			//2args
		case 5 ... 6 :
			instructionTab[instructionIndex][0] = code;
			instructionTab[instructionIndex][1] = result;
			instructionTab[instructionIndex][2] = value1;
			instructionIndex++;
			break;

			//1 arg
		case 7 ... 8 :
		case 12 :
			instructionTab[instructionIndex][0] = code;
			instructionTab[instructionIndex][1] = result;
			instructionIndex++;
			break;

		default :
			printf("Error : code unknown\n");
	}

}

	//add a temporary variable
void addTemporary(){
	temporaryAddress += 2;
}

int getTemporaryAddress() {
	return temporaryAddress;
}

void deleteTemporary() {
	temporaryAddress -= 2;
}

int operationAllowed() {
	int result = 0;
	if(temporaryAddress < 504) {
		result = -1;
	}
	return result;
}

int copyAllowed() {
	int result = 0;
	if(temporaryAddress < 502) {
		result = -1;
	}
	return result;
}

void writeJump () {
	int currentIndex = instructionIndex;
	int found = 0;
	int k = currentIndex;

	while((found == 0) && (k > 0)) {
		k--;
		if(instructionTab[k][0] == 7) {
			found = 1;
			instructionTab[k][1] = currentIndex;
		}
	}
}

void writeJumpIF () {
	int currentIndex = instructionIndex;
	int found = 0;
	int k = currentIndex;

	while((found == 0) && (k > 0)) {
		k--;
		if(instructionTab[k][0] == 8) {
			found = 1;
			instructionTab[k][2] = currentIndex;
		}
	}
}

void translate() {
	int finished = 0;
	int k = 0;
	while(!finished) {

		if(instructionTab[k][0] == -1) {
			finished = 1;
		}
		else {
			switch(instructionTab[k][0]) {

					//ADD
				case 1 :
					printf("ADD %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//MUL
				case 2 :
					printf("SUB %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//SUB
				case 3 :
					printf("MUL %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//DIV
				case 4 :
					printf("DIV %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//COP (copy)
				case 5 :
					printf("COP %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//AFC (affectation)
				case 6 :
					printf("AFC %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//JMP (jump)
				case 7 :
					printf("JMP %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//JMF (jump if)
				case 8 :
					printf("JMF %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//INF
				case 9 :
					printf("INF %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//SUP
				case 10 :
					printf("SUP %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//EQU
				case 11 :
					printf("EQU %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
					//PRI (print)
				case 12 :
					printf("PRI %d %d %d\n",instructionTab[k][1],instructionTab[k][2],instructionTab[k][3]);
					break;
				default :
					printf("Error : code unknown\n");
			}
		}
		k++;
	}
}
