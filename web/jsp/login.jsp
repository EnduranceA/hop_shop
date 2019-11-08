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
    </script>
</head>
<body>
<!--navigation bar-->
<ul class="navig">
    <li><a class="tabs" href="home.jsp">Главная страница</a></li>
    <li><a class="tabs" href="catalog.jsp">Каталог</a></li>
    <li><a class="tabs" href="novelties.jsp">Новинки</a></li>
    <li><a class="tabs" href="sale.jsp">Распродажа</a></li>
    <li><a class="tabs" href="delivery.jsp">Доставка</a></li>
    <li style="float:right"><img class="logo" src="../pictures/logo.png" width="240px" height="60px" ></li>
    <li><a class="navicons" href="profile.jsp"><img src="../pictures/prof.png"></a></li>
    <li><img src="../pictures/empty.png" width="40px" alt="empty"></li>
    <li><a class="navicons" href="basket.jsp"><img src="../pictures/shopping_basket.png"></a></li>
</ul>

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
            <input type="checkbox" id="remember">
            <label for="remember">Запомнить меня</label>
        </div>
        <div class="form-row-auth">
            <input type="submit" id="vhod_btn" value="Войти">
        </div>
    </form>

</div>

<!--здесь типа футер-->
<footer>
    <div class="container">
        <div id="social-platforms">
            <p>Следи за нами в соцсетях:</p>
            <a class="btn btn-icon btn-facebook" href="#"><span>Facebook</span></a>
            <a class="btn btn-icon btn-twitter" href="#"><span>Twitter</span></a>
            <a class="btn btn-icon btn-googleplus" href="#"><span>Google+</span></a>
            <a class="btn btn-icon btn-pinterest" href="#"><span>Pinterest</span></a>
            <a class="btn btn-icon btn-linkedin" href="#"><span>LinkedIn</span></a>
            <p>Почта: gelyaclass@gmail.com</p>
            <p>Телефон: +7(843)-365-66-33</p>
        </div>
    </div>
</footer>

</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 03.11.2019
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="form-style-2">
    <div class="form-style-2-heading">
        Please Sign Up!
    </div>
    <form method="post" action="/login">
        <label for="mail">User mail
            <input class="input-field" type="text" id="mail" name="mail">
        </label>
        <label for="password">Password
            <input class="input-field" type="password" id="password" name="password">
        </label>
        <input type="submit" value="Sign Up">
    </form>
</div>
</body>
</html>