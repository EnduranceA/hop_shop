<%@ page import="java.util.List" %>
<%@ page import="models.Product" %>
<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 08.11.2019
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Корзина</title>
    <link rel="stylesheet" href="../css_files/main.css">
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        function remove(id) {
            document.getElementById(id).remove();
        }

        function delete_basket_product(id) {
            $.ajax({
                type: "POST",
                url: "/basket",
                data: {
                    id: id
                }
            })
        }

        $(document).ready(function(){
            $('.minus-btn').click(function(e){
                e.preventDefault();
                var $this = $(this);
                var $input = $this.closest('div').find('input');
                var value = parseInt($input.val());
                if(value > 1){value = value - 1;}
                else{value = 0;}
                $input.val(value);
            });

            $('.plus-btn').click(function(e){
                e.preventDefault();
                var $this = $(this);
                var $input = $this.closest('div').find('input');
                var value = parseInt($input.val());
                if(value < 100){value = value + 1;}
                else{value = 100;}
                $input.val(value);
            });
        });
    </script>
</head>
<body>
<!--navigation bar-->
<%@include file= "includes/navbar.jsp"%>

<div class="cont_shop_basket">
    <p class="title_shop_basket">Корзина</p>
    <div class="container results">
        <c:choose>
            <c:when test="${basket != null && !basket.isEmpty()}">
                <c:forEach var="tr" items="${basket}">
                    <div class="product-item" id="${tr.getId()}">
                        <div class="product-img">
                            <a href="/product?id=${tr.getId()}">
                                <img src="${tr.getPathPhoto()}">
                            </a>
                        </div>
                        <div class="product-list">
                            <h3 style="text-align: center">${tr.getName()}</h3>
                            <span class="shop_price">₽ ${tr.getPrice()}</span>
                            <div class="quantity">
                                <button class="plus-btn" type="button" name="button">
                                    <img src="../pictures/plus.svg" />
                                </button>
                                <input type="text" name="count" value="1" class="counter">
                                <button class="minus-btn" type="button" name="button">
                                    <img src="../pictures/minus.svg" alt="" />
                                </button>
                            </div>
                            <div class="actions">
                                <input type="button" onclick="delete_basket_product(${tr.getId()}); remove(${tr.getId()})"
                                       class="bask_btn" value="Удалить из корзины">
                            </div>
                        </div>
                    </div>
                </c:forEach>
                    <a href="/order?basket=${currentUser.getId()}">
                        <button class="ctlg_button">Оформить заказ</button>
                    </a>
            </c:when>
            <c:otherwise>
                <div class="emptybasket">
                    <img src="../pictures/sadface.png">
                    <p class="text-info-basket">Грустно, когда в корзине пусто. Порадуйте себя, начав покупки прямо сейчас.</p>
                    <form action="/catalog">
                        <button class="ctlg_button">Начать покупки</button>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!--здесь типа футер-->
<%@include file= "includes/footer.jsp"%>
</body>
</html>
