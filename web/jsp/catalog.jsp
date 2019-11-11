<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 05.11.2019
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Каталог</title>
    <link rel="stylesheet" href="../css_files/main.css">
    <script type="application/javascript">
        function f() {
            $.ajax({
                type: "POST",
                url: "/catalog",
                data: $("#allProducts").serialize(),
                dataType: "json",
                //success - в случаем удачного завершения запроса
                //msg - это данные от сервера
                success: function (msg) {
                    if (msg.objects.length > 0) {
                        $("#results").html("");
                        for (var i = 0; i < msg.objects.length; i++) {
                            $("#results").append("<li>" + msg.objects[i].name + "</li>");
                        }
                    } else {
                        $("#results").html("No results..");
                    }
                }
            })
        }
    </script>
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

<div class="cont_catalog">
    <p class="title_catalog">Каталог</p>
    <div class="search">
        <form method="get" action="" name="search-form">
            <select name="format"  class="select-css">
                <option disabled selected>Выберите формат</option>
                <option value="picture">Рисунок</option>
                <option value="inscription">Надпись</option>
            </select>
            <select name="color" class="select-css">
                <option disabled selected>Выберите цвет</option>
                <option value="colored">Цветная</option>
                <option value="black-white">Черно-белая</option>
            </select>
            <select name="size"  class="select-css">
                <option disabled selected>Выберите размер</option>
                <option value="petite">Маленькая</option>
                <option value="average">Средняя</option>
                <option value="big">Большая</option>
            </select>
            <input class="submit_but" type="submit" value="Найти">
        </form>
    </div>
    <div class="container-fluid results">
    <c:if test="${allProducts != null}">
        <c:forEach var="tr" items="${allProducts}">
            <div class="product-item">
                <div class="product-img">
                    <a href="/product?id=${tr.getId()}">
                        <img src="${tr.getPathPhoto()}">
                    </a>
                </div>
                <div class="product-list">
                    <h3>${tr.getName()}</h3>
                    <span class="price">₽ ${tr.getPrice()}</span>
                    <div class="actions">
                        <!--<a href="" class="cart-button">В корзину</a>-->
                        <input type="button" name="go-to-basket" class="btns bask" value="В корзину">
                        <!--<a href="" class="wishlist">В избранное</a>-->
                        <input type="button" name="add-to-fav" class="btns fav" value="В избранное">
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
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


