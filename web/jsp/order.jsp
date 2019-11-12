<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 07.11.2019
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Оформление заказа</title>
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

<div class="order_container">
    <p class="order_text">Оформление заказа</p>
    <form class="order-form"  enctype="multipart/form-data" action="" method="post">
        <c:if test="${сustomer != null}">
            <div class="form-row inline-infa">
                <input type="text" id="form_lname" name="last_name" value="${customer.getFirstName()}">
            </div>
            <div class="form-row inline-infa">
                <input type="text" id="form_fname" name="first_name" value="${customer.getLastName()}">
            </div>
            <div class="form-row inline-infa">
                <input type="text" id="form_tname" name="patronymic" value="${customer.getPatronymic()}">
            </div>
        <div class="form-row phone">
            <input type="text" id="form_phone" name="phone" required pattern="8[0-9]{10}" value="${customer.getPhoneNumber()}">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_region" name="region" placeholder= "Область">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_area" name="area" placeholder= "Район">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_city" name="city" placeholder= "Населенный пункт">
        </div>
        <br>
        <div class="form-row inline-infa">
            <input type="text" id="form_street" name="street" placeholder= "Улица">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_building" name="building" placeholder= "Дом">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_flat" name="flat" placeholder= "Квартира">
        </div>
        <p class="headline">Доставка</p>
        <label class="checkbox">Курьером
            <input type="radio" checked="checked" name="dostavka" value="curier">
            <span class="checkmark"></span>
        </label>
        <label class="checkbox">Самовывоз
            <input type="radio" name="dostavka" value="samovivoz">
            <span class="checkmark"></span>
        </label>
        <p class="headline">Способ оплаты</p>
        <label class="checkbox">Яндекс.Деньги
            <input type="radio" checked="checked" name="payment" value="yandex">
            <span class="checkmark"></span>
        </label>
        <label class="checkbox">Qiwi
            <input type="radio" name="payment" value="qiwi">
            <span class="checkmark"></span>
        </label>
        <label class="checkbox">Банковская карта
            <input type="radio" name="payment" value="credit_card">
            <span class="checkmark"></span>
        </label>
        <label class="checkbox">При получении курьеру
            <input type="radio" name="payment" value="to_curier">
            <span class="checkmark"></span>
        </label>
        <p class="headline">Комментарий к заказу</p>
        <form class="decor">
            <div class="form-comment">
                <textarea rows="3"></textarea>
            </div>
        </form>
        <div class="form-row pay">
            <form method="post" action="/order" >
                <input type="submit" value="Оплатить">
            </form>
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
