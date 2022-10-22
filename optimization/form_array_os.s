	.file	"form_array.c"
	.text
	.globl	form_array
	.type	form_array, @function
form_array:
.LFB0:
	.cfi_startproc
	xorl	%eax, %eax
	xorl	%r9d, %r9d
.L2:
	cmpl	%eax, %edi
	jle	.L8
	movl	(%rsi,%rax,4), %r8d
	testl	%r8d, %r8d
	jle	.L3
	movl	$2, (%rdx,%rax,4)
	jmp	.L4
.L3:
	leal	5(%r8), %ecx
	cmove	%r9d, %ecx
	movl	%ecx, (%rdx,%rax,4)
.L4:
	incq	%rax
	jmp	.L2
.L8:
	ret
	.cfi_endproc
.LFE0:
	.size	form_array, .-form_array
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
