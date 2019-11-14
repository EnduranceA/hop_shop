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
        function f(product_id) {
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
<%@include file= "includes/navbar.jsp"%>

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
                    <form action="/order?booking=${booking.getId()}">
                        <input type="submit" class="floated" value="Заказать">
                    </form>
                    <div id="buttonchik">
                        <input type="button" class="floated" id="addToBasket" value="В корзину" onclick="f(${product.getId()})">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:if test="${!comments.isEmpty()}">
<div class="cont_item">
    <p id="title_item">Отзывы</p>
    <div class="row" id="table_comments"></div>
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
    <c:if test="${currentUser != null}">
    <!--форма комментария-->
    <form class="decor">
        <div class="form-inner">
            <form method="post" action="/comment">
                <h3>Добавить комментарий</h3>
                <input type="text" value="${currentUser.getFirstName()}">
                <textarea id="text" placeholder="Ваш отзыв. . ." rows="3"></textarea>
                <input type="button" onclick="send_comment(${product.getId()})" value="Отправить">
            </form>
        </div>
    </form>
    </c:if>
</div>

<%@include file= "includes/footer.jsp"%>
</body>
</html>

