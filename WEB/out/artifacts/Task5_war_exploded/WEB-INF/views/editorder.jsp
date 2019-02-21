<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read Order</title>
</head>
<body>
<h1>
    ${order.name} AT ${order.orderedTime} - ${order.completed}
</h1>
<form action="/deleteorder" method="post">
    <input type="hidden" value="${order.id}" name="id">
    <button type="submit">DELETE</button>
</form>
</body>
</html>