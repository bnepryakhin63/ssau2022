<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Заказы интернет-магазина</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h3><%= "Привет, Пользователь!" %></h3>
<table class="table table-hover" style="width: 450px">
    <thead>
    <tr>
        <th>#</th>
        <th>Клиенты</th>
        <th>Заказы</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td><a href="user-servlet">Показать покупателей</a></td>
        <td><a href="order-servlet">Показать Заказы</a></td>
    </tr>
    <tr>
        <td>2</td>
        <td><a href="add-user-servlet">Добавить покупателей</a></td>
        <td><a href="add-order-servlet">Добавить заказы</a></td>
    </tr>
    </tbody>
</table>
</body>
</html>