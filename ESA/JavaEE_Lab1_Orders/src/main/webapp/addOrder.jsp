<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container row">
    <form class="col col-md-5"  action="add-order-servlet" method="post">
        <div class="mb-3">
            <label for="zakaz" class="form-label">Введите состав заказа:</label>
            <input class="form-control" type="text" id="zakaz" value="${order.zakaz}" name="title" />
        </div>
        <div class="mb-3">
            <label for="count" class="form-label">Введите количество товаров:</label>
            <input class="form-control" type="number" id="count" value="${order.count}" name="count" />
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Введите цену:</label>
            <input class="form-control" type="number" id="price" value="${order.price}" name="price" />
        </div>
        <div class="mb-3">
            <label for="id_user" class="form-label">Введите id пользователя:</label>
            <input class="form-control" type="number" id="id_user" value="${order.id_user}" name="id_user" />
        </div>
        <input type="hidden" id="id" value="${order.id}" name="id" />
        <input class="btn btn-primary" type="submit" value="Добавить" />
    </form>
</div>
</body>
</html>