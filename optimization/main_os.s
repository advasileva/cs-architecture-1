	.file	"main.c"
	.text
	.globl	timeDelta
	.type	timeDelta, @function
timeDelta:
.LFB24:
	.cfi_startproc
	imulq	$1000000000, %rdi, %rdi
	imulq	$1000000000, %rdx, %rdx
	addq	%rsi, %rdi
	addq	%rcx, %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	ret
	.cfi_endproc
.LFE24:
	.size	timeDelta, .-timeDelta
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	8(%rsi), %rdi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	atoi@PLT
	testl	%eax, %eax
	jne	.L3
	movq	16(%rbp), %rdi
	leaq	.LC0(%rip), %rsi
	call	fopen@PLT
	movq	24(%rbp), %rdi
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rbx
	call	fopen@PLT
	leaq	4(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %r12
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	jmp	.L4
.L3:
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	leaq	.LC1(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	movq	%rax, %rbx
	call	fopen@PLT
	movq	16(%rbp), %rdi
	movq	%rax, %r12
	call	atoi@PLT
	movl	%eax, 4(%rsp)
.L4:
	movslq	4(%rsp), %r14
	salq	$2, %r14
	movq	%r14, %rdi
	call	malloc@PLT
	movq	%r14, %rdi
	movq	%rax, %r13
	call	malloc@PLT
	movq	8(%rbp), %rdi
	movq	%r13, %r15
	movq	%rax, %r14
	call	atoi@PLT
	movl	%eax, %ebp
	testl	%eax, %eax
	jne	.L19
.L17:
	leaq	.LC2(%rip), %rcx
	cmpl	%ebp, 4(%rsp)
	jle	.L10
	movq	%r15, %rdx
	movq	%rcx, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	incl	%ebp
	addq	$4, %r15
	jmp	.L17
.L10:
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	movl	$1000000, %ebx
	call	clock_gettime@PLT
	jmp	.L8
.L19:
	xorl	%ebp, %ebp
	movl	$200, %r15d
.L5:
	cmpl	%ebp, 4(%rsp)
	jle	.L10
	call	rand@PLT
	movl	$1, %esi
	movq	%rbx, %rdi
	cltd
	idivl	%r15d
	xorl	%eax, %eax
	leal	-100(%rdx), %ecx
	leaq	.LC5(%rip), %rdx
	movl	%ecx, 0(%r13,%rbp,4)
	incq	%rbp
	call	__fprintf_chk@PLT
	jmp	.L5
.L8:
	movl	4(%rsp), %edi
	movq	%r14, %rdx
	movq	%r13, %rsi
	call	form_array@PLT
	decl	%ebx
	jne	.L8
	leaq	24(%rsp), %rsi
	movl	$1, %edi
	xorl	%ebx, %ebx
	call	clock_gettime@PLT
	movq	8(%rsp), %rdx
	movq	24(%rsp), %rdi
	leaq	.LC5(%rip), %rbp
	movq	32(%rsp), %rsi
	movq	16(%rsp), %rcx
	call	timeDelta
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L11:
	cmpl	%ebx, 4(%rsp)
	jle	.L20
	movl	(%r14,%rbx,4), %ecx
	movq	%rbp, %rdx
	movl	$1, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	incq	%rbx
	call	__fprintf_chk@PLT
	jmp	.L11
.L20:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
