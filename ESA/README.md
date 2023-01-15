# Лабороторные работы по ESA 2022

#### Lab1 Application with common JavaEE architecture

Описание и ход выполнения работы доступно по ссылкам ниже:

[Выполнение работы #1](https://github.com/bnepryakhin63/ssau2022/blob/main/HPC-Fall/Lab0_MatMul.ipynb)

##### Task 1
- Download GlassFish application server.
- Install it by unpacking the archive.
- Start the application server.
- Open an administrative console and go through its controls.

Произвел подключение к glassfish серверу и настроил коннектор с MySQL БД

##### Task 2
If you have no DBMS installed, please install one. You can choose any SQL DBMS you like, but PostgreSQL and MySQL are preferred.

Создал базу данных в неё добавил таблицы со связями
[Код запроса:](https://github.com/bnepryakhin63/ssau2022/blob/main/HPC-Fall/MatMul_cuda.cu) 

##### Task 3
Choose any subject area and make a model with at least two entities with a few properties.
Create a script to make a database for your model.

сощдал скрипт для работы с базой данных, который выполняет функцию добавления - удаления заказов и покупателей в БД

##### Task 4
Develop data layer as Java Beans for the model and make them prepared for use with Entity Persistence.

Созданы бины и сервелеты для работы приложения

##### Task 5
Implement business layer for accessing data using session beans.

##### Task 6
Implement view layer using any technology of your choice, which is applicable here.

Реализовано предаставление:

