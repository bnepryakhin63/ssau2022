<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add user</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container row">
    <form class="col col-md-5" action="add-order-servlet" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">Введите id пользователя:</label>
            <input class="form-control" type="number" id="id" value="${user.id}" name="id" />
        </div>

        <div class="mb-3">
            <label for="name" class="form-label">Введите имя:</label>
            <input class="form-control" type="text" id="name" value="${user.name}" name="name" />
        </div>

        <div class="mb-3">
            <label for="login" class="form-label">Введите логин:</label>
            <input class="form-control" type="text" id="login" value="${user.login}" name="login" />
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Введите пароль:</label>
            <input class="form-control" type="text" id="password" value="${user.password}" name="password" />
        </div>

        <input class="btn btn-primary" type="submit" value="Сохранить" />
    </form>
</div>
</body>
</html>