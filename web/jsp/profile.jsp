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
            <li><a href="">История покупок</a></li>
            <li><a href="">Избранное</a></li>
        </ul>
        <form method="get" action="/logout" class="btn_logout">
            <input type="submit" value="Выйти">
        </form>
    </div>
    <div class="cont_lk">
        <div class="title_lk">Профиль</div>
        <form class="reg-form" action="/profile" method="post">
            <div class="form-row">
                <label for="form_fname">Имя:</label>
                <input type="text" id="form_fname" name="first_name" value="${user.getFirstName()}">
            </div>
            <div class="form-row">
                <label for="form_lname">Фамилия:</label>
                <input type="text" id="form_lname" name="last_name" value="${user.getLastName()}">
            </div>
            <div class="form-row">
                <label for="form_tname">Отчество:</label>
                <input type="text" id="form_tname" name="third_name" value="${user.getPatronymic()}">
            </div>
            <img src="${user.getPathPhoto()}"  id="user_pic" width="200" alt="userpic">
            <div class="form-photo">
                <label for="form_photo">Фото:</label>
                <input type="file" id="form_photo" name="choose-file" multiple accept="image/*,image/jpeg">
            </div>
            <div class="form-row">
                <label for="form_mail">Почта:</label>
                <input type="text" id="form_mail" name="mail" value="${user.getMail()}">
            </div>
            <div class="form-row">
                <label for="form_phone">Номер телефона:</label>
                <input type="text" id="form_phone" name="phone" value="${user.getPhoneNumber()}">
            </div>
            <div class="form-row">
                <label for="form_new_password">Новый пароль:</label>
                <input type="password" id="form_new_password" name="password">
            </div>
            <div class="form-row to-reg">
                <input type="submit" value="Сохранить">
            </div>
        </form>

    </div>
</div>


<!--здесь типа футер-->
<%@include file= "includes/footer.jsp"%>
</body>
</html>
