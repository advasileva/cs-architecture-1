# cs-architecture-1

## Задание

*Разработать программу, которая получает одномерный массив AN, после чего формирует из элементов массива A новый массив B по правилам, указанным в варианте, и выводит его. Память под массивы может выделяться статически, на стеке, автоматичеси по выбору разработчика. При решении задачи необходимо использовать подпрограммы для реализации ввода, вывода и формирования нового массива.*

*Вариант 25. Сформировать массив B из элементов массива A заменив все положительные числа значением 2, а отрицательные — увеличить на 5.*

## Отчёт

**Делала на оценку 8 баллов**

Для удобства проверки структурировала отчёт по критериям

### 4 балла

+ *Приведено решение задачи на C.*

    Код на C в файле `main.c`

+ *В полученную ассемблерную программу, откомпилированную без оптимизирующих и отладочных опций, добавлены комментарии, поясняющие эквивалентное представление переменных в программе на C.*

    TBA

+ *Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки и/или за счет ручного редактирования исходного текста ассемблерной программы.*

    TBA

+ *Модифицированная ассемблерная программа отдельно откомпилирована и скомпонована без использования опций отладки.*

    TBA

+ *Представлено полное тестовое покрытие, дающее одинаковый результат на обоих программах. Приведены результаты тестовых прогонов для обоих программ, демонстрирующие эквивалентность функционирования.*

    TBA

+ *Сформировать отчет, описывающий результаты тестовых прогонов и используемых опций компиляции и/или описания проведенных модификаций.*

    TBA

### 5 баллов

+ В реализованной программе использовать функции с передачей данных
через параметры.
+ Использовать локальные переменные.
+ В ассемблерную программу при вызове функции добавить комментарии,
описывающие передачу фактических параметров и перенос возвращаемого результата.
+ В функциях для формальных параметров добавить комментарии, описывающие связь между параметрами языка Си и регистрами (стеком).
+ Добавить информацию о проведенных изменениях в отчет.

### 6 баллов

+ Рефакторинг программы на ассемблере за счет максимального использования регистров процессора. Добавление этой программы к уже представленным.
+ Добавление комментариев в разработанную программу, поясняющих эквивалентное использование регистров вместо переменных исходной программы на C.
+ Представление результатов тестовых прогонов для разработанной программы. Оценка корректности ее выполнения на основе сравнения тестовых прогонов результатами тестирования предшествующих программ.
+ Добавить новую информацию в отчет.

### 7 баллов

+ Реализация программы на ассемблере, полученной после рефакторинга,
в виде двух или более единиц компиляции.
+ Задание файлов с исходными данными и файла для вывода результатов
с использованием аргументов командной строки.
+ Добавить в отчет информацию о проделанных изменениях и результаты
работы с тестовыми файлами.

### 8 баллов

+ Добавление в программу генератора случайных наборов данных, расширяющих возможности тестирования. Подключение генератора к программе с выбором в командной строке варианта ввода данных.
+ Расширение анализа командной строки для выбора способа порождения
исходных данных. Добавление данных, порождаемых генератором.
+ Модификация программы на C и программы на ассемблере, полученной
после рефакторинга, для проведения сравнения на производительность.
Необходимо добавить замеры во времени, которые не учитывают время
ввода и вывода данных. Для увеличения времени работы минимум до 1
секунды, в зависимости от особенностей программы, можно либо выбирать соответствующие размеры исходных данных, либо зацикливать для
многократного выполнения ту часть программы, которая выполняет вычисления.
+ Представить полученные данные в отчете для разных вариантов тестовых прогонов
При невыполнении хотя бы одного из требований оценка снижается на балл.

