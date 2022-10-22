	.file	"main.c"
	.text
	.globl	timeDelta
	.type	timeDelta, @function
timeDelta:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rsi, %rax
	movq	%rdi, %r8
	movq	%r8, %rsi
	movq	%r9, %rdi
	movq	%rax, %rdi
	movq	%rsi, -32(%rbp)
	movq	%rdi, -24(%rbp)
	movq	%rdx, -48(%rbp)
	movq	%rcx, -40(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	imulq	$1000000000, %rax, %rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	addq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	imulq	$1000000000, %rax, %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1000000, -92(%rbp)
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	testl	%eax, %eax
	jne	.L4
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -88(%rbp)
	movq	-128(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -80(%rbp)
	leaq	-100(%rbp), %rdx
	movq	-88(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	jmp	.L5
.L4:
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -88(%rbp)
	leaq	.LC1(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -80(%rbp)
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -100(%rbp)
.L5:
	movl	-100(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	movl	-100(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -64(%rbp)
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	testl	%eax, %eax
	jne	.L6
	movl	$0, -96(%rbp)
	jmp	.L7
.L8:
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	movq	-88(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, -96(%rbp)
.L7:
	movl	-100(%rbp), %eax
	cmpl	%eax, -96(%rbp)
	jl	.L8
	jmp	.L9
.L6:
	movl	$0, -96(%rbp)
	jmp	.L10
.L11:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$6, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$200, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	subl	$100, %edx
	movl	%edx, (%rax)
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-88(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addl	$1, -96(%rbp)
.L10:
	movl	-100(%rbp), %eax
	cmpl	%eax, -96(%rbp)
	jl	.L11
.L9:
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movl	$0, -96(%rbp)
	jmp	.L12
.L13:
	movl	-100(%rbp), %eax
	movq	-64(%rbp), %rdx
	movq	-72(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	form_array@PLT
	addl	$1, -96(%rbp)
.L12:
	movl	-96(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L13
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	call	timeDelta
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -96(%rbp)
	jmp	.L14
.L15:
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-80(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addl	$1, -96(%rbp)
.L14:
	movl	-100(%rbp), %eax
	cmpl	%eax, -96(%rbp)
	jl	.L15
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	subq	%fs:40, %rcx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
