<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 08.11.2019
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Новинки</title>
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

<div class="cont_catalog">
    <p class="title_catalog">Новинки</p>
    <div class="container-fluid results">
    <c:if test="${novelties != null}">
        <c:forEach var="tr" items="${novelties}">
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
