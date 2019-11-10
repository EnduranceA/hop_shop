<%@ page import="java.util.List" %>
<%@ page import="models.Product" %>
<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 08.11.2019
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Корзина</title>
    <link rel="stylesheet" href="../css_files/main.css">
</head>
<body>
<!--navigation bar-->
<ul class="navig">
    <li><a class="tabs" href="/home">Главная страница</a></li>
    <li><a class="tabs" href="/catalog">Каталог</a></li>
    <li><a class="tabs" href="/novelties">Новинки</a></li>
    <li><a class="tabs" href="/sale">Распродажа</a></li>
    <li><a class="tabs" href="/delivery">Доставка</a></li>
    <li style="float:right"><img class="logo" src="../pictures/logo.png" width="240px" height="60px" ></li>
    <li><a class="navicons" href="/profile"><img src="../pictures/prof.png"></a></li>
    <li><img src="../pictures/empty.png" width="40px" alt="empty"></li>
    <li><a class="navicons" href="/basket"><img src="../pictures/shopping_basket.png"></a></li>
</ul>

<div class="cont_shop_basket">
    <p class="title_shop_basket">Корзина</p>
    <!--         КОРЗИНА ПУСТАЯ-->
    <!--        <div class="emptybasket">-->
    <!--            <img src="../sadface.png">-->
    <!--            <p class="text-info-basket">Грустно, когда в корзине пусто. Порадуйте себя, начав покупки прямо сейчас.</p>-->
    <!--            <form action="catalog_page.html">-->
    <!--                <button class="ctlg_button">Начать покупки</button>-->
    <!--            </form>-->
    <!--        </div>-->
    <!-- В КОРЗИНЕ ЧТО-ТО ЕСТЬ -->
    <div class="container results">
        <c:choose>
            <c:when test="${basket != null}">
                <c:forEach var="tr" items="${basket}">
                    <div class="product-item">
                        <div class="product-img">
                            <a href="/product?id=${tr.getId()}">
                                <img src="${tr.getPathPhoto()}">
                            </a>
                        </div>
                        <div class="product-list">
                            <h3 style="text-align: center">${tr.getName()}</h3>
                            <span class="shop_price">₽ ${tr.getPrice()}</span>
                            <div class="quantity">
                                <button class="plus-btn" type="button" name="button">
                                    <img src="../pictures/plus.svg" />
                                </button>
                                <input type="text" name="name" value="1" class="counter">
                                <button class="minus-btn" type="button" name="button">
                                    <img src="../pictures/minus.svg" alt="" />
                                </button>
                            </div>
                            <div class="actions">
                                <input type="button" name="delete-from-basket" class="bask_btn" value="Удалить из корзины">
                            </div>
                        </div>
                    </div>
                    <form action="/order">
                        <button class="ctlg_button">Оформить заказ</button>
                    </form>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="emptybasket">
                    <img src="../pictures/sadface.png">
                    <p class="text-info-basket">Грустно, когда в корзине пусто. Порадуйте себя, начав покупки прямо сейчас.</p>
                    <form action="/catalog">
                        <button class="ctlg_button">Начать покупки</button>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
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

<script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('.minus-btn').click(function(e){
            e.preventDefault();
            var $this = $(this);
            var $input = $this.closest('div').find('input');
            var value = parseInt($input.val());
            if(value > 1){value = value - 1;}
            else{value = 0;}
            $input.val(value);
        });

        $('.plus-btn').click(function(e){
            e.preventDefault();
            var $this = $(this);
            var $input = $this.closest('div').find('input');
            var value = parseInt($input.val());
            if(value < 100){value = value + 1;}
            else{value = 100;}
            $input.val(value);
        });
    });
</script>
</body>
</html>
