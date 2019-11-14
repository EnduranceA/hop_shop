<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 02.11.2019
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Регистрация</title>
    <link rel="stylesheet" href="../css_files/main.css">

</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

<div class="cont_reg_auth">
    <div id="reg_title">Регистрация</div>
    <form class="reg-form"  enctype="multipart/form-data" action="" method="post">
        <div class="form-row">
            <label for="form_fname">Имя:</label>
            <input type="text" id="form_fname" name="first_name">
        </div>
        <div class="form-row">
            <label for="form_lname">Фамилия:</label>
            <input type="text" id="form_lname" name="last_name">
        </div>
        <div class="form-row">
            <label for="form_tname">Отчество:</label>
            <input type="text" id="form_tname" name="patronymic">
        </div>
        <!--            здесь должно быть фото-->
        <div class="form-photo">
            <label for="form_photo">Фото:</label>
            <input type="file" id="form_photo" name="path_photo" multiple accept="image/*,image/jpeg">
        </div>
        <div class="form-row">
            <label for="form_mail">Почта:</label>
            <input type="text" id="form_mail" name="mail" required pattern="^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$" placeholder="nick@mail.com">
        </div>
        <div class="form-row">
            <label for="form_password">Пароль:</label>
            <input type="password" id="form_password" name="password" required>
        </div>
        <div class="form-row">
            <label for="form_phone">Номер телефона:</label>
            <input type="text" id="form_phone" name="phone_number" required pattern="8[0-9]{10}" placeholder="8xxxxxxxxxx">
        </div>
        <div class="form-row to-reg">
            <input type="submit" value="Зарегистрироваться">
        </div>
    </form>

</div>

<%@include file= "includes/footer.jsp"%>
</body>
</html>