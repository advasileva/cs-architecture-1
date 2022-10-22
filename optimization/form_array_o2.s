	.file	"form_array.c"
	.text
	.p2align 4
	.globl	form_array
	.type	form_array, @function
form_array:
.LFB0:
	.cfi_startproc
	movslq	%edi, %r8
	xorl	%eax, %eax
	movq	%rdx, %rdi
	xorl	%r9d, %r9d
	testl	%r8d, %r8d
	jg	.L6
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L11:
	movl	$2, (%rdi,%rax,4)
	addq	$1, %rax
	cmpq	%r8, %rax
	je	.L1
.L6:
	movl	(%rsi,%rax,4), %edx
	testl	%edx, %edx
	jg	.L11
	leal	5(%rdx), %ecx
	cmove	%r9d, %ecx
	movl	%ecx, (%rdi,%rax,4)
	addq	$1, %rax
	cmpq	%r8, %rax
	jne	.L6
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	form_array, .-form_array
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
