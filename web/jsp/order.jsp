<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 07.11.2019
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>Регистрация</p>
<form method="post" action="/order">
    <label for="mail">User mail
        <input class="input-field" type="text" id="mail" name="mail">
    </label>
    <label for="password">Password
        <input class="input-field" type="password" id="password" name="password">
    </label>
    <input type="submit" value="Sign Up">
</form>
</body>
</html>
