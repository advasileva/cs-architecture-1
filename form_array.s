# Замены:
#  rbp[-4] -> r12d
#  rbp[-32] -> r13
#  rbp[-40] -> r14
#  rbp[-20] -> r15
	.intel_syntax noprefix			# указание интеловского синтаксиса
	.text							# начало секции
	.globl	form_array				# метка глобальности для линкера
form_array:							# метка функции "form_array"
	push	rbp
	mov	rbp, rsp
	mov	r15d, edi
	mov	r13, rsi
	mov	r14, rdx
	mov	r12d, 0
	jmp	.L2
.L6:
	mov	eax, r12d
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jle	.L3
	mov	eax, r12d
	lea	rdx, 0[0+rax*4]
	mov	rax, r14
	add	rax, rdx
	mov	DWORD PTR [rax], 2
	jmp	.L4
.L3:
	mov	eax, r12d
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jns	.L5
	mov	eax, r12d
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, r12d
	lea	rcx, 0[0+rax*4]
	mov	rax, r14
	add	rax, rcx
	add	edx, 5
	mov	DWORD PTR [rax], edx
	jmp	.L4
.L5:
	mov	eax, r12d
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rax, rdx
	mov	edx, r12d
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, r14
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
.L4:
	add	r12d, 1
.L2:
	mov	eax, r12d
	cmp	eax, r15d
	jl	.L6
	nop
	nop
	pop	rbp
	ret
	.size	form_array, .-form_array
