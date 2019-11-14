<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 12.11.2019
  Time: 7:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Успешное оформление заказа</title>
    <link rel="stylesheet" href="../css_files/main.css">
</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

<div class="succ_order_container">
    <p class="order_number_title">Заказ №${booking.getId()}</p>
    <p class="succ_order_text">Спасибо! Заказ оформлен!</p>
    <p class="succ_order_text">Продавец свяжется с вами в ближайшее время.</p>
    <form action="/catalog">
        <button class="ctlg_button">Продолжить покупки</button>
    </form>
</div>

<%@include file= "includes/footer.jsp"%>
</body>
</html>
