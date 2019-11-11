<%@ page import="models.Customer" %>
<%@ page import="services.CustomerService" %><%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 07.11.2019
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Товар</title>
    <link rel="stylesheet" href="../css_files/main.css">
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        function send_comment(product_id) {
            $.ajax({
                type: "POST",
                url: "/comment",
                data: {
                    "text": $('#text').val(),
                    "product_id": product_id
                },
                dataType: "json",
                success: function (msg, customer) {
                    $('#table_comments').append(
                        "<div class=\"comment\">\n" +
                        "    <div class=\"cont2\">\n" +
                        "        <img src=\"" + customer.getPathPhoto + "\">\n" +
                        "    </div>\n" +
                        "    <div class=\"cont2\">\n" +
                        "        <div class=\"info\">\n" +
                        "            <p class=\"username\">" + customer.getFirstName()
                        + " " + customer.getLastName() + "</p>\n" +
                        "            <p class=\"date\">" + msg.getTime() + "</p>\n" +
                        "                        <div class=\"comment-text\">\n" +
                                                       msg.getText() +
                        "                        </div>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "</div>"
                    )
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

<div class="cont_item">
    <div class="item">
        <div class="cont1">
            <img src="${product.getPathPhoto()}">
        </div>
        <div class="cont1">
            <div class="info">
                <p class="name">${product.getName()}</p>
                <p class="item_price">₽ ${product.getPrice()}</p>
                <p style="color:#55286F ">В наличии: ${product.getCount()}</p>
                <div class="text-info">${product.getDescription()} </div>
                <div class="buttons">
                    <form>
                        <input type="button" class="floated" name="order" value="Заказать">
                    </form>
                    <form>
                        <input type="button" class="floated" name="toshopbasket"  value="В корзину">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="cont_item">
    <p id="title_item">Отзывы</p>
    <div class="row" id="table_comments"></div>
    <c:if test="${comments != null}">
        <c:forEach var="tr" items="${comments}">
            <div class="comment">
                <div class="cont2">
                    <img src="${tr.value.getPathPhoto()}">
                </div>
                <div class="cont2">
                    <div class="info">
                        <p class="username">${tr.value.getFirstName()} ${tr.value.getLastName()}</p>
                        <p class="date">${tr.key.getTime()}</p>
                        <div class="comment-text">
                            ${tr.key.getText()}
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
    <!--форма комментария-->
    <form class="decor">
        <div class="form-inner">
            <form method="post" action="/comment">
                <h3>Добавить комментарий</h3>
                <c:if test="${currentUser != null}">
                    <input type="text" value="${currentUser.getFirstName()}">
                </c:if>
                <c:if test="${currentUser == null}">
                    <input type="text"  placeholder="Имя">
                </c:if>
                <textarea id="text" placeholder="Ваш отзыв. . ." rows="3"></textarea>
                <input type="button" onclick="send_comment(${product.getId()})" value="Отправить">
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

<%--<html>--%>
<%--<head>--%>
    <%--<title>Title</title>--%>
    <%--<script src="../js/addToCart.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:if test="${product != null}">--%>
    <%--<p name="path_photo">${product.getPathPhoto()}</p>--%>
    <%--<p>${product.getName()}</p>--%>
    <%--<p>${product.getDescription()}</p>--%>
    <%--<p>${product.getPrice()}</p>--%>
    <%--<p>${product.getCount()}</p>--%>
<%--</c:if>--%>
<%--<form action="/product" method="post">--%>
    <%--<button type="submit" name="order" value="Заказать"></button>--%>
<%--</form>--%>
<%--<button type="submit" name="basket" value="В корзину" onclick=f()></button>--%>

<%--<script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>--%>

<%--</body>--%>
<%--</html>--%>
