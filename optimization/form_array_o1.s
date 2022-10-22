	.file	"form_array.c"
	.text
	.globl	form_array
	.type	form_array, @function
form_array:
.LFB0:
	.cfi_startproc
	movq	%rdx, %r8
	testl	%edi, %edi
	jle	.L1
	movl	%edi, %edi
	movl	$0, %eax
	movl	$0, %r9d
	jmp	.L6
.L8:
	movl	$2, (%r8,%rax,4)
.L4:
	addq	$1, %rax
	cmpq	%rdi, %rax
	je	.L1
.L6:
	movl	(%rsi,%rax,4), %edx
	testl	%edx, %edx
	jg	.L8
	leal	5(%rdx), %ecx
	cmovns	%r9d, %ecx
	movl	%ecx, (%r8,%rax,4)
	jmp	.L4
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	form_array, .-form_array
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
