<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 05.11.2019
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method ="post" id="allProducts">
    <select name="format" id="format">
        <option selected disabled>Выберите формат</option>
        <option value="picture">Рисунок</option>
        <option value="inscription">Надпись</option>
    </select>
    <select name="color" id="color">
        <option selected disabled>Выберите цвет</option>
        <option value="colored">Цветная</option>
        <option value="black_white">Черно-белая</option>
    </select>
    <select name="size" id="size">
        <option selected disabled>Выберите размер</option>
        <option value="petite">Маленькая</option>
        <option value="average">Средняя</option>
        <option value="big">Большая</option>
    </select>
    <p><input type="button" id="sendreq" value="Found" onclick="f()"></p>
</form>
<script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
<script type="application/javascript">
    function f() {
        $.ajax({
            type: "POST",
            url: "/catalog",
            data: $("#allProducts").serialize(),
            dataType: "json",
            //success - в случаем удачного завершения запроса
            //msg - это данные от сервера
            success: function (msg) {
                if (msg.objects.length > 0) {
                    $("#result").html("");
                    for (var i = 0; i < msg.objects.length; i++) {
                        $("#result").append("<li>" + msg.objects[i].name + "</li>");
                    }
                } else {
                    $("#result").html("No results..");
                }
            }
        })
    }
</script>

<div id="result">
    <c:if test="${allProducts != null}">
        <c:forEach var="tr" items="${allProducts}">
            <a href="/catalog?id=${tr.getId()}">
                <p>${tr.getPathPhoto()}</p>
                <p>${tr.getName()}</p>
            </a>
        </c:forEach>
    </c:if>
</div>

</body>
</html>
