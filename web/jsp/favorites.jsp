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
</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

<div class="container">
    <div class="widget">
        <p class="lk_title">Личный кабинет</p>
        <ul>
            <li><a href="">Профиль</a></li>
            <li><a href="">История покупок</a></li>
            <li class="current"><a href="">Избранное</a></li>
        </ul>
    </div>
    <div class="cont_elem">
        <div class="product-item">
            <div class="product-img">
                <a href="">
                    <img src="../pictures/tatu1.jpg">
                </a>
            </div>
            <div class="product-list">
                <h3>Тату раз</h3>
                <span class="price">₽ 1999</span>
                <div class="actions">
                    <input type="button" name="go-to-basket" class="btns bask" value="В корзину">
                    <input type="button" name="delete-from-fav" class="btns fav" value="Удалить">
                </div>
            </div>
        </div>
    </div>

</div>

<%@include file= "includes/footer.jsp"%>
</body>
</html>