<%--
  Created by IntelliJ IDEA.
  User: Roma
  Date: 21.11.2018
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Lobster&effect=brick-sign">
<style>
    html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-light-grey w3-theme-l5">
<table class="w3-table-all w3-hoverable w3-centered w3-striped w3-border">
<thead>
<tr class="w3-light-grey">
    <th>ID</th>
    <th>Name</th>
    <th>Status</th>
    <th>User</th>
    <th>Edit</th>
</tr>
</thead>
    <c:forEach items="${allUsers}" var="u">
    <c:forEach items="${allTasks}" var="t">
    <c:if test="${u.id==t.userId&&t.id==taskId}">
    <tr>

        <form action="/updateTask" method="post">
            <td><h4>${t.id}</h4></td>
            <input type="hidden" name="taskId" value="${t.id}">
            <td><h4>${t.name}</h4></td>
            <input type="hidden" name="name" value="${t.name}">
            <td><h4><input type="text" name="status" value="${t.status}"></h4></td>

            <td><h4>${u.login}</h4></td>
            <input type="hidden" name="userId" value="${t.userId}">
            <td> <button type="submit" class="w3-button w3-teal w3-center">EDIT</button></td>
        </form>
    </tr>
    </c:if>
    </c:forEach>
    </c:forEach>
</table>
</body>
</html>
