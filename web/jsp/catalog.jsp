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
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="application/javascript">
        function f() {
            $.ajax({
                type: "POST",
                url: "/catalog",
                data: $("#product_select").serialize(),
                dataType: "json",
                //success - в случаем удачного завершения запроса
                //msg - это данные от сервера
                success: function (msg) {
                    $("#results").html("");
                    if (msg.objects.length > 0) {
                        for (var i = 0; i < msg.objects.length; i++) {
                            $("#results").append(
                                "<div class=\"product-item\">\n" +
                                "                <div class=\"product-img\">\n" +
                                "                    <a href=\"/product?id=" + msg.objects[i].id + "\">\n" +
                                "                        <img src=\"" + msg.objects[i].pathPhoto + "\">\n" +
                                "                    </a>\n" +
                                "                </div>\n" +
                                "                <div class=\"product-list\">\n" +
                                "                    <h3>" + msg.objects[i].name + "</h3>\n" +
                                "                    <span class=\"price\">₽" + msg.objects[i].price +"</span>\n" +
                                "                    <div class=\"actions\">\n" +
                                "                        <!--<a href=\"\" class=\"cart-button\">В корзину</a>-->\n" +
                                "                        <input type=\"button\" name=\"go-to-basket\" class=\"btns bask\" value=\"В корзину\">\n" +
                                "                        <!--<a href=\"\" class=\"wishlist\">В избранное</a>-->\n" +
                                "                        <input type=\"button\" name=\"add-to-fav\" class=\"btns fav\" value=\"В избранное\">\n" +
                                "                    </div>\n" +
                                "                </div>\n" +
                                "            </div>"
                            );
                        }
                    }
                    else {
                        $("#results").html("Нет результатов! Повторите Ваш запрос:)");
                    }
                }
            })
        }

        function addToBasket(product_id) {
            $.ajax ({
                type:"POST",
                url: "/product",
                data: {
                    "product_id" : product_id
                },
                success: function () {
                    $("#buttonchik").html("");
                    $('#buttonchik').append(
                        "<input type=\"button\" class=\"floated\" id=\"addToBasket\"  value=\"Добавлено\" >"
                    )
                }
            })
        }

        function addToFavorites(product_id) {
            $.ajax ({
                type:"POST",
                url: "/favorites",
                data: {
                    "product_id" : product_id
                },
                success: function () {
                    $("#addToFavorites").html("");
                    $('#addToFavorites').append(
                        "<input type=\"button\" class=\"floated\" value=\"Добавлено\" >"
                    )
                }
            })
        }
    </script>
</head>
<body>
<%@include file= "includes/navbar.jsp"%>

<div class="cont_catalog">
    <p class="title_catalog">Каталог</p>
    <div class="search">
        <form method="post" id="product_select" name="search-form">
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
            <input class="submit_but" type="button" value="Найти" onclick="f()">
        </form>
    </div>
    <div class="container-fluid results" id="results">
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
                        <%--<div id="buttonchik">--%>
                            <input type="button" name="go-to-basket" class="btns bask"
                                   value="В корзину" onclick=addToBasket(${tr.getId()}) >
                        <%--</div>--%>
                        <!--<a href="" class="cart-button">В корзину</a>-->
                        <!--<a href="" class="wishlist">В избранное</a>-->
                        <c:if test="${currentUser != null}">
                            <%--<div id="addToFavorites">--%>
                                <input type="button" name="add-to-fav" class="btns fav"
                                   value="В избранное" onclick="addToFavorites(${tr.getId()})">
                            <%--</div>--%>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
    </div>
</div>

<%@include file= "includes/footer.jsp"%>
</body>
</html>


