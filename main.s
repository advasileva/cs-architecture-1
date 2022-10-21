	.intel_syntax noprefix			# указание интеловского синтаксиса
	.text							# начало секции
	.globl	timeDelta				# метка глобальности для линкера
timeDelta:							# метка функции "timeDelta"
	push	rbp						# (пролог) сохраняем rbp на стек
	mov	rbp, rsp					# записываем rsp в rbp
	mov	rax, rsi					# меняем регистры, чтобы положить переменные на стек
	mov	rsi, rdi					# входными параметрами функции являются структуры из 2 полей,
	mov	rdi, rax					# поэтому нам нужно 2*2=4 ячейки по 8 байт
	mov	QWORD PTR -32[rbp], rsi		# кладём на стек: finish.tv_sec
	mov	QWORD PTR -24[rbp], rdi		# кладём на стек: finish.tv_nsec
	mov	QWORD PTR -48[rbp], rdx		# кладём на стек: start.tv_sec
	mov	QWORD PTR -40[rbp], rcx		# кладём на стек: start.tv_nsec
	mov	rax, QWORD PTR -48[rbp]		# rax = start.tv_sec
	imul	rax, rax, 1000000000	# nsecStart *= 1000000000;
	mov	QWORD PTR -8[rbp], rax		# rbp[-8] = nsecStart
	mov	rax, QWORD PTR -40[rbp]		# rax = start.tv_nsec
	add	QWORD PTR -8[rbp], rax		# nsecStart += start.tv_nsec;
	mov	rax, QWORD PTR -32[rbp]		# rax = finish.tv_sec
	imul	rax, rax, 1000000000	# nsecFinish *= 1000000000;
	mov	QWORD PTR -16[rbp], rax		# rbp[-16] = nsecFinish
	mov	rax, QWORD PTR -24[rbp]		# rax = finish.tv_nsec
	add	QWORD PTR -16[rbp], rax		# nsecFinish += finish.tv_nsec
	mov	rax, QWORD PTR -16[rbp]		# rax = nsecFinish
	sub	rax, QWORD PTR -8[rbp]		# nsecFinish - nsecStart;
	pop	rbp							# (эпилог)
	ret								# выход из функции
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
	push	rbp						# (пролог) сохраняем rbp на стек
	mov	rbp, rsp					# записываем rsp в rbp
	sub	rsp, 112					# сдвигаем rsp на 8 байт
	mov	DWORD PTR -100[rbp], edi	# кладём на стек: rdi - argc (4 byte)
	mov	QWORD PTR -112[rbp], rsi	# кладём на стек: rsi - argv (8 byte)
	mov	DWORD PTR -28[rbp], 1000000	# кладём на стек: count = 10000 (int - 4 byte)
	mov	rax, QWORD PTR -112[rbp]	# получаем указатель на argv в памяти
	add	rax, 8						# переходим к argv[1]
	mov	rdi, QWORD PTR [rax]		# помещаем значение argv[1] в rdi
	call	atoi@PLT				# вызываем atoi()
	test	eax, eax				# хитро проверяем, что после приведения к int у нас получился 0
	jne	.L4							# если не 0, то переходим к вводу с помощью генератора (else-ветка)
	mov	rax, QWORD PTR -112[rbp]	# получаем указатель на argv в памяти
	add	rax, 16						# переходим к argv[2]
	mov	rdi, QWORD PTR [rax]		# получаем значение argv[2]
	lea	rsi, .LC0[rip]				# загружаем строку "r"
	call	fopen@PLT				# вызываем fopen()
	mov	QWORD PTR -16[rbp], rax		# input = fopen(argv[2], "r");
	mov	rax, QWORD PTR -112[rbp]	# получаем указатель на argv в памяти 
	add	rax, 24						# переходим к argv[3]
	mov	rdi, QWORD PTR [rax]		# получаем значение argv[3]
	lea	rsi, .LC1[rip]				# загружаем строку "w"
	call	fopen@PLT				# вызываем fopen()
	mov	QWORD PTR -24[rbp], rax		# output = fopen(argv[3], "w");
	lea	rdx, -60[rbp]				# получаем указатель на n, чтобы положить туда значение
	lea	rsi, .LC2[rip]				# загружаем строку "%d"
	mov	rdi, QWORD PTR -16[rbp]		# получаем значение input
	mov	eax, 0						# обнуляем eax
	call	__isoc99_fscanf@PLT		# вызов fscanf()
	jmp	.L5							# переходим к .L5
.L4:								# метка ".L4" - ввод input, output, n с помощью генератора
	lea	rsi, .LC1[rip]				# загружаем строку "w"
	lea	rdi, .LC3[rip]				# загружаем строку "input"
	call	fopen@PLT				# вызываем fopen()
	mov	QWORD PTR -16[rbp], rax		# помещаем результат в input
	lea	rsi, .LC1[rip]				# загружаем строку "w"
	lea	rdi, .LC4[rip]				# загружаем строку "output"
	call	fopen@PLT				# вызываем fopen()
	mov	QWORD PTR -24[rbp], rax		# помещаем результат в output
	mov	rax, QWORD PTR -112[rbp]	# получаем указатель на argv в памяти
	add	rax, 16						# переходим к argv[2]
	mov	rdi, QWORD PTR [rax]		# помещаем значение argv[2] в rdi
	call	atoi@PLT				# вызываем atoi()
	mov	DWORD PTR -60[rbp], eax		# помещаем результат приведения argv[2] к int в n
.L5:								# метка ".L5" - после первого if-else в сишной программе (аллокация памяти и начало нового if-else)
	mov	eax, DWORD PTR -60[rbp]		# получаем n со стека
	sal	rax, 2						# дважды сдвигаем rax влево (хитрое умножение n*sizeof(int), то есть на 4)
	mov	rdi, rax					# кладём результат в rdi
	call	malloc@PLT				# вызываем malloc()
	mov	QWORD PTR -40[rbp], rax		# кладём результат в A на стеке (указатель на int - 8 byte)
	mov	eax, DWORD PTR -60[rbp]		# получаем n со стека
	sal	rax, 2						# дважды сдвигаем rax влево (хитрое умножение n*sizeof(int), то есть на 4)
	mov	rdi, rax					# кладём результат в rdi
	call	malloc@PLT				# вызов malloc()
	mov	QWORD PTR -48[rbp], rax		# кладём результат в B на стеке (указатель на int - 8 byte)
	mov	rax, QWORD PTR -112[rbp]	# получаем указатель на argv в памяти
	add	rax, 8						# переходим к argv[1]
	mov	rdi, QWORD PTR [rax]		# помещаем значение argv[1] в rdi
	call	atoi@PLT				# вызываем atoi()
	test	eax, eax				# хитро проверяем, что после приведения к int у нас получился 0
	jne	.L6							# если не 0, то переходим к вводу с помощью генератора (else-ветка)
	mov	DWORD PTR -4[rbp], 0		# обнуляем rbp[-4] - итератор цикла
	jmp	.L7							# переход к .L7
.L8:								# метка ".L8" - тело цикла ввода значений массива A из файла
	mov	eax, DWORD PTR -4[rbp]		# получаем итератор цикла i
	lea	rdx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	add	rdx, QWORD PTR -40[rbp] 	# получаем A[i]
	mov	rdi, QWORD PTR -16[rbp]		# получаем input
	lea	rsi, .LC2[rip]				# загружаем строку "%d"
	call	__isoc99_fscanf@PLT		# вызов fscanf()
	add	DWORD PTR -4[rbp], 1		# инкрементируем i
.L7:								# метка ".L7" - начало ввода значений массива A из файла
	mov	eax, DWORD PTR -60[rbp]		# получаем n со стека
	cmp	DWORD PTR -4[rbp], eax		# проверяем условие цикла (i < n)
	jl	.L8							# переход к .L8 - тело цикла (если цикл не завершён)
	jmp	.L9							# переход к .L9
.L6:								# метка ".L6" - начало цикла ввода значений массива A с помощью генератора
	mov	DWORD PTR -4[rbp], 0		# обнуляем rbp[-4] - итератор цикла
	jmp	.L10						# переход к .L10
.L11:								# метка ".L11" - тело цикла ввода значений массива A с помощью генератора
	call	rand@PLT				# вызываем rand()
	movsx	rdx, eax				# кладём результат rand() в rdx
	imul	rdx, rdx, 1374389535	# хитро
	shr	rdx, 32						# берём
	sar	edx, 6						# остаток
	mov	ecx, eax					# от
	sar	ecx, 31						# деления
	sub	edx, ecx					# результата rand()
	imul	ecx, edx, 200			# на
	sub	eax, ecx					# 200
	mov	edx, eax					# сохраняем полученный остаток
	mov	eax, DWORD PTR -4[rbp]		# получаем значение итератора
	lea	rcx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	mov	rax, QWORD PTR -40[rbp]		# получаем указатель на память A
	add	rax, rcx					# получаем A[i]
	sub	edx, 100					# вычитаем 100
	mov	DWORD PTR [rax], edx		# сохраняем резуьтат в A[i]
	mov	eax, DWORD PTR -4[rbp]		# получаем значение итератора
	lea	rdx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	add	rdx, QWORD PTR -40[rbp] 	# получаем A[i]
	mov	rdi, QWORD PTR -16[rbp]		# получаем input 
	lea	rsi, .LC5[rip]				# загружаем "%d "
	call	fprintf@PLT				# вызов fprintf()
	add	DWORD PTR -4[rbp], 1		# инкрементируем i
.L10:								# метка ".L10" - условие цикла ввода значений массива A с помощью генератора
	mov	eax, DWORD PTR -60[rbp]		# получаем n со стека
	cmp	DWORD PTR -4[rbp], eax		# проверяем условие цикла (i < n) 
	jl	.L11						# переход к .L11 - тело цикла (если цикл не завершён)
.L9:								# метка ".L9" - после второго if-else
	lea	rsi, -80[rbp]				# получаем ссылку на start
	mov	edi, 1						# записываем время отсчёта
	call	clock_gettime@PLT		# вызов clock_gettime()
	mov	DWORD PTR -4[rbp], 0		# обнуляем итератор
	jmp	.L12						# переход к .L12
.L13:								# метка ".L13" - тело цикла формирования массива
	mov	edi, DWORD PTR -60[rbp]		# получаем n со стека
	mov	rdx, QWORD PTR -48[rbp]		# получаем B со стека
	mov	rsi, QWORD PTR -40[rbp]		# получаем A со стека
	call	form_array@PLT			# вызов form_array()
	add	DWORD PTR -4[rbp], 1		# инкрементируем i
.L12:								# метка ".L12" - начало цикла формирования массива
	mov	eax, DWORD PTR -4[rbp]		# получаем итератор цикла i
	cmp	eax, DWORD PTR -28[rbp]		# получаем count со стека
	jl	.L13						# переходим к .L13 - телу цикла
	lea	rsi, -96[rbp]				# получаем ссылку на finish
	mov	edi, 1						# записываем время отсчёта
	call	clock_gettime@PLT		# вызов clock_gettime()
	mov	rdx, QWORD PTR -80[rbp]		# получаем start.tv_sec со стека
	mov	rcx, QWORD PTR -72[rbp]		# получаем start.tv_nsec со стека
	mov	rdi, QWORD PTR -96[rbp]		# получаем finish.tv_sec со стека
	mov	rsi, QWORD PTR -88[rbp]		# получаем finish.tv_nsec со стека
	call	timeDelta				# вызов timeDelta()
	mov	QWORD PTR -56[rbp], rax		# записываем результат в time_delta
	mov	rsi, QWORD PTR -56[rbp]		# получаем time_delta
	lea	rdi, .LC6[rip]				# загрузка строки "Time delta: %ld ns\n"
	call	printf@PLT				# вызов printf()
	mov	DWORD PTR -4[rbp], 0		# обнуляем rbp[-4]
	jmp	.L14						# переход к .L14
.L15:								# метка ".L15" - тело цикла вывода массива B в output
	mov	eax, DWORD PTR -4[rbp]		# получаем итератор цикла i
	lea	rdx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	mov	rax, QWORD PTR -48[rbp]		# получаем B со стека
	add	rax, rdx					# получаем B[i]
	mov	edx, DWORD PTR [rax]		# записываем значение в edx
	mov	rdi, QWORD PTR -24[rbp]		# получаем output со стека
	lea	rsi, .LC5[rip]				# загрузка строки "%d "
	call	fprintf@PLT				# вызов fprintf()
	add	DWORD PTR -4[rbp], 1		# инкрементируем i
.L14:								# метка ".L14" - начало цикла вывода массива B в output
	mov	eax, DWORD PTR -60[rbp]		# получаем n со стека
	cmp	DWORD PTR -4[rbp], eax		# проверяем условие цикла (i < n)
	jl	.L15						# переход к .L15 - тело цикла (если цикл не завершён)
	leave							# (эпилог)
	ret								# выход из функции
