<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 02.11.2019
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<h2>REGISTRATION</h2>
<form method="post" action="/registration" enctype="multipart/form-data">
    <label for="first_name">First name:
        <input class="input-field" type="text" id="first_name" name="first_name">
    </label>
    <label for="last_name">Last name:
        <input class="input-field" type="text" id="last_name" name="last_name">
    </label>
    <label for="patronymic">Patronymic:
        <input class="input-field" type="text" id="patronymic" name="patronymic">
    </label>
    <label for="path_photo">Photo:
        <input class="input-field" type="file" id="path_photo" name="path_photo">
    </label>
    <label for="mail">Mail:
        <input class="input-field" type="text" id="mail" name="mail">
    </label>
    <label for="password">Password:
        <input class="input-field" type="password" id="password" name="password">
    </label>
    <label for="phone_number">Number phone:
        <input class="input-field" type="text" id="phone_number" name="phone_number">
    </label>
    <input type="submit" value="Зарегистрироваться">
</form>
</body>
</html>

