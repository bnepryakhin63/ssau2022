# Лабораторная работа № 1:
# Тема: "Клиент-серверная архитектура" 
---

## Основные технологии:

* __Язык__: Python 3.6
* __Библиотеки__: numpy, matplotlib, PIL, socket

## Описание основных модулей программы

*  *client.py* - модуль для отправки исходного изображение;
*  *server.py* - модуль, который получает, искажает и очищает изображение.  


## Пример работы:

Исходное изображение:

![Исходное изображение](https://github.com/bnepryakhin63/ssau2022/blob/main/Designing_Distributed_Applications/Lab1/images/img.png)

Изображение, получаемое сервером и зашумленное:

![Искаженное изображение](https://github.com/bnepryakhin63/ssau2022/blob/main/Designing_Distributed_Applications/Lab1/images/img_output.png)


Изображение, очищаемое сервером:

![Очищенное изображение](https://github.com/bnepryakhin63/ssau2022/blob/main/Designing_Distributed_Applications/Lab1/images/server_img.png)


## Оенка потери при передачи от клиента к серверу

Размер исходного и выходного изображения:
![Очищенное изображение](https://github.com/bnepryakhin63/ssau2022/blob/main/Designing_Distributed_Applications/Lab1/tmp/resurs.png)

### Для запуска надо:

1. Запустить сервер server.py 
2. Запустить выполнение команды клиентом