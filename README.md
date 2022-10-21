# Архитектура вычислительных систем ИДЗ 1

## Задание

*Разработать программу, которая получает одномерный массив AN, после чего формирует из элементов массива A новый массив B по правилам, указанным в варианте, и выводит его. Память под массивы может выделяться статически, на стеке, автоматичеси по выбору разработчика. При решении задачи необходимо использовать подпрограммы для реализации ввода, вывода и формирования нового массива.*

*Вариант 25. Сформировать массив B из элементов массива A заменив все положительные числа значением 2, а отрицательные — увеличить на 5.*

## Отчёт

**Делала на оценку 8 баллов**

Для удобства проверки структурировала отчёт по критериям

### Дерево проекта

```
.
├── asm.exe
├── c.exe
├── form_array.c
├── form_array.s
├── input
├── main.c
├── main.s
├── Makefile
├── output
├── README.md
├── scripts
│   ├── compare.sh
│   ├── compile-asm.sh
│   ├── compile-c.sh
│   ├── disasm.sh
│   ├── rand-asm.sh
│   ├── rand-c.sh
│   ├── test-asm.sh
│   └── test-c.sh
├── stages
│   ├── form_array.bare.s
│   └── main.bare.s
└── tests
    ├── test1.in
    ├── test1.out
    ├── test2.in
    ├── test2.out
    ├── test3.in
    ├── test3.out
    ├── test4.in
    └── test4.out
```

### 4 балла

+ *Приведено решение задачи на C.*

    Код на C находится в `main.c` и `form_array.c`

    Скомпилированная программа на C находится в `c.exe`

+ *В полученную ассемблерную программу, откомпилированную без оптимизирующих и отладочных опций, добавлены комментарии, поясняющие эквивалентное представление переменных в программе на C.*

    Полностью прокомментированная ассемблерная программа находится в `main.s` и `form_array.s`

    Скомпилированная ассемблерная программа находится в `asm.exe`

    Пример комментария, поясняющего эквивалентное представление переменных:
    ```
	mov	r15d, edi					# записываем в регистр: n (int - 4 byte)
	mov	r13, rsi					# записываем в регистр: A (int* - 8 byte)
	mov	r14, rdx					# записываем в регистр: B (int* - 8 byte)
	mov	r12d, 0						# записываем в регистр: i = 0 (int - 4 byte)
    ```

+ *Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки и/или за счет ручного редактирования исходного текста ассемблерной программы.*

    Ассемблерная программа сразу после получения ассемблера находится в `stages/main.bare.s` и `stages/form_array.bare.s`

    Использованы соответствующие аргументы командной строки, которые указаны в `scripts/make-asm.sh`

    За счёт ручного редактирования ассемблерной программы размер `main.s` сократился с 243 строк до 204

    Примеры удалённого из `main.s`:
    ```
    .file	"main.c"
    ```
    ```
	.type	main, @function
    ```
    ```
	cdqe                            # знаковое расширение, входило 5 раз
    ```
    ```
    mov	QWORD PTR -8[rbp], rax      # и много подобных конструкций
	mov	rax, QWORD PTR -8[rbp]
    ```
    ```
    .size	timeDelta, .-timeDelta
    ```
    ```
	mov	rdi, r9
    ```
    ```
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
    ```

    Примеры удалённого из `form_array.s`:
    ```
    .file	"form_array.c"
    ```
    ```
	.type	form_array, @function
    ```
    ```
	cdqe                            # знаковое расширение, входило 6 раз
    ```
    ```
	.ident	"GCC: (GNU) 10.3.1 20210703 (ALT Sisyphus 10.3.1-alt2)"
	.section	.note.GNU-stack,"",@progbits
    ```

    Примеры оптимизации в `main.s`

    Было:
    ```
    mov	rax, QWORD PTR [rax]
	mov	rdi, rax
    ```
    Стало:
    ```
    mov	rdi, QWORD PTR [rax]
    ```

    Было:
    ```
    mov	r8, rdi
	mov	rsi, r8
    ```
    Стало:
    ```
    mov	rsi, rdi
    ```
    Было:
    ```
    mov	rax, QWORD PTR -80[rbp]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rdi, QWORD PTR -96[rbp]
	mov	rsi, QWORD PTR -88[rbp]
	mov	rcx, rdx
	mov	rdx, rax
    ```
    Стало:
    ```
    mov	rdx, QWORD PTR -80[rbp]		# получаем start.tv_sec со стека
	mov	rcx, QWORD PTR -72[rbp]		# получаем start.tv_nsec со стека
	mov	rdi, QWORD PTR -96[rbp]		# получаем finish.tv_sec со стека
	mov	rsi, QWORD PTR -88[rbp]		# получаем finish.tv_nsec со стека
    ```

+ *Модифицированная ассемблерная программа отдельно откомпилирована и скомпонована без использования опций отладки.*

    Скомпилированная ассемблерная программа находится в `asm.exe`

+ *Представлено полное тестовое покрытие, дающее одинаковый результат на обоих программах. Приведены результаты тестовых прогонов для обоих программ, демонстрирующие эквивалентность функционирования.*

    Тесты находятся в `tests/`

    Результаты прогонов (в скрипте есть печать diff, поэтому результаты работы программ на С и на ассемблере идентичны и совпадают с эталонным ответом)
    ```
    Test ASM
    Test 1
    Time delta: 30268146 ns


    Test 2
    Time delta: 51926711 ns


    Test 3
    Time delta: 3205726328 ns


    Test 4
    Time delta: 10990702124 ns


    Test C
    Test 1
    Time delta: 29921297 ns


    Test 2
    Time delta: 69089190 ns


    Test 3
    Time delta: 6073340039 ns


    Test 4
    Time delta: 11177547345 ns
    ```

+ *Сформировать отчет, описывающий результаты тестовых прогонов и используемых опций компиляции и/или описания проведенных модификаций.*

    Отчёт сформирован

### 5 баллов

+ *В реализованной программе использовать функции с передачей данных через параметры.*

    Функция `form_array(int n, int *A, int *B)` использует передачу данных через параметры, в ассемблерной программе эта функция работает аналогично

+ *Использовать локальные переменные.*

    Пример использования локальной переменной в `main.c`:
    ```
    int count = 1000000;
    ```
    и её же в `main.s`:
    ```
    mov	DWORD PTR -28[rbp], 1000000	# кладём на стек: count = 10000 (int - 4 byte)
    ```

+ *В ассемблерную программу при вызове функции добавить комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата.*

    Полностью прокомментированная ассемблерная программа находится в `main.s` и `form_array.s`

    Пример комментария, описывающего передачу фактических параметров:
    ```
    mov	edi, DWORD PTR -60[rbp]		# получаем n со стека
	mov	rdx, QWORD PTR -48[rbp]		# получаем B со стека
	mov	rsi, QWORD PTR -40[rbp]		# получаем A со стека
	call	form_array@PLT			# вызов form_array()
    ```
    Пример комментария, описывающего перенос возвращаемого результата:
    ```
	call	fopen@PLT				# вызываем fopen()
	mov	QWORD PTR -24[rbp], rax		# output = fopen(argv[3], "w");
    ```

+ *В функциях для формальных параметров добавить комментарии, описывающие связь между параметрами языка Си и регистрами (стеком).*

    Полностью прокомментированная ассемблерная программа находится в `main.s` и `form_array.s`

    Пример комментария, описывающего связь между параметрами языка Си и регистрами (стеком):
    ```
    mov	rdx, QWORD PTR -80[rbp]		# получаем start.tv_sec со стека
	mov	rcx, QWORD PTR -72[rbp]		# получаем start.tv_nsec со стека
	mov	rdi, QWORD PTR -96[rbp]		# получаем finish.tv_sec со стека
	mov	rsi, QWORD PTR -88[rbp]		# получаем finish.tv_nsec со стека
    ```

+ *Добавить информацию о проведенных изменениях в отчет.*

    Информация добавлена в отчёт

### 6 баллов

+ *Рефакторинг программы на ассемблере за счет максимального использования регистров процессора. Добавление этой программы к уже представленным.*

    Так как в основной программе многократно вызывает функция `form_array`, то использование регистров процессора было сделано в ней, а именно были произведены следующие замены:
    ```
    rbp[-4]  -> r12d
    rbp[-32] -> r13
    rbp[-40] -> r14
    rbp[-20] -> r15d
    ```
    В результате вместо
    ```
    mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	DWORD PTR -4[rbp], 0
    ```
    получили
    ```
    mov	r15d, edi					# записываем в регистр: n (int - 4 byte)
	mov	r13, rsi					# записываем в регистр: A (int* - 8 byte)
	mov	r14, rdx					# записываем в регистр: B (int* - 8 byte)
	mov	r12d, 0						# записываем в регистр: i = 0 (int - 4 byte)
    ```

    Программа после рефакторинга находится в `main.s` и `form_array.s`

    Исходная ассемблерная программа находится в `stages/main.bare.s` и `stages/form_array.bare.s`

+ *Добавление комментариев в разработанную программу, поясняющих эквивалентное использование регистров вместо переменных исходной программы на C.*

    Полностью прокомментированная ассемблерная программа находится в `main.s` и `form_array.s`

    Пример комментария, описывающего эквивалентное использование регистров вместо переменных исходной программы на C:
    ```
    mov	r15d, edi					# записываем в регистр: n (int - 4 byte)
	mov	r13, rsi					# записываем в регистр: A (int* - 8 byte)
	mov	r14, rdx					# записываем в регистр: B (int* - 8 byte)
	mov	r12d, 0						# записываем в регистр: i = 0 (int - 4 byte)
    ```

+ *Представление результатов тестовых прогонов для разработанной программы. Оценка корректности ее выполнения на основе сравнения тестовых прогонов результатами тестирования предшествующих программ.*

    Результат тестового прогона (diff ничего не вывел - всё хорошо):
    ```
    $ make test.asm
    bash ./scripts/test-asm.sh
    Test 1
    Time delta: 26114418 ns


    Test 2
    Time delta: 72934853 ns


    Test 3
    Time delta: 3852277533 ns


    Test 4
    Time delta: 9534220042 ns
    ```

+ *Добавить новую информацию в отчет.*

    Информация добавлена в отчёт

### 7 баллов

+ *Реализация программы на ассемблере, полученной после рефакторинга, в виде двух или более единиц компиляции.*

    Использованы две единицы компиляции:
    + `main.s`
    + `form_array.s`

+ *Задание файлов с исходными данными и файла для вывода результатов с использованием аргументов командной строки.*

    Использованы аргументы командной строки для задания входного и выходного файлов:
    ```
    input = fopen(argv[2], "r");
    output = fopen(argv[3], "w");
    fscanf(input, "%d", &n);
    ```

+ *Добавить в отчет информацию о проделанных изменениях и результаты работы с тестовыми файлами.*

    Информация добавлена в отчёт

### 8 баллов

+ *Добавление в программу генератора случайных наборов данных, расширяющих возможности тестирования. Подключение генератора к программе с выбором в командной строке варианта ввода данных.*

    Вариант ввода данных выбирается с помощью первого аргумента командной строки:
    + `0` - ввод из указанного во втором аргументе файла, вывод в указанный третьим аргументом файл
    + `1` - ввод с помощью генератора, количество чисел в массиве задаётся вторым аргументом, сгенерированный массив А выводится в `input`, сформированный массив В выводится в `output`
 
    Получение размера массива:
    ```
    if (atoi(argv[1]) == 0) {
        input = fopen(argv[2], "r");
        output = fopen(argv[3], "w");
        fscanf(input, "%d", &n);
    } else {
        input = fopen("input", "w");
        output = fopen("output", "w");
        n = atoi(argv[2]);
    }
    ```

    Ввод массива А:
    ```
    if (atoi(argv[1]) == 0) {
        for(i = 0; i < n; i++) {
            fscanf(input, "%d", &A[i]);
        }
    } else {
        for(i = 0; i < n; i++) {
            A[i] = rand() % 200 - 100;
            fprintf(input, "%d ", A[i]);
    }
    ```

+ *Расширение анализа командной строки для выбора способа порождения исходных данных. Добавление данных, порождаемых генератором.*

    Описано в предыдущем пункте

+ *Модификация программы на C и программы на ассемблере, полученной после рефакторинга, для проведения сравнения на производительность. Необходимо добавить замеры во времени, которые не учитывают время ввода и вывода данных. Для увеличения времени работы минимум до 1 секунды, в зависимости от особенностей программы, можно либо выбирать соответствующие размеры исходных данных, либо зацикливать для многократного выполнения ту часть программы, которая выполняет вычисления.*

    Замер времени выполнения без ввода-вывода:
    ```
    clock_gettime(CLOCK_MONOTONIC, &start);

    for(i = 0; i < COUNT; i++) {
        form_array(n, A, B);
    }

    clock_gettime(CLOCK_MONOTONIC, &finish);

    time_delta = timeDelta(finish, start);
    printf("Time delta: %ld ns\n", time_delta);
    ```

    Вычисления программы выполняются `count = 1000000` раз

    Результат тестового прогона со сравнением работы программы на C и ассемблерной программы
    ```
    $ make compare
    bash ./scripts/compare.sh
    Test 1
    ~~~ASM-program~~~
    Time delta: 27926987 ns
    ~~~~C-program~~~~
    Time delta: 26356725 ns

    Test 2
    ~~~ASM-program~~~
    Time delta: 61166692 ns
    ~~~~C-program~~~~
    Time delta: 57593824 ns

    Test 3
    ~~~ASM-program~~~
    Time delta: 4857051526 ns
    ~~~~C-program~~~~
    Time delta: 5896887238 ns

    Test 4
    ~~~ASM-program~~~
    Time delta: 9537902233 ns
    ~~~~C-program~~~~
    Time delta: 11996438916 ns
    ```
    Видим, что ассемблерная программа работает быстрее на больших входных данных (массив А 1000-2000 элементов)

+ *Представить полученные данные в отчете для разных вариантов тестовых прогонов*

    Информация добавлена в отчёт
