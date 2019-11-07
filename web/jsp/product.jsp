<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 07.11.2019
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${product != null}">
    <p name="path_photo">${product.getPathPhoto()}</p>
    <p>${product.getName()}</p>
    <p>${product.getDescription()}</p>
    <p>${product.getPrice()}</p>
    <p>${product.getCount()}</p>
</c:if>
<form action="/product" method="post">
    <button type="submit" name="order" value="Заказать"></button>
</form>
<button type="submit" name="basket" value="В корзину" onclick=f()></button>

<script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
<script type="application/javascript">
    function f() {
        $.ajax({
            type: "POST",
            url: "/product",
            data: $("#product").serialize(),
            dataType: "json",
            //success - в случаем удачного завершения запроса
            //msg - это данные от сервера
            success: function (msg) {
                $('.add-to-cart').on('click', function (e) {
                    e.preventDefault();
                    var shows = parseInt($(this).data("show"), 10);
                    if (shows == 0) {
                        $("#mot").show(); //Показываем блок с id="mot"
                    }
                })
            }
        })
    }
</script>
<div class="catalog-tovarov">
    <div id="mot">
        <img width="30px" src="http://sparkysite.ru/small/check/check03/scheck264.png" />
    </div>
    <div class="price">
        <span>444 руб.</span><br/>
        <a class="add-to-cart" data-price="10000" data-show="0" href="#">В корзину</a>
    </div>
</div>
<div class="catalog-tovarov">
    <div id="mot">
        <img width="30px" src="http://sparkysite.ru/small/check/check03/scheck264.png" />
    </div>
    <div class="price">
        <span>444 руб.</span><br/>
        <a class="add-to-cart" data-price="10000" data-show="0" href="#">В корзину</a>
    </div>
</div>
<div class="catalog-tovarov">
    <div id="mot">
        <img width="30px" src="http://sparkysite.ru/small/check/check03/scheck264.png" />
    </div>
    <div class="price">
        <span>444 руб.</span><br/>
        <a class="add-to-cart" data-price="10000" data-show="0" href="#">В корзину</a>
    </div>
</div>

</body>
</html>
