//Boilerplate. Cannot modify.
//Note that you could store values between blocks in the vars[0] stack.
//+2 because 0 is reserved for inst stack and 1 is reserved for buffer stack.
#include <stdio.h>
#include <stdlib.h>
#define VAR_COUNT 1

//For now, var = -1, inst = 0, int = 1, float = 2 (Unimplemented), char = 3.
typedef struct {
	int val;
	int type;
} Value;

typedef struct node {
	Value* val;
	struct node* next;
} Node;

typedef struct {
	int size;
	Node* top;
} Stack;

Stack* vars[VAR_COUNT + 2];

void push(int stack, int val, int type) {

	Node* new_node = malloc(sizeof(Node));
	new_node->val = malloc(sizeof(Value));
	new_node->val->val = val;
	new_node->val->type = type;
	new_node->next = vars[stack]->top;
	vars[stack]->top = new_node;
	vars[stack]->size++;
}

Value pop(int stack) {

	if (vars[stack]->size == 0) {
		fprintf(stderr, "Popped too hard!\n");
	}

	Node* top = vars[stack]->top;
	vars[stack]->top = vars[stack]->top->next;
	vars[stack]->size--;
	Value ret_val;
	ret_val.val = top->val->val;
	ret_val.type = top->val->type;
	free(top->val);
	free(top);

	return ret_val;
}

Value peek(int stack) {

	Value ret_val;
	ret_val.val = vars[stack]->top->val->val;
	ret_val.type = vars[stack]->top->val->type;
	return ret_val;
}

int size(int stack) {

	return vars[stack]->size;
}

void flush(int stack) {

	vars[stack]->size = 0;
	Node* top = vars[stack]->top;
	while (top != NULL) {
		Node* next = top->next;
		free(top->val);
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
			free(top->val);
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

void clone(int orig, int clon) {

	Node* otop = vars[orig]->top;
	Node* ctop = vars[clon]->top;
	vars[clon]->size = vars[orig]->size;

	while (ctop != NULL) {
		Node* next = ctop->next;
		free(ctop->val);
		free(ctop);
		ctop = next;
	}

	ctop = malloc(sizeof(Node));
	vars[clon]->top = ctop;

	while (otop != NULL) {
		ctop->val = malloc(sizeof(Value));
		ctop->val->val = otop->val->val;
		ctop->val->type = otop->val->type;
		otop = otop->next;
		ctop = ctop->next;
		ctop = malloc(sizeof(Node));
	}

	free(ctop);
	ctop = NULL;
}

int main() {

	for (int i = 0; i < VAR_COUNT + 2; i++) {
		vars[i] = malloc(sizeof(Stack));
		vars[i]->size = 0;
		vars[i]->top = NULL;
	}

	Value top;
	top.val = 0;
	top.type = 0;

	push(0, 0, 0);
	//Start of global code.
	//Reminder that variables start at 2.
	push(0, 11, 0); //PRINT
	push(0, 11, 0); //PRINT
	push(0, '\n', 3); //NEWLINE
	push(0, 10, 0); //DIV
	push(0, 3, 1); //3
	push(0, 2, 0); //POP
	push(0, 2, -1); //FIRST_VAR
	push(0, 11, 0); //PRINT
	push(0, 3, 0); //PEEK
	push(0, 2, -1); //FIRST_VAR
	push(0, 1, 0); //PUSH
	push(0, 12, 0); //SCAN
	push(0, 0, 1); //INT
	push(0, 2, -1); //FIRST_VAR
	//End of global code.
	goto L0;
L0:
	//Switch hub.
	if (size(0) == 0) return 1;
	top = pop(0);
	switch (top.type) {
		case 0: switch (top.val) {
			case 0: return 0; break;
			case 1: goto L1; break;
			case 2: goto L2; break;
			case 3: goto L3; break;
			case 4: goto L4; break;
			case 5: goto L5; break;
			case 6: goto L6; break;
			case 7: goto L7; break;
			case 8: goto L8; break;
			case 9: goto L9; break;
			case 10: goto L10; break;
			case 11: goto L11; break;
			case 12: goto L12; break;
			default: return 1;
		}

		default: push(1, top.val, top.type); goto L0;
	}
L1:	//push into var.
	push(pop(1).val, pop(1).val, peek(1).type);
	goto L0;

L2:	//pop from var.
	push(1, pop(pop(1).val).val, peek(peek(1).val).type);
	goto L0;

L3:	//peek var.
	push(1, peek(pop(1).val).val, peek(peek(1).val).type);
	goto L0;

L4:	//rename var.
	ren(pop(1).val, pop(1).val);
	goto L0;

L5:	//clone var.
	clone(pop(1).val, pop(1).val);
	goto L0;

L6:	//flush.
	flush(pop(1).val);
	goto L0;

L7:	//add.
	push(1, pop(1).val + pop(1).val, peek(1).type);
	goto L0;

L8:	//sub.
	push(1, 0 - pop(1).val + pop(1).val, peek(1).type);
	goto L0;
	
L9:	//mpy.
	push(1, pop(1).val * pop(1).val, peek(1).type);
	goto L0;
	
L10:	//div. WAY too jank, but it works.
	push(1, (int)(1 / ((float)(pop(1).val) / (float)(pop(1).val))), peek(1).type);
	goto L0;

L11:	//print.
	switch (peek(1).type) {
		case 1: printf("%d", pop(1).val); break;
		case 2: printf("%f", pop(1).val); break; //find a way later.
		case 3: printf("%c", pop(1).val); break;
		default: return 2;
	}
	goto L0;
	
L12:	//scan. It's input as the latest, I need to put it at the bottom not the top.

	switch (pop(1).type) {
		case 1: scanf("%d", &top.val); top.type = 1; break;
		case 3: top.val = fgetc(stdin); top.type = 3; break;
	}

	push(1, top.val, top.type);
	goto L0;
	//End of boilerplate code. Of course, the number of cases are increased by how many blocks there are, same for variables.
}
