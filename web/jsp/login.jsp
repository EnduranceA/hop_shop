<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 03.11.2019
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Войти</title>
    <link rel="stylesheet" href="../css_files/main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.answer_box').click(function(e) {
                // добавляем класс блоку, чтобы сделать красивый чекбокс
                $(this).toggleClass('checked');
                // если данные чекбокса нам нужны при отправке формы, то отмечаем и сам чекбокс
                if ($('input', this).is(':checked'))
                    $('input', this).prop('checked', false);
                else
                    $('input', this).prop('checked', true);
                e.preventDefault();
            });
        });
        
        function f() {
            var check = null;
            if (remember.checked == true) {
                check = remember.value;
            }
        }
    </script>
</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

<div class="cont_reg_auth ">
    <div id="vhod">Вход</div>
    <form class="login-form" action="/login" method="post">
        <div class="form-row-auth">
            <input type="text" id="form_mail" name="mail"
                   required pattern="^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$" placeholder=" Почта">
        </div>
        <div class="form-row-auth">
            <input type="password" id="form_password" name="password" placeholder=" Пароль">
        </div>
        <div class="answer_box">
            <input type="checkbox" name="remember" id="rem" value="rememberMe">
            <label for="rem">Запомнить меня</label>
        </div>
        <div class="form-row-auth">
            <input type="submit" id="vhod_btn" value="Войти" onclick="f()">
        </div>
        <a href="/registration" class="btn_to_reg">Зарегистрироваться</a>
    </form>

</div>

<!--здесь типа футер-->
<%@include file= "includes/footer.jsp"%>

</body>
</html>




