<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 12.11.2019
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>История покупок</title>
    <link rel="stylesheet" href="../css_files/footer.css">
    <link rel="stylesheet" href="../css_files/main.css">
</head>
<body>
<!--navigation bar-->
<ul class="navig">
    <li><a class="tabs" href="/home">Главная страница</a></li>
    <li><a class="tabs" href="/catalog">Каталог</a></li>
    <li><a class="tabs" href="/novelties">Новинки</a></li>
    <li><a class="tabs" href="/sale">Распродажа</a></li>
    <li style="float:right"><img class="logo" src="../pictures/logo.png" width="240px" height="60px" ></li>
    <li><a class="navicons" href="/profile"><img src="../pictures/prof.png"></a></li>
    <li><img src="../pictures/empty.png" width="40px" alt="empty"></li>
    <li><a class="navicons" href="/basket"><img src="../pictures/shopping_basket.png"></a></li>
</ul>

<div class="container">
    <div class="widget">
        <p class="lk_title">Личный кабинет</p>
        <ul>
            <li><a href="">Профиль</a></li>
            <li class="current"><a href="">История покупок</a></li>
            <li><a href="">Избранное</a></li>
        </ul>
    </div>
    <div class="cont_elem">
        <div class="element">
            <div class="item-info">
                <img src="../pictures/tatu2.png" alt="tatu">
            </div>
            <div class="item-info">
                <p class="item_name">Tatu 2</p>
                <p class="order_number">Номер заказа: <span style="font-weight: bold">329010</span></p>
            </div>
            <div class="item-info right-info">
                <p class="order_price">₽ 1000</p>
                <!--если заказ завершен, добавляем класс completed
                если в обработке - processing, заказ отправлен - ontheway -->
                <p class="order_status completed">Завершен</p>
            </div>
        </div>
    </div>

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
