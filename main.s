	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	COUNT
	.section	.rodata
	.align 4
	.type	COUNT, @object
	.size	COUNT, 4
COUNT:
	.long	100
	.text
	.globl	timeDelta
	.type	timeDelta, @function
timeDelta:
	push	rbp
	mov	rbp, rsp
	mov	rax, rsi
	mov	r8, rdi
	mov	rsi, r8
	mov	rdi, r9
	mov	rdi, rax
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -48[rbp], rdx
	mov	QWORD PTR -40[rbp], rcx
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	imul	rax, rax, 1000000000
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	imul	rax, rax, 1000000000
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -8[rbp]
	pop	rbp
	ret
	.size	timeDelta, .-timeDelta
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"w"
.LC2:
	.string	"%d"
.LC3:
	.string	"input"
.LC4:
	.string	"output"
.LC5:
	.string	"%d "
.LC6:
	.string	"Time delta: %ld ns\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 112
	mov	DWORD PTR -100[rbp], edi
	mov	QWORD PTR -112[rbp], rsi
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	test	eax, eax
	jne	.L4
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -52[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	jmp	.L5
.L4:
	lea	rsi, .LC1[rip]
	lea	rdi, .LC3[rip]
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	lea	rsi, .LC1[rip]
	lea	rdi, .LC4[rip]
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -52[rbp], eax
.L5:
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	test	eax, eax
	jne	.L6
	mov	DWORD PTR -4[rbp], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1
.L7:
	mov	eax, DWORD PTR -52[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L8
	jmp	.L9
.L6:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L10
.L11:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 6
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 200
	sub	eax, ecx
	mov	edx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rcx
	sub	edx, 100
	mov	DWORD PTR [rax], edx
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L10:
	mov	eax, DWORD PTR -52[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L11
.L9:
	lea	rax, -80[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12
.L13:
	mov	eax, DWORD PTR -52[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rcx, QWORD PTR -32[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	form_array@PLT
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, 100
	cmp	DWORD PTR -4[rbp], eax
	jl	.L13
	lea	rax, -96[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rdi, QWORD PTR -96[rbp]
	mov	rsi, QWORD PTR -88[rbp]
	mov	rcx, rdx
	mov	rdx, rax
	call	timeDelta
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L14:
	mov	eax, DWORD PTR -52[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L15
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
