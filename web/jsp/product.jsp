<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 07.11.2019
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${product != null}">
    <p name="path_photo">${product.getPathPhoto()}</p>
    <p>${product.getName()}</p>
    <p>${product.getDescription()}</p>
    <p>${product.getPrice()}</p>
    <p>${product.getCount()}</p>
</c:if>
<form action="/product" method="post">
    <button type="submit" name="order" value="Заказать"></button>
</form>
<button type="submit" name="basket" value="В корзину"></button>
</body>
</html>
