	.file	"vm.c"
	.intel_syntax noprefix
	.text
	.globl	vars
	.bss
	.align 16
	.type	vars, @object
	.size	vars, 24
vars:
	.zero	24
	.text
	.globl	push
	.type	push, @function
push:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -24[rbp], esi
	mov	edi, 16
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	eax, DWORD PTR -24[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	edx, DWORD PTR [rax]
	add	edx, 1
	mov	DWORD PTR [rax], edx
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	push, .-push
	.section	.rodata
.LC0:
	.string	"Popped too hard!\n"
	.text
	.globl	pop
	.type	pop, @function
pop:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jne	.L3
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 17
	mov	esi, 1
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	fwrite@PLT
.L3:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rcx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rcx+rax]
	mov	rdx, QWORD PTR 8[rdx]
	mov	QWORD PTR 8[rax], rdx
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	edx, DWORD PTR [rax]
	sub	edx, 1
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	DWORD PTR -12[rbp], eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, DWORD PTR -12[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	pop, .-pop
	.globl	peek
	.type	peek, @function
peek:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -4[rbp], edi
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR [rax]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	peek, .-peek
	.globl	size
	.type	size, @function
size:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -4[rbp], edi
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR [rax]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	size, .-size
	.globl	flush
	.type	flush, @function
flush:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	DWORD PTR [rax], 0
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L10
.L11:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -16[rbp], rax
.L10:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L11
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 8[rax], rdx
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	flush, .-flush
	.globl	ren
	.type	ren, @function
ren:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	DWORD PTR -40[rbp], esi
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rcx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rcx+rax]
	cmp	rdx, rax
	je	.L13
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -24[rbp], rax
	jmp	.L14
.L15:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -24[rbp], rax
.L14:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L15
.L13:
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	edx, DWORD PTR -40[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*8]
	lea	rdx, vars[rip]
	mov	QWORD PTR [rcx+rdx], rax
	mov	edi, 16
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 0
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], 0
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rcx, 0[0+rax*8]
	lea	rdx, vars[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rcx+rdx], rax
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	ren, .-ren
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 24
	.cfi_offset 3, -24
	mov	DWORD PTR -20[rbp], 0
	jmp	.L17
.L18:
	mov	edi, 16
	call	malloc@PLT
	mov	rcx, rax
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	QWORD PTR [rdx+rax], rcx
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	DWORD PTR [rax], 0
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	QWORD PTR 8[rax], 0
	add	DWORD PTR -20[rbp], 1
.L17:
	cmp	DWORD PTR -20[rbp], 2
	jle	.L18
	mov	esi, 0
	mov	edi, 0
	call	push
	jmp	.L19
.L20:
	mov	edi, 0
	call	size
	test	eax, eax
	jne	.L21
	mov	eax, 1
	jmp	.L22
.L21:
	mov	edi, 0
	call	pop
	cmp	eax, 6
	ja	.L23
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L25[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L25[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L25:
	.long	.L31-.L25
	.long	.L39-.L25
	.long	.L40-.L25
	.long	.L41-.L25
	.long	.L42-.L25
	.long	.L19-.L25
	.long	.L38-.L25
	.text
.L31:
	mov	eax, 0
	jmp	.L22
.L23:
	mov	eax, 1
	jmp	.L22
.L39:
	nop
.L32:
	mov	edi, 0
	call	pop
	mov	ebx, eax
	mov	edi, 0
	call	pop
	mov	esi, ebx
	mov	edi, eax
	call	push
	jmp	.L20
.L40:
	nop
.L33:
	mov	edi, 0
	call	pop
	mov	ebx, eax
	mov	edi, 0
	call	pop
	mov	esi, ebx
	mov	edi, eax
	call	ren
	jmp	.L20
.L41:
	nop
.L34:
	mov	edi, 1
	call	pop
	mov	edi, eax
	call	putchar@PLT
	mov	edi, 1
	call	size
	test	eax, eax
	jle	.L20
	mov	esi, 3
	mov	edi, 0
	call	push
	jmp	.L20
.L42:
	nop
.L35:
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 2
	mov	edi, 0
	call	push
	jmp	.L20
.L19:
	mov	esi, 3
	mov	edi, 0
	call	push
	mov	esi, 6
	mov	edi, 0
	call	push
	mov	esi, 3
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 72
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 101
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 108
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 108
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 111
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 44
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 32
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	jmp	.L20
.L38:
	nop
.L36:
	mov	esi, 4
	mov	edi, 0
	call	push
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	esi, 87
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	esi, 111
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	esi, 114
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	esi, 108
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	esi, 100
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	esi, 33
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	esi, 10
	mov	edi, 0
	call	push
	mov	esi, 1
	mov	edi, 0
	call	push
	jmp	.L20
.L22:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
