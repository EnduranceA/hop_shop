<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 07.11.2019
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Оформление заказа</title>
    <link rel="stylesheet" href="../css_files/main.css">
</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

<div class="order_container">
    <p class="order_text">Оформление заказа</p>
    <form class="order-form"  enctype="multipart/form-data" action="" method="post">
        <div class="order_list">
        <c:if test="${basket != null}">
            <c:forEach var="tr" items="${basket}">
                <div class="product-item order-item">
                    <div class="product-img">
                        <a href="/product?id=${tr.getId()}">
                            <img src="${tr.getPathPhoto()}">
                        </a>
                    </div>
                    <div class="product-list">
                        <h3>${tr.getName()}</h3>
                        <span class="price">₽ ${tr.getPrice()}</span>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        </div>

        <p class="order_cost">Сумма к оплате: <strong>${amount}</strong></p>
        <br>
        <div class="form-row inline-infa">
            <input type="text" id="form_lname" name="last_name" value="${currentUser.getFirstName()}">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_fname" name="first_name" value="${currentUser.getLastName()}">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_tname" name="patronymic" value="${currentUser.getPatronymic()}">
        </div>
        <div class="form-row phone">
            <input type="text" id="form_phone" name="phone" required pattern="8[0-9]{10}" value="${currentUser.getPhoneNumber()}">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_region" name="region" placeholder= "Область">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_area" name="area" placeholder= "Район">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_city" name="locality" placeholder= "Населенный пункт">
        </div>
        <br>
        <div class="form-row inline-infa">
            <input type="text" id="form_street" name="street" placeholder= "Улица">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_building" name="home_number" placeholder= "Дом">
        </div>
        <div class="form-row inline-infa">
            <input type="text" id="form_flat" name="apartment" placeholder= "Квартира">
        </div>
        <p class="headline">Доставка</p>
        <label class="checkbox">Курьером
            <input type="radio" checked="checked" name="delivery" value="Курьер">
            <span class="checkmark"></span>
        </label>
        <label class="checkbox">Самовывоз
            <input type="radio" name="delivery" value="Самовывоз">
            <span class="checkmark"></span>
        </label>
        <p class="headline">Способ оплаты</p>
        <label class="checkbox">Яндекс.Деньги
            <input type="radio" checked="checked" name="payment" value="yandex">
            <span class="checkmark"></span>
        </label>
        <label class="checkbox">Qiwi
            <input type="radio" name="payment" value="qiwi">
            <span class="checkmark"></span>
        </label>
        <label class="checkbox">Банковская карта
            <input type="radio" name="payment" value="credit_card">
            <span class="checkmark"></span>
        </label>
        <label class="checkbox">При получении курьеру
            <input type="radio" name="payment" value="to_curier">
            <span class="checkmark"></span>
        </label>
        <p class="headline">Комментарий к заказу</p>
        <form class="decor">
            <div class="form-comment">
                <textarea name="info" rows="3"></textarea>
            </div>
        </form>
        <div class="form-row pay">
            <form method="get" action="/successful_order" >
                <input type="submit" value="Оплатить">
            </form>
        </div>
    </form>
</div>
<!--здесь типа футер-->
<%@include file= "includes/footer.jsp"%>
</body>
</html>
