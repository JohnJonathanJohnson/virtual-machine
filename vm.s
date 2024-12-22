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
	mov	DWORD PTR -28[rbp], edx
	mov	edi, 16
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	edi, 8
	call	malloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -28[rbp]
	mov	DWORD PTR 4[rax], edx
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
	mov	QWORD PTR -16[rbp], rax
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
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -8[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
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
	mov	DWORD PTR -20[rbp], edi
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR [rax]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR [rax]
	mov	eax, DWORD PTR 4[rax]
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR -8[rbp]
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
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
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
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
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
	.globl	clone
	.type	clone, @function
clone:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	DWORD PTR -40[rbp], esi
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -24[rbp], rax
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -16[rbp], rax
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rcx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rcx+rax]
	mov	edx, DWORD PTR [rdx]
	mov	DWORD PTR [rax], edx
	jmp	.L17
.L18:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -16[rbp], rax
.L17:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L18
	mov	edi, 16
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 8[rax], rdx
	jmp	.L19
.L20:
	mov	edi, 8
	call	malloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rdx]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR 4[rdx]
	mov	DWORD PTR 4[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -16[rbp], rax
	mov	edi, 16
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
.L19:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L20
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	QWORD PTR -16[rbp], 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	clone, .-clone
	.section	.rodata
.LC2:
	.string	"%d"
.LC3:
	.string	"%f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r12
	push	rbx
	sub	rsp, 48
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -36[rbp], 0
	jmp	.L22
.L23:
	mov	edi, 16
	call	malloc@PLT
	mov	rcx, rax
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	QWORD PTR [rdx+rax], rcx
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	DWORD PTR [rax], 0
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, vars[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	QWORD PTR 8[rax], 0
	add	DWORD PTR -36[rbp], 1
.L22:
	cmp	DWORD PTR -36[rbp], 2
	jle	.L23
	mov	DWORD PTR -32[rbp], 0
	mov	DWORD PTR -28[rbp], 0
	mov	edx, 0
	mov	esi, 0
	mov	edi, 0
	call	push
	mov	edx, 0
	mov	esi, 11
	mov	edi, 0
	call	push
	mov	edx, 0
	mov	esi, 11
	mov	edi, 0
	call	push
	mov	edx, 3
	mov	esi, 10
	mov	edi, 0
	call	push
	mov	edx, 0
	mov	esi, 10
	mov	edi, 0
	call	push
	mov	edx, 1
	mov	esi, 3
	mov	edi, 0
	call	push
	mov	edx, 0
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	edx, -1
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	edx, 0
	mov	esi, 11
	mov	edi, 0
	call	push
	mov	edx, 0
	mov	esi, 3
	mov	edi, 0
	call	push
	mov	edx, -1
	mov	esi, 2
	mov	edi, 0
	call	push
	mov	edx, 0
	mov	esi, 1
	mov	edi, 0
	call	push
	mov	edx, 0
	mov	esi, 12
	mov	edi, 0
	call	push
	mov	edx, 1
	mov	esi, 0
	mov	edi, 0
	call	push
	mov	edx, -1
	mov	esi, 2
	mov	edi, 0
	call	push
	nop
.L24:
	mov	edi, 0
	call	size
	test	eax, eax
	jne	.L25
	mov	eax, 1
	jmp	.L63
.L25:
	mov	edi, 0
	call	pop
	mov	QWORD PTR -32[rbp], rax
	mov	eax, DWORD PTR -28[rbp]
	test	eax, eax
	jne	.L27
	mov	eax, DWORD PTR -32[rbp]
	cmp	eax, 12
	ja	.L28
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L30[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L30[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L30:
	.long	.L42-.L30
	.long	.L66-.L30
	.long	.L67-.L30
	.long	.L68-.L30
	.long	.L69-.L30
	.long	.L70-.L30
	.long	.L71-.L30
	.long	.L72-.L30
	.long	.L73-.L30
	.long	.L74-.L30
	.long	.L75-.L30
	.long	.L76-.L30
	.long	.L65-.L30
	.text
.L42:
	mov	eax, 0
	jmp	.L63
.L28:
	mov	eax, 1
	jmp	.L63
.L27:
	mov	edx, DWORD PTR -28[rbp]
	mov	eax, DWORD PTR -32[rbp]
	mov	esi, eax
	mov	edi, 1
	call	push
	jmp	.L24
.L66:
	nop
.L43:
	mov	edi, 1
	call	peek
	sar	rax, 32
	mov	r12d, eax
	mov	edi, 1
	call	pop
	mov	ebx, eax
	mov	edi, 1
	call	pop
	mov	edx, r12d
	mov	esi, ebx
	mov	edi, eax
	call	push
	jmp	.L24
.L67:
	nop
.L44:
	mov	edi, 1
	call	peek
	mov	edi, eax
	call	peek
	sar	rax, 32
	mov	ebx, eax
	mov	edi, 1
	call	pop
	mov	edi, eax
	call	pop
	mov	edx, ebx
	mov	esi, eax
	mov	edi, 1
	call	push
	jmp	.L24
.L68:
	nop
.L45:
	mov	edi, 1
	call	peek
	mov	edi, eax
	call	peek
	sar	rax, 32
	mov	ebx, eax
	mov	edi, 1
	call	pop
	mov	edi, eax
	call	peek
	mov	edx, ebx
	mov	esi, eax
	mov	edi, 1
	call	push
	jmp	.L24
.L69:
	nop
.L46:
	mov	edi, 1
	call	pop
	mov	ebx, eax
	mov	edi, 1
	call	pop
	mov	esi, ebx
	mov	edi, eax
	call	ren
	jmp	.L24
.L70:
	nop
.L47:
	mov	edi, 1
	call	pop
	mov	ebx, eax
	mov	edi, 1
	call	pop
	mov	esi, ebx
	mov	edi, eax
	call	clone
	jmp	.L24
.L71:
	nop
.L48:
	mov	edi, 1
	call	pop
	mov	edi, eax
	call	flush
	jmp	.L24
.L72:
	nop
.L49:
	mov	edi, 1
	call	peek
	sar	rax, 32
	mov	ebx, eax
	mov	edi, 1
	call	pop
	mov	r12d, eax
	mov	edi, 1
	call	pop
	add	eax, r12d
	mov	edx, ebx
	mov	esi, eax
	mov	edi, 1
	call	push
	jmp	.L24
.L73:
	nop
.L50:
	mov	edi, 1
	call	peek
	sar	rax, 32
	mov	ebx, eax
	mov	edi, 1
	call	pop
	mov	r12d, eax
	mov	edi, 1
	call	pop
	mov	edx, eax
	mov	eax, r12d
	sub	eax, edx
	mov	edx, ebx
	mov	esi, eax
	mov	edi, 1
	call	push
	jmp	.L24
.L74:
	nop
.L51:
	mov	edi, 1
	call	peek
	sar	rax, 32
	mov	ebx, eax
	mov	edi, 1
	call	pop
	mov	r12d, eax
	mov	edi, 1
	call	pop
	imul	eax, r12d
	mov	edx, ebx
	mov	esi, eax
	mov	edi, 1
	call	push
	jmp	.L24
.L75:
	nop
.L52:
	mov	edi, 1
	call	peek
	sar	rax, 32
	mov	ebx, eax
	mov	edi, 1
	call	pop
	pxor	xmm2, xmm2
	cvtsi2ss	xmm2, eax
	movss	DWORD PTR -52[rbp], xmm2
	mov	edi, 1
	call	pop
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	movss	xmm1, DWORD PTR -52[rbp]
	divss	xmm1, xmm0
	movss	xmm0, DWORD PTR .LC1[rip]
	divss	xmm0, xmm1
	cvttss2si	eax, xmm0
	mov	edx, ebx
	mov	esi, eax
	mov	edi, 1
	call	push
	jmp	.L24
.L76:
	nop
.L53:
	mov	edi, 1
	call	peek
	sar	rax, 32
	cmp	eax, 3
	je	.L55
	cmp	eax, 3
	jg	.L56
	cmp	eax, 1
	je	.L57
	cmp	eax, 2
	je	.L58
	jmp	.L56
.L57:
	mov	edi, 1
	call	pop
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L59
.L58:
	mov	edi, 1
	call	pop
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L59
.L55:
	mov	edi, 1
	call	pop
	mov	edi, eax
	call	putchar@PLT
	jmp	.L59
.L56:
	mov	eax, 2
	jmp	.L63
.L59:
	jmp	.L24
.L65:
	nop
.L54:
	mov	edi, 1
	call	pop
	sar	rax, 32
	cmp	eax, 1
	je	.L60
	cmp	eax, 3
	je	.L61
	jmp	.L62
.L60:
	lea	rax, -32[rbp]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	DWORD PTR -28[rbp], 1
	jmp	.L62
.L61:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -32[rbp], eax
	mov	DWORD PTR -28[rbp], 3
	nop
.L62:
	mov	edx, DWORD PTR -28[rbp]
	mov	eax, DWORD PTR -32[rbp]
	mov	esi, eax
	mov	edi, 1
	call	push
	jmp	.L24
.L63:
	mov	rdx, QWORD PTR -24[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L64
	call	__stack_chk_fail@PLT
.L64:
	add	rsp, 48
	pop	rbx
	pop	r12
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC1:
	.long	1065353216
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
