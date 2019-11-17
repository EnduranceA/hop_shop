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

        function add(product_id) {
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

        function send_comment(product_id) {
            $.ajax({
                type: "POST",
                url: "/comment",
                data: {
                    "text": $('#text').val(),
                    "product_id": product_id
                },
                dataType: "json",
                success: function (msg) {
                    $('#table_comments').append(
                       "<div class=\"comment\">\n" +
                        "                <div class=\"cont2\">\n" +
                        "                    <img src=\"" + msg.objects[1].pathPhoto + "\">\n" +
                        "                </div>\n" +
                        "                <div class=\"cont2\">\n" +
                        "                    <div class=\"info\">\n" +
                        "                        <p class=\"username\">" + msg.objects[1].firstName +" " + msg.objects[1].lastName + "</p>\n" +
                        "                        <p class=\"date\">" + msg.objects[0].time+ "</p>\n" +
                        "                        <div class=\"comment-text\">\n" +
                                                    msg.objects[0].text +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>"
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
                    <c:if test="${currentUser != null}">
                        <div id="addToFavorites">
                            <input type="submit" class="floated" value="В избранное" onclick="add(${product.getId()})">
                        </div>
                    </c:if>
                    <div id="buttonchik">
                        <input type="button" class="floated" id="addToBasket" value="В корзину" onclick=f(${product.getId()})>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:if test="${!comments.isEmpty()}">
<div class="cont_item">
    <p id="title_item">Отзывы</p>
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
    <div class="row" id="table_comments"></div>
    <c:if test="${currentUser != null}">
    <!--форма комментария-->
    <form class="decor">
        <div class="form-inner">
            <form method="post">
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