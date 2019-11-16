<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 12.11.2019
  Time: 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Избранное</title>
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
                        "<input type=\"button\" class=\"floated\" value=\"Добавлено\" >"
                    )
                }
            })
        }
    </script>
</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

<div class="container">
    <div class="widget">
        <p class="lk_title">Личный кабинет</p>
        <ul>
            <li><a href="/profile">Профиль</a></li>
            <li><a href="/history">История покупок</a></li>
            <li class="current"><a href="/favorites">Избранное</a></li>
        </ul>
        <form method="get" action="/logout" class="btn_logout">
            <input type="submit" value="Выйти">
        </form>
    </div>
    <div class="cont_elem">
        <c:if test="${favorites != null}">
            <c:forEach var="tr" items="${favorites}">
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
                            <div id="buttonchik">
                                <input type="button" name="go-to-basket" class="btns bask" value="В корзину">
                            </div>
                            <input type="button" name="delete-from-fav" class="btns fav" value="Удалить">
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