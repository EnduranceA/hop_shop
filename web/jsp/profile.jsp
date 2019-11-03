<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 03.11.2019
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="form-style-2">
    <form method="post" action="/profile">
        <img src="${user.getPathPhoto()}" width="200"/>
        <label for="path_photo">Photo:
            <input class="input-field" type="file" id="path_photo" name="path_photo">
        </label>
        <label for="first_name">First name:
            <input class="input-field" type="text" id="first_name" name="first_name"
                   value="${user.getFirstName()}" />
        </label>
        <label for="last_name">Last name:
            <input class="input-field" type="text" id="last_name" name="last_name"
                   value="${user.getLastName()}" />
        </label>
        <label for="patronymic">Patronymic:
            <input class="input-field" type="text" id="patronymic" name="patronymic"
                   value="${user.getPatronymic()}" />
        </label>
        <label for="number_phone">Password
            <input class="input-field" type="text" id="number_phone" name="number_phone"
                   value="${user.getPhoneNumber()}" />
        </label>
        <input type="submit" value="SAVE">
    </form>
</div>
</body>
</html>
