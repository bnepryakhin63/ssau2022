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
![image](https://user-images.githubusercontent.com/53073280/212570612-6d78f760-f9d8-4053-99f5-3e1079ee0885.png)


##### Task 2
If you have no DBMS installed, please install one. You can choose any SQL DBMS you like, but PostgreSQL and MySQL are preferred.

Создал базу данных в неё добавил таблицы со связями
[Код запроса:](https://github.com/bnepryakhin63/ssau2022/blob/main/ESA/JavaEE_Lab1_Orders/MysqSQL.txt) 

##### Task 3
Choose any subject area and make a model with at least two entities with a few properties.
Create a script to make a database for your model.

создал скрипт для работы с базой данных, который выполняет функцию добавления - удаления заказов и покупателей в БД

![image](https://user-images.githubusercontent.com/53073280/212570717-4a2d075d-8643-400b-bdf2-5763f374ad72.png)


##### Task 4
Develop data layer as Java Beans for the model and make them prepared for use with Entity Persistence.

[Созданы бины и сервлеты для работы приложения](https://github.com/bnepryakhin63/ssau2022/tree/main/ESA/JavaEE_Lab1_Orders/src/main/java/com/example) 



![image](https://user-images.githubusercontent.com/53073280/212570693-74e030b8-29a3-47ef-8fea-ff671a0c3893.png)

##### Task 5
Implement business layer for accessing data using session beans.

##### Task 6
Implement view layer using any technology of your choice, which is applicable here.

Реализовано предаставление:

![Главная](https://user-images.githubusercontent.com/53073280/212570644-e263e92d-2155-4422-a35b-28d58ef96cf5.png)
![Добавление покупателя](https://user-images.githubusercontent.com/53073280/212570660-f5468830-464c-4f32-9a7e-2d6a273975e4.png)

Покупатели и заказы удаляются при нажатии

![Списки заказов](https://user-images.githubusercontent.com/53073280/212570668-8c396bc5-85da-4321-b381-86bcc30f419c.png)
![Списки покупателей](https://user-images.githubusercontent.com/53073280/212570672-9b36fc2d-7ce8-4971-a094-57f0cbaabff5.png)



