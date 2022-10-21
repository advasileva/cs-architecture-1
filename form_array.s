	.intel_syntax noprefix			# указание интеловского синтаксиса
	.text							# начало секции
	.globl	form_array				# метка глобальности для линкера
form_array:							# метка функции "form_array"
	push	rbp						# (пролог) сохраняем rbp на стек
	mov	rbp, rsp					# записываем rsp в rbp
	mov	r15d, edi					# записываем в регистр: n (int - 4 byte)
	mov	r13, rsi					# записываем в регистр: A (int* - 8 byte)
	mov	r14, rdx					# записываем в регистр: B (int* - 8 byte)
	mov	r12d, 0						# записываем в регистр: i = 0 (int - 4 byte)
	jmp	.L2							# переход к .L2
.L6:								# метка ".L6" - тело цикла формирования B
	mov	eax, r12d					# получаем итератор цикла i
	lea	rdx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	mov	rax, r13					# получаем A
	add	rax, rdx					# получаем A[i]
	mov	eax, DWORD PTR [rax]		# записываем значение в eаx
	test	eax, eax				# проверяем условие if (A[i] > 0)
	jle	.L3							# если меньше или равно, то переход к .L2
	mov	eax, r12d					# получаем итератор цикла i
	lea	rdx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	mov	rax, r14					# получаем B
	add	rax, rdx					# получаем B[i]
	mov	DWORD PTR [rax], 2			# записываем 2 в B[i]
	jmp	.L4							# переход к .L4
.L3:								# метка ".L6" - тело цикла формирования B (ветка else if)
	mov	eax, r12d					# получаем итератор цикла i
	lea	rdx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	mov	rax, r13					# получаем A
	add	rax, rdx					# получаем A[i]
	mov	eax, DWORD PTR [rax]		# записываем значение в eаx
	test	eax, eax				# проверяем условие if (A[i] < 0)
	jns	.L5							# если нет знака, то переход к .L2
	mov	eax, r12d					# получаем итератор цикла i
	lea	rdx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	mov	rax, r13					# получаем A
	add	rax, rdx					# получаем A[i]
	mov	edx, DWORD PTR [rax]		# записываем значение в edx
	mov	eax, r12d					# получаем итератор цикла i
	lea	rcx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	mov	rax, r14					# получаем B
	add	rax, rcx					# получаем B[i]
	add	edx, 5						# прибавляем 5
	mov	DWORD PTR [rax], edx		# записываем B[i]+5 в B[i]
	jmp	.L4							# переход к .L4
.L5:								# метка ".L6" - тело цикла формирования B (ветка else)
	mov	eax, r12d					# получаем итератор цикла i
	lea	rdx, 0[0+rax*4]				# хитро вычисляем адрес (rax*4)[0]
	mov	rax, r13					# получаем A
	add	rax, rdx					# получаем A[i]
	mov	edx, r12d					# записываем значение в edx
	movsx	rdx, edx				# расширяем edx
	lea	rcx, 0[0+rdx*4]				# хитро вычисляем адрес (rax*4)[0]
	mov	rdx, r14					# получаем B
	add	rdx, rcx					# получаем B[i]
	mov	eax, DWORD PTR [rax]		# записываем значение в edx
	mov	DWORD PTR [rdx], eax		# сохраяем значение в B[i]
.L4:								# метка ".L4" - инкрементация счётчика
	add	r12d, 1						# инкрементируем i
.L2:								# метка ".L2" - начало цикла формирования B и конец программы
	mov	eax, r12d					# получаем i
	cmp	eax, r15d					# проверяем условие цикла (i < n)
	jl	.L6							# переход к .L6 - тело цикла (если цикл не завершён)
	pop	rbp							# (эпилог)
	ret								# выход из функции
