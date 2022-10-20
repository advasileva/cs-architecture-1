	.intel_syntax noprefix
	.text							# начало секции
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
	.section	.rodata				# .rodata
.LC0:
	.string	"r"						# строковая константа для флага открытия файла на чтение
.LC1:
	.string	"w"						# строковая константа для флага открытия файла на запись
.LC2:
	.string	"%d"					# строковая константа для формата ввода
.LC3:
	.string	"input"					# строковая константа для названия дефолтного входного файла
.LC4:
	.string	"output"				# строковая константа для названия дефолтного выходного файла
.LC5:
	.string	"%d "					# строковая константа для формата вывода
.LC6:
	.string	"Time delta: %ld ns\n"	# строковая константа для формата вывода результата замера времени
	.text							# начало секции
	.globl	main					# секция с кодом
main:
	push	rbp						# сохраняем rbp на стек
	mov	rbp, rsp					# сохраняем rsp в rbp
	sub	rsp, 112
	mov	DWORD PTR -100[rbp], edi	# rdi - argc (4 byte)
	mov	QWORD PTR -112[rbp], rsi	# rsi - argv (8 byte)
	mov	DWORD PTR -28[rbp], 10000
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
	lea	rdx, -60[rbp]
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
	mov	DWORD PTR -60[rbp], eax
.L5:
	mov	eax, DWORD PTR -60[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	eax, DWORD PTR -60[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -48[rbp], rax
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
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1
.L7:
	mov	eax, DWORD PTR -60[rbp]
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
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rcx
	sub	edx, 100
	mov	DWORD PTR [rax], edx
	mov	eax, DWORD PTR -4[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L10:
	mov	eax, DWORD PTR -60[rbp]
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
	mov	eax, DWORD PTR -60[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	form_array@PLT
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
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
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -4[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L14:
	mov	eax, DWORD PTR -60[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L15
	mov	eax, 0
	leave						# / эпилог
	ret							# \ выход из функции
	.size	main, .-main
