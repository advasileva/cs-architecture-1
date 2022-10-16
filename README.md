# cs-architecture-1

25. Сформировать массив B из элементов массива A заменив все
положительные числа значением 2, а отрицательные — увеличить на 5.


```
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./main.c \
    -S -o ./main.s
gcc ./main.s -o ./main.exe
```