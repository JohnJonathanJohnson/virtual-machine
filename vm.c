//Boilerplate. Cannot modify.
//Note that you could store values between blocks in the vars[0] stack.
//+2 because 0 is reserved for inst stack and 1 is reserved for buffer stack.
#include <stdio.h>
#include <stdlib.h>
#define VAR_COUNT 1

//For now, stack (as a var) = -2 (parsed by compiler somehow), var = -1, inst = 0, int = 1, fixed = 2 (Unimplemented), char = 3.
typedef struct {
	long val;
	long type;
} Value;

typedef struct node {
	Value* val;
	struct node* next;
} Node;

typedef struct {
	long size;
	Node* top;
} Stack;

Stack* vars[VAR_COUNT + 2];

void push(long stack, long val, long type) {

	Node* new_node = malloc(sizeof(Node));
	new_node->val = malloc(sizeof(Value));
	new_node->val->val = val;
	new_node->val->type = type;
	new_node->next = vars[stack]->top;
	vars[stack]->top = new_node;
	vars[stack]->size++;
}

Value pop(long stack) {

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

Value peek(long stack) {

	Value ret_val;
	ret_val.val = vars[stack]->top->val->val;
	ret_val.type = vars[stack]->top->val->type;
	return ret_val;
}

long size(long stack) {

	return vars[stack]->size;
}

void flush(long stack) {

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

void ren(long old, long new) {

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

void clone(long orig, long clon) {

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

long fixed2dec(long num) {

	long i = 1000000;
	long ret_num = 0;

	for(short count = 15; count > 0; count--) {
		i /= 2;
		if (num >= 1 << count) {
			num -= 1 << count;
			ret_num += i;
		}
	}

	return ret_num;
}

int main() {

	for (long i = 0; i < VAR_COUNT + 2; i++) {
		vars[i] = malloc(sizeof(Stack));
		vars[i]->size = 0;
		vars[i]->top = NULL;
	}

	Value top;
	top.val = 0;
	top.type = 0;

	long ffront = 0;
	long fback = 0; 

	push(0, 0, 0);
	//Start of global code.
	//Reminder that variables start at 2.
	//A little weird-looking because IF is supposed to
	//be used with a user-defined enclosure.
	push(0, 17, 0); //PRINT
	push(0, '\n', 3); //NEWLINE
	push(0, 17, 0); //PRINT
	push(0, 11, 0);	//IF
	push(0, 15, 0); //MORE THAN
	push(0, 10 << 16, 2); //10.0
	push(0, 17, 0); //PRINT
	push(0, '\n', 3); //NEWLINE
	push(0, 10, 0); //DIV
	push(0, 7 << 15, 2); //3.5
	push(0, 2, 0); //POP
	push(0, 2, -1); //FIRST_VAR
	push(0, 10, 0); //DIV
	push(0, 7 << 15, 2); //3.5
	push(0, 3, 0); //PEEK
	push(0, 2, -1); //FIRST_VAR
	push(0, 17, 0); //PRINT
	push(0, 3, 0); //PEEK
	push(0, 2, -1); //FIRST_VAR
	push(0, 1, 0); //PUSH
	push(0, 21, 0); //FIXED
	push(0, 18, 0); //SCAN
	push(0, 2, -1); //FIRST_VAR To sum up: FIRST_VAR SCAN INT PUSH FIRST_VAR PEEK PRINT FIRST_VAR PEEK 3 DIV FIRST_VAR POP 3 DIV CHAR \n PRINT 10 > IF PRINT CHAR \n PRINT
	//End of global code.
	goto L0;

L0:
	//Switch hub.
	if (size(0) == 0) return 1;
	top = pop(0);
	//Debug print.
	//printf(" %d|%d \n", top.val, top.type);
	switch (top.type) {
		case 0: switch (top.val) {
			case 0: return 0; break;
			case 1: goto L1; break;		//PUSH
			case 2: goto L2; break;		//POP
			case 3: goto L3; break;		//PEEK
			case 4: goto L4; break;		//RENAME
			case 5: goto L5; break;		//CLONE
			case 6: goto L6; break;		//FLUSH
			case 7: goto L7; break;		//ADD
			case 8: goto L8; break;		//SUB
			case 9: goto L9; break;		//MPY
			case 10: goto L10; break;	//DIV
			case 11: goto L11; break;	//IF
			case 12: goto L12; break;	//EQUAL
			case 13: goto L13; break;	//UNEQUAL
			case 14: goto L14; break;	//LESS THAN
			case 15: goto L15; break;	//MORE THAN
			case 16: goto L16; break;	//NOT
			case 17: goto L17; break;	//PRINT
			case 18: goto L18; break;	//SCAN
			case 19: goto L19; break;	//SIZE
			case 20: goto L20; break;	//INT
			case 21: goto L21; break;	//FIXED
			case 22: goto L22; break;	//CHAR
			default: return 1;
		}

		default: push(1, top.val, top.type); goto L0;
	}
L1:	//push into var.
	if (peek(1).type == -2) push(pop(1).val, pop(1).val, 0); else push(pop(1).val, pop(1).val, peek(1).type);
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
	top = pop(1);
	if (((top.type == 1 || top.type == 3) && (peek(1).type == 1 || peek(1).type == 3)) || top.type == peek(1).type) {
		push(1, top.val + pop(1).val, top.type);
	} else if (top.type == 1 || top.type == 3) {
		push(1, (top.val << 16) + pop(1).val, top.type);
	} else {
		push(1, top.val + (pop(1).val << 16), top.type);
	}
	goto L0;

L8:	//sub.
	top = pop(1);
	if (((top.type == 1 || top.type == 3) && (peek(1).type == 1 || peek(1).type == 3)) || top.type == peek(1).type) {
		push(1, pop(1).val - top.val, top.type);
	} else if (top.type == 1 || top.type == 3) {
		push(1, pop(1).val - (top.val << 16), top.type);
	} else {
		push(1, (pop(1).val << 16) - top.val, top.type);
	}
	goto L0;
	
L9:	//mpy.
	top = pop(1);
	if ((top.type == 1 || top.type == 3) && (peek(1).type == 1 || peek(1).type == 3)) {
		push(1, pop(1).val * top.val, top.type);
	} else if ((top.type == 1 || top.type == 3) || (peek(1).type == 1 || peek(1).type == 3)) {
		push(1, pop(1).val * top.val, 2);
	} else {
		push(1, (long)((long long)(pop(1).val) * (long long)(top.val)) >> 16, 2);
	}
	goto L0;

L10:	//div. To be fixed.
	top = pop(1);
	if ((top.type == 1 || top.type == 3) && (peek(1).type == 1 || peek(1).type == 3)) {
		push(1, pop(1).val / top.val, top.type);
	} else if ((top.type == 1 || top.type == 3) || (peek(1).type == 1 || peek(1).type == 3)) {
		push(1, pop(1).val / top.val, 2);
	} else {
		push(1, (((long long)(pop(1).val) << 32) / top.val) >> 16, 2); //still very rough.
	}
	goto L0;

L11:	//if. no else.
	switch (pop(1).val) {
		case 0: pop(0); break;
		case 1: break;
		default: return 3;
	}
	goto L0;

L12:	//equal.
	if (pop(1).val == pop(1).val) push(1, 1, 1); else push(1, 0, 1);
	goto L0;

L13:	//unequal.
	if (pop(1).val != pop(1).val) push(1, 1, 1); else push(1, 0, 1);
	goto L0;

L14:	//less than. Reversed beause of how C works...
	if (pop(1).val <= pop(1).val) push(1, 0, 1); else push(1, 1, 1);
	goto L0;

L15:	//more than.
	if (pop(1).val >= pop(1).val) push(1, 0, 1); else push(1, 1, 1);
	goto L0;

L16:	//not.
	switch (pop(1).val) {
		case 0: push(1, 1, 1); break;
		case 1: push(1, 0, 1); break;
		default: return 3;
	}
	goto L0;

L17:	//print.
	switch (peek(1).type) {
		case 1: printf("%ld", pop(1).val); break;
		case 2: top.val = 1;
			fback = fixed2dec((short)(peek(1).val));
			printf("%ld.", pop(1).val >> 16);
			while (fback < 10000 && fback != 0) {
				fback *= 10;
				printf("%ld", fback);
				top.val *= 10;
				fputc('0', stdout);
			}
			printf("%ld", fback / top.val);
			break;
		case 3: fputc(pop(1).val, stdout); break;
		default: return 4;
	}
	goto L0;
	
L18:	//scan. It's input as the latest, I need to put it at the bottom not the top.

	push(1, fgetc(stdin), 3);
	goto L0;

L19:	//size.
	if (peek(1).type == -1) push(1, size(pop(1).val), 1);
	else return 5;
	goto L0;
	
L20:	//cast to int.
	switch (peek(1).type) {
		case 1: push(1, pop(1).val, 1); break;
		case 2: push(1, pop(1).val >> 16, 1); break;
		case 3: push(1, pop(1).val, 1); break;
		default: return 5;
	}
	goto L0;
	
L21:	//cast to fixed.
	switch (peek(1).type) {
		case 1: push(1, pop(1).val << 16, 2); break;
		case 2: push(1, pop(1).val, 2); break;
		case 3: push(1, pop(1).val << 16, 2); break;
		default: return 5;
	}
	goto L0;
	
L22:	//cast to char.
	switch (peek(1).type) {
		case 1: push(1, (char)(pop(1).val), 3); break;
		case 2: push(1, (char)(pop(1).val >> 16), 3); break;
		case 3: push(1, (char)(pop(1).val), 3); break;
		default: return 5;
	}
	goto L0;

	//End of boilerplate code. Of course, the number of cases are increased by how many blocks there are, same for variables.
}
