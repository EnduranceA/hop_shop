<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 03.11.2019
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Личный кабинет</title>
    <link rel="stylesheet" href="../css_files/main.css">
</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

<div class="container">
    <div class="widget">
        <p class="title_lk">Личный кабинет</p>
        <ul>
            <li class="current"><a href="/profile">Профиль</a></li>
            <li><a href="/history">История покупок</a></li>
            <li><a href="/favorites">Избранное</a></li>
        </ul>
        <form method="get" action="/logout" class="btn_logout">
            <input type="submit" value="Выйти">
        </form>
    </div>
    <div class="cont_lk">
        <div class="title_lk">Профиль</div>
        <form class="reg-form" method="post">
            <div class="form-row">
                <label for="first_name">Имя:</label>
                <input type="text" id="first_name" name="first_name" value="${currentUser.getFirstName()}">
            </div>
            <div class="form-row">
                <label for="last_name">Фамилия:</label>
                <input type="text" id="last_name" name="last_name" value="${currentUser.getLastName()}">
            </div>
            <div class="form-row">
                <label for="patronymic">Отчество:</label>
                <input type="text" id="patronymic" name="patronymic" value="${currentUser.getPatronymic()}">
            </div>
            <img src="${currentUser.getPathPhoto()}"  id="user_pic" width="200">
            <div class="form-row">
                <label for="mail">Почта:</label>
                <input type="text" id="mail" name="mail" value="${currentUser.getMail()}">
            </div>
            <div class="form-row">
                <label for="phone">Номер телефона:</label>
                <input type="text" id="phone" name="phone" value="${currentUser.getPhoneNumber()}">
            </div>
            <div class="form-row to-reg">
                <form action="/profile" method="post">
                    <input type="submit" value="Сохранить" >
                </form>
            </div>
        </form>

    </div>
</div>


<!--здесь типа футер-->
<%@include file= "includes/footer.jsp"%>
</body>
</html>
