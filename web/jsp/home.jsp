<%--
  Created by IntelliJ IDEA.
  User: DEEGER
  Date: 03.11.2019
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>SO</title>
</head>
<body>
<p><input id="query" oninput="f()"/></p>
<div id="res"></div>
<script type="application/javascript">
    function f() {
        //проверяем, измненилась ли длина вводимого слова
        if ($("#query").val().length >= 1) {
            //если да, то ajax-запрос
            $.ajax({
                //присваиваем url
                url: "/home",
                data: {"query": $("#query").val()},
                dataType: "json",
                success: function (msg) {
                    if (msg.objects.length > 0) {
                        $("#res").html("");
                        for (var i = 0; i < msg.objects.length; i++) {
                            $("#res").append("<li>" + msg.objects[i].name + "</li>");
                        }
                    } else {
                        $("#res").html("No results..");
                    }
                }
            })
        }
        else {
            $("#res").html("");
        }
    }
</script>
</body>
</html>
