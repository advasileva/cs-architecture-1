	.file	"form_array.c"
	.text
	.p2align 4
	.globl	form_array
	.type	form_array, @function
form_array:
.LFB0:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L1
	leaq	4(%rsi), %rcx
	movq	%rdx, %rax
	subq	%rcx, %rax
	cmpq	$8, %rax
	jbe	.L3
	leal	-1(%rdi), %eax
	cmpl	$2, %eax
	jbe	.L3
	movl	%edi, %ecx
	movdqa	.LC0(%rip), %xmm6
	xorl	%eax, %eax
	pxor	%xmm4, %xmm4
	shrl	$2, %ecx
	movdqa	.LC1(%rip), %xmm5
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movdqu	(%rsi,%rax), %xmm0
	movdqu	(%rdx,%rax), %xmm7
	movdqa	%xmm6, %xmm2
	movdqa	%xmm0, %xmm1
	movdqa	%xmm0, %xmm3
	pcmpgtd	%xmm4, %xmm1
	paddd	%xmm5, %xmm3
	pand	%xmm1, %xmm2
	pandn	%xmm7, %xmm1
	por	%xmm1, %xmm2
	movdqa	%xmm4, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pcmpeqd	%xmm4, %xmm0
	pand	%xmm1, %xmm3
	pandn	%xmm2, %xmm1
	por	%xmm3, %xmm1
	pandn	%xmm1, %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	%rcx, %rax
	jne	.L4
	movl	%edi, %eax
	andl	$-4, %eax
	testb	$3, %dil
	je	.L1
	movl	%eax, %ecx
	movl	(%rsi,%rcx,4), %r8d
	leaq	(%rdx,%rcx,4), %rcx
	testl	%r8d, %r8d
	jle	.L34
	movl	$2, (%rcx)
.L10:
	leal	1(%rax), %ecx
	cmpl	%ecx, %edi
	jle	.L1
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r8d
	leaq	(%rdx,%rcx,4), %rcx
	testl	%r8d, %r8d
	jle	.L35
	movl	$2, (%rcx)
.L13:
	addl	$2, %eax
	cmpl	%eax, %edi
	jle	.L1
	cltq
	movl	(%rsi,%rax,4), %ecx
	leaq	(%rdx,%rax,4), %rax
	testl	%ecx, %ecx
	jle	.L32
	movl	$2, (%rax)
	ret
	.p2align 4,,10
	.p2align 3
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%edi, %edi
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L36:
	movl	$2, (%rdx,%rax,4)
.L20:
	addq	$1, %rax
	cmpq	%rdi, %rax
	je	.L1
.L22:
	movl	(%rsi,%rax,4), %ecx
	testl	%ecx, %ecx
	jg	.L36
	leal	5(%rcx), %r8d
	movl	%r8d, %ecx
	cmove	%r9d, %ecx
	movl	%ecx, (%rdx,%rax,4)
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L34:
	leal	5(%r8), %r9d
	movl	$0, %r8d
	cmovne	%r9d, %r8d
	movl	%r8d, (%rcx)
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L35:
	leal	5(%r8), %r9d
	movl	$0, %r8d
	cmovne	%r9d, %r8d
	movl	%r8d, (%rcx)
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L32:
	leal	5(%rcx), %esi
	movl	$0, %edx
	cmovne	%esi, %edx
	movl	%edx, (%rax)
	ret
	.cfi_endproc
.LFE0:
	.size	form_array, .-form_array
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	2
	.long	2
	.long	2
	.long	2
	.align 16
.LC1:
	.long	5
	.long	5
	.long	5
	.long	5
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
