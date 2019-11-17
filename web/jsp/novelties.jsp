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
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        function f(product_id) {
            $.ajax ({
                type:"POST",
                url: "/addProduct",
                data: {
                    "product_id" : product_id
                },
                success: function () {
                    $("#buttonchik").html("");
                    $('#buttonchik').append(
                        "<input type=\"button\" class=\"btns bask\" value=\"Добавлено\" >"
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
    </script>
</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

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
                        <input type="button" class="btns bask" value="В корзину" >
                        <!--<a href="" class="wishlist">В избранное</a>-->
                        <c:if test="${currentUser != null}">
                            <%--<div id="addToFavorites">--%>
                                <input type="button" name="add-to-fav" class="btns fav" value="В избранное" onclick="add(${tr.getId()})">
                            <%--</div>--%>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
    </div>
</div>

<!--здесь типа футер-->
<%@include file= "includes/footer.jsp"%>
</body>
</html>
