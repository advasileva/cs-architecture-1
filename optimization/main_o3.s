	.file	"main.c"
	.text
	.p2align 4
	.globl	timeDelta
	.type	timeDelta, @function
timeDelta:
.LFB39:
	.cfi_startproc
	imulq	$1000000000, %rdi, %rdi
	imulq	$1000000000, %rdx, %rdx
	addq	%rsi, %rdi
	addq	%rcx, %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	ret
	.cfi_endproc
.LFE39:
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
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$10, %edx
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
	movq	%rsi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	call	strtol@PLT
	testl	%eax, %eax
	jne	.L4
	movq	16(%rbx), %rdi
	leaq	.LC0(%rip), %rsi
	call	fopen@PLT
	movq	24(%rbx), %rdi
	leaq	.LC1(%rip), %rsi
	movq	%rax, %r13
	call	fopen@PLT
	leaq	12(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	movq	%r13, %rdi
	movq	%rax, %r14
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
.L5:
	movslq	12(%rsp), %rbp
	salq	$2, %rbp
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc@PLT
	movq	8(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rbp
	call	strtol@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L6
	xorl	%ebx, %ebx
	cmpl	$0, 12(%rsp)
	leaq	.LC5(%rip), %r15
	jle	.L8
	.p2align 4,,10
	.p2align 3
.L7:
	call	rand@PLT
	movl	$1, %esi
	movq	%r13, %rdi
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1374389535, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$38, %rdx
	subl	%ecx, %edx
	imull	$200, %edx, %edx
	subl	%edx, %eax
	movq	%r15, %rdx
	leal	-100(%rax), %ecx
	xorl	%eax, %eax
	movl	%ecx, (%r12,%rbx,4)
	addq	$1, %rbx
	call	__fprintf_chk@PLT
	cmpl	%ebx, 12(%rsp)
	jg	.L7
.L8:
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	movl	$1000000, %ebx
	call	clock_gettime@PLT
	.p2align 4,,10
	.p2align 3
.L10:
	movl	12(%rsp), %edi
	movq	%rbp, %rdx
	movq	%r12, %rsi
	call	form_array@PLT
	subl	$1, %ebx
	jne	.L10
	leaq	32(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	imulq	$1000000000, 16(%rsp), %rax
	addq	24(%rsp), %rax
	imulq	$1000000000, 32(%rsp), %rdx
	addq	40(%rsp), %rdx
	subq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L11
	xorl	%ebx, %ebx
	leaq	.LC5(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L12:
	movl	0(%rbp,%rbx,4), %ecx
	movq	%r12, %rdx
	movl	$1, %esi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	__fprintf_chk@PLT
	cmpl	%ebx, 12(%rsp)
	jg	.L12
.L11:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$72, %rsp
	.cfi_remember_state
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
.L6:
	.cfi_restore_state
	cmpl	$0, 12(%rsp)
	jle	.L8
	movq	%r12, %r15
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%r15, %rdx
	leaq	.LC2(%rip), %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, %ebx
	addq	$4, %r15
	cmpl	%ebx, 12(%rsp)
	jg	.L9
	jmp	.L8
.L4:
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	leaq	.LC1(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	movq	%rax, %r13
	call	fopen@PLT
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %r14
	call	strtol@PLT
	movl	%eax, 12(%rsp)
	jmp	.L5
.L21:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
