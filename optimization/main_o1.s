	.file	"main.c"
	.text
	.globl	timeDelta
	.type	timeDelta, @function
timeDelta:
.LFB22:
	.cfi_startproc
	imulq	$1000000000, %rdx, %rdx
	imulq	$1000000000, %rdi, %rdi
	addq	%rsi, %rdi
	addq	%rcx, %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	ret
	.cfi_endproc
.LFE22:
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
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rsi, %r12
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol@PLT
	testl	%eax, %eax
	jne	.L3
	movq	16(%r12), %rdi
	leaq	.LC0(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %r14
	movq	24(%r12), %rdi
	leaq	.LC1(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %r15
	leaq	12(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	movq	%r14, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
.L4:
	movslq	12(%rsp), %rbx
	salq	$2, %rbx
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	%rax, %rbx
	movq	8(%r12), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol@PLT
	movl	%eax, %r12d
	testl	%eax, %eax
	je	.L5
	movl	$0, %r12d
	leaq	.LC5(%rip), %r13
	cmpl	$0, 12(%rsp)
	jle	.L7
.L6:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	sarq	$38, %rdx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$200, %edx, %edx
	subl	%edx, %eax
	leal	-100(%rax), %edx
	movl	%edx, 0(%rbp,%r12,4)
	movq	%r13, %rsi
	movq	%r14, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$1, %r12
	cmpl	%r12d, 12(%rsp)
	jg	.L6
	jmp	.L7
.L3:
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %r14
	leaq	.LC1(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %r15
	movq	16(%r12), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol@PLT
	movl	%eax, 12(%rsp)
	jmp	.L4
.L5:
	cmpl	$0, 12(%rsp)
	jle	.L7
	movq	%rbp, %r13
.L8:
	movq	%r13, %rdx
	leaq	.LC2(%rip), %rsi
	movq	%r14, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, %r12d
	addq	$4, %r13
	cmpl	%r12d, 12(%rsp)
	jg	.L8
.L7:
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movl	$1000000, %r12d
.L9:
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	12(%rsp), %edi
	call	form_array@PLT
	subl	$1, %r12d
	jne	.L9
	leaq	32(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rdi
	movq	40(%rsp), %rsi
	call	timeDelta
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$0, 12(%rsp)
	jle	.L10
	movl	$0, %ebp
	leaq	.LC5(%rip), %r12
.L11:
	movl	(%rbx,%rbp,4), %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$1, %rbp
	cmpl	%ebp, 12(%rsp)
	jg	.L11
.L10:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L20
	movl	$0, %eax
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
.L20:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
