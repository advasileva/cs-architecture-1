	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 56
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	mov	rax, rsp
	mov	rbx, rax
	lea	rax, -76[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -76[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -64[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L2:
	cmp	rsp, rdx
	je	.L3
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L2
.L3:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L4
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L4:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -72[rbp], rax
	mov	DWORD PTR -52[rbp], 0
	jmp	.L5
.L9:
	lea	rax, -80[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -80[rbp]
	test	eax, eax
	jle	.L6
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	DWORD PTR [rax+rdx*4], 2
	jmp	.L7
.L6:
	mov	eax, DWORD PTR -80[rbp]
	test	eax, eax
	jns	.L8
	mov	eax, DWORD PTR -80[rbp]
	lea	ecx, 5[rax]
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	DWORD PTR [rax+rdx*4], ecx
	jmp	.L7
.L8:
	mov	ecx, DWORD PTR -80[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	DWORD PTR [rax+rdx*4], ecx
.L7:
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	mov	esi, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -52[rbp], 1
.L5:
	mov	eax, DWORD PTR -76[rbp]
	cmp	DWORD PTR -52[rbp], eax
	jl	.L9
	mov	rsp, rbx
	mov	eax, 0
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
