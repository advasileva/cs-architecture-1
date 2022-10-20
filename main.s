	.intel_syntax noprefix
	.text							# начало секции
	.globl	timeDelta
	.type	timeDelta, @function
timeDelta:							# метка функции "timeDelta"
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
.LC0:								# метка ".LC0"
	.string	"r"						# строковая константа для флага открытия файла на чтение
.LC1:								# метка ".LC1"
	.string	"w"						# строковая константа для флага открытия файла на запись
.LC2:								# метка ".LC2"
	.string	"%d"					# строковая константа для формата ввода
.LC3:								# метка ".LC3"
	.string	"input"					# строковая константа для названия дефолтного входного файла
.LC4:								# метка ".LC4"
	.string	"output"				# строковая константа для названия дефолтного выходного файла
.LC5:								# метка ".LC5"
	.string	"%d "					# строковая константа для формата вывода
.LC6:								# метка ".LC6"
	.string	"Time delta: %ld ns\n"	# строковая константа для формата вывода результата замера времени
	.text							# начало секции
	.globl	main					# секция с кодом
main:								# метка функции "main"
	push	rbp						# сохраняем rbp на стек
	mov	rbp, rsp					# записываем rsp в rbp
	sub	rsp, 112
	mov	DWORD PTR -100[rbp], edi	# кладём на стек: rdi - argc (4 byte)
	mov	QWORD PTR -112[rbp], rsi	# кладём на стек: rsi - argv (8 byte)
	mov	DWORD PTR -28[rbp], 1000000	# кладём на стек: count = 10000 (int - 4 byte)
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]		# помещение argv[1] в rdi
	call	atoi@PLT				# вызов atoi()
	test	eax, eax
	jne	.L4							# переход к вводу с помощью генератора
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]				# загрузка строки "r"
	mov	rdi, rax
	call	fopen@PLT				# вызов fopen()
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -112[rbp]	# 
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]				# загурзка строки "w"
	mov	rdi, rax
	call	fopen@PLT				# вызов fopen()
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -60[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC2[rip]				# загрузка строки "%d"
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT		# вызов fscanf()
	jmp	.L5							# переход к .L5
.L4:								# метка ".L4"
	lea	rsi, .LC1[rip]				# загрузка строки "w"
	lea	rdi, .LC3[rip]				# загрузка строки "input"
	call	fopen@PLT				# вызов fopen()
	mov	QWORD PTR -16[rbp], rax
	lea	rsi, .LC1[rip]				# загрузка строки "w"
	lea	rdi, .LC4[rip]				# загрузка строки "output"
	call	fopen@PLT				# вызов fopen()
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -112[rbp]	# помещаем указатель на argv в rax
	add	rax, 16						# переходим к argv[2]
	mov	rax, QWORD PTR [rax]		# 
	mov	rdi, rax					# помещаем argv[2] в rdi
	call	atoi@PLT				# вызов atoi()
	mov	DWORD PTR -60[rbp], eax		# помещаем результат приведения argv[2] в n
.L5:								# метка ".L5"	
	mov	eax, DWORD PTR -60[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT				# вызов malloc()
	mov	QWORD PTR -40[rbp], rax
	mov	eax, DWORD PTR -60[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT				# вызов malloc()
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax					# помещение argv[1] в rdi
	call	atoi@PLT				# вызов atoi()
	test	eax, eax				# проверяем, что после приведения к int у нас получился 0
	jne	.L6							# переход к вводу с помощью генератора (else-ветка)
	mov	DWORD PTR -4[rbp], 0
	jmp	.L7							# переход к .L7
.L8:								# метка ".L8"
	mov	eax, DWORD PTR -4[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC2[rip]				# загрузка строки "%d"
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT		# вызов fscanf()
	add	DWORD PTR -4[rbp], 1
.L7:								# метка ".L7"
	mov	eax, DWORD PTR -60[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L8
	jmp	.L9							# переход к .L9
.L6:								# метка ".L6" 
	mov	DWORD PTR -4[rbp], 0
	jmp	.L10						# переход к .L10
.L11:								# метка ".L11"
	call	rand@PLT				# вызов rand()
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
	call	fprintf@PLT				# вызов fprintf()
	add	DWORD PTR -4[rbp], 1
.L10:								# метка ".L10"
	mov	eax, DWORD PTR -60[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L11
.L9:								# метка ".L9"
	lea	rax, -80[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT		# вызов clock_gettime()
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12						# переход к .L12
.L13:								# метка ".L13"
	mov	eax, DWORD PTR -60[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	form_array@PLT			# вызов form_array()
	add	DWORD PTR -4[rbp], 1
.L12:								# метка ".L12"
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L13
	lea	rax, -96[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT		# вызов clock_gettime()
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rdi, QWORD PTR -96[rbp]
	mov	rsi, QWORD PTR -88[rbp]
	mov	rcx, rdx
	mov	rdx, rax
	call	timeDelta				# вызов timeDelta()
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rax
	lea	rdi, .LC6[rip]				# загрузка строки "Time delta: %ld ns\n"
	mov	eax, 0
	call	printf@PLT				# вызов printf()
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14						# переход к .L14
.L15:								# метка ".L15"
	mov	eax, DWORD PTR -4[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	lea	rsi, .LC5[rip]				# загрузка строки "%d "
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT				# вызов fprintf()
	add	DWORD PTR -4[rbp], 1
.L14:								# метка ".L14"
	mov	eax, DWORD PTR -60[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L15
	mov	eax, 0
	leave							# / эпилог
	ret								# \ выход из функции
	.size	main, .-main
