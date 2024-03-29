<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 12.11.2019
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>История покупок</title>
    <link rel="stylesheet" href="../css_files/footer.css">
    <link rel="stylesheet" href="../css_files/main.css">
</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

<div class="container">
    <div class="widget">
        <p class="lk_title">Личный кабинет</p>
        <ul>
            <li><a href="/profile">Профиль</a></li>
            <li class="current"><a href="/history">История покупок</a></li>
            <li><a href="/favorites">Избранное</a></li>
        </ul>
        <form method="get" action="/logout" class="btn_logout">
            <input type="submit" value="Выйти">
        </form>
    </div>
    <div class="cont_elem">
    <c:if test="${bookings != null}">
        <c:forEach var="tr" items="${bookings}">
        <div class="element">
            <div class="item-info">
                <p class="order_number">Номер заказа: <span style="font-weight: bold">${tr.getId()}</span></p>
            </div>
            <div class="item-info right-info">
                <p class="order_price">₽ ${tr.getAmount()}</p>
                <!--если заказ завершен, добавляем класс completed
                если в обработке - processing, заказ отправлен - ontheway -->
                <p class="order_status ontheway">Заказ отправлен</p>
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
