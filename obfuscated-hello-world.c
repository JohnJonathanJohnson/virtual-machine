//Boilerplate. Cannot modify.
//Note that you could store values between blocks in the vars[0] stack.
//+1 because 0 is reserved for vars[0] stack.
#include <stdio.h>
#include <stdlib.h>
#define VAR_COUNT 2

typedef struct node {
	long val;
	struct node* next;
} Node;

typedef struct {
	int size;
	Node* top;
} Stack;

Stack* vars[VAR_COUNT + 1];

void push(int stack, int input) {

	Node* new_node = malloc(sizeof(Node));
	new_node->val = input;
	new_node->next = vars[stack]->top;
	vars[stack]->top = new_node;
	vars[stack]->size++;
}

int pop(int stack) {

	if (vars[stack]->size == 0) {
		fprintf(stderr, "Popped too hard!\n");
	}

	Node* top = vars[stack]->top;
	vars[stack]->top = vars[stack]->top->next;
	vars[stack]->size--;
	int ret_val = top->val;
	free(top);

	return ret_val;
}

int peek(int stack) {

	return vars[stack]->top->val;
}

int size(int stack) {

	return vars[stack]->size;
}

void flush(int stack) {

	vars[stack]->size = 0;
	Node* top = vars[stack]->top;
	while (top != NULL) {
		Node* next = top->next;
		free(top);
		top = next;
	}
	vars[stack]->top = top;
}

void ren(int old, int new) {

	if (vars[new] != vars[old]) {
		Node* top = vars[new]->top;
		while (top != NULL) {
			Node* next = top->next;
			free(top);
			top = next;
		}
	}

	vars[new] = vars[old];
	Stack* newOld = malloc(sizeof(Stack));
	newOld->size = 0;
	newOld->top = NULL;
	vars[old] = newOld;
}

int main() {

	for (int i = 0; i <= VAR_COUNT; i++) {
		vars[i] = malloc(sizeof(Stack));
		vars[i]->size = 0;
		vars[i]->top = NULL;
	}

	push(0, 0);
	//Start of global code.
	push(0, -5);
	//End of global code.
	goto L0;
L0:
	//Switch hub.
	if (size(0) == 0) return 1;
	switch (pop(0)) {
		case 0: return 0; break;
		case -1: goto L1; break;
		case -2: goto L2; break;
		case -3: goto L3; break;
		case -4: goto L4; break;
		case -5: goto L5; break;
		case -6: goto L6; break;
		case -7: goto L7; break;
		default: return 1;
	}
	//End of boilerplate code. Of course, the number of cases are increased by how many blocks there are, same for variables.
L1:	//Push into var opcode.
	push(pop(0), pop(0));
	goto L0;

L2:	//rename opcode.
	ren(pop(0), pop(0));
	goto L0;

L3:	//print opcode. Has no type inference. Not until I put it in the compiler.
	printf("%c", pop(pop(0)));
	goto L0;
L4:
	push(0, 2);
	push(0, 1);
	push(0, -2); //This is equivalent to 2 1 RENAME.
	goto L0;

L5:	//Program start.
	//Hello, World.
	//Note that I'll have to split the code every branch or jump.
	//And that it's currently in prefix notation. To convert it to postfix,
	//just reverse the parsing or something like that.
	push(0, -7);
	push(0, -6);
	push(0, -7);
	push(0, 1); //say var name
	push(0, 'H');
	push(0, -1); //PUSH code
	push(0, 1);
	push(0, 'e');
	push(0, -1);
	push(0, 1);
	push(0, 'l');
	push(0, -1);
	push(0, 1);
	push(0, 'l');
	push(0, -1);
	push(0, 1);
	push(0, 'o');
	push(0, -1);
	push(0, 1);
	push(0, ',');
	push(0, -1);
	push(0, 1);
	push(0, ' '); //say what value to be pushed
	push(0, -1);
	goto L0;

L6:
	push(0, -4);
	push(0, 2);
	push(0, 'W');
	push(0, -1);
	push(0, 2);
	push(0, 'o');
	push(0, -1);
	push(0, 2);
	push(0, 'r');
	push(0, -1);
	push(0, 2);
	push(0, 'l');
	push(0, -1);
	push(0, 2);
	push(0, 'd');
	push(0, -1);
	push(0, 2);
	push(0, '!');
	push(0, -1);
	push(0, 2);
	push(0, '\n');
	push(0, -1);
	goto L0;

L7:	//Print and pop stack.
	if (size(1) > 1) push(0, -7);
	push(0, 1);
	push(0, -3);
	goto L0;
}
