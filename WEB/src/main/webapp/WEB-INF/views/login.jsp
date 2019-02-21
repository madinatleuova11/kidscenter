<%--
  Created by IntelliJ IDEA.
  User: Roma
  Date: 11.12.2018
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/login" method="post">
    EMAIL : <input type="email" name="email_parameter">
    PASSWORD : <input type="password" name="password_parameter">
    <input type="submit" value="SIGN IN">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</body>
</html>
