<%--
  Created by IntelliJ IDEA.
  User: Roma
  Date: 11.12.2018
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.firstspring.entities.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Users user = (Users)request.getAttribute("user");
%>
<h1>PROIFLE PAGE OF <%=user.getEmail() %> </h1>
<br>
<a href="/admin">ADMIN PAGE</a>
<a href="/main">MAIN PAGE</a>
<br>
<form action="/logout" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="submit" value="LOGOUT">
</form>
</body>
</html>
