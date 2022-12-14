# Лабороторные работы по Высокопроизводительным вычислениям

Описание и ход выполнения работы доступно по ссылкам ниже:

1. [Выполнение работы Matrix Multiplication](https://github.com/bnepryakhin63/ssau2022/blob/main/HPC-Fall/Lab0_MatMul.ipynb)

1.1 [Дополнительно работа](https://github.com/bnepryakhin63/ssau2022/blob/main/HPC-Fall/MatMul_cuda.cu) выполнена на функциях ядра процесса видеокарты в формате файла .cu
Результаты измерений выдаются в консоли, поэтому ответы фиксировались в ручную в таблице.

| Размер матрицы | CPU, мс.выполнения | GPU, мс. выполнения	| Ускорение раз	|
|---			 | ---				  | ---					| ---			|
| 100			 | 1				  | 1					| 1				|
| 300			 | 26				  | 5					| 5, 2			|
| 500			 | 121				  | 24					| 8, 2			|
| 1000			 | 1562				  | 188					| 8, 3			|
| 1100			 | 2073				  | 238					| 8, 7			|
| 1300			 | 4035				  | 280					| 14, 4			|
| 1500			 | 8900				  | 328					| 27, 13		|
| 2000			 | 32061			  | 385					| 82, 275		|


Тк. вычисления с матрицами размерностью более чем 200*200 на [PyTorch](https://github.com/bnepryakhin63/ssau2022/blob/main/HPC-Fall/Lab0_MatMul.ipynb) произвести не получилось из за проблем с производительностью, сравнить данные методы проблематично.

2. [Выполнение работы Lab1_VectorSum](https://github.com/bnepryakhin63/ssau2022/blob/main/HPC-Fall/Lab1_SumVec.ipynb) Описание хода работы внутри блокнота Python
3. [Выполнение работы Lab3_Salt_and_pepper](https://github.com/bnepryakhin63/ssau2022/tree/main/HPC-Fall/Salt_and_pepper) Описание хода работы внутри блокнота [Python](https://github.com/bnepryakhin63/ssau2022/blob/main/HPC-Fall/Salt_and_pepper/Lab03_Salt_and_pepper.ipynb)
4. [Выполнение работы Lab4_Mass_Search](https://github.com/bnepryakhin63/ssau2022/tree/main/HPC-Fall/Mass_Search) Описание хода работы внутри блокнота [Python](https://github.com/bnepryakhin63/ssau2022/blob/main/HPC-Fall/Mass_Search/Lab4_Mass_search.ipynb)

