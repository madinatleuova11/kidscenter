<%--
  Created by IntelliJ IDEA.
  User: Roma
  Date: 21.11.2018
  Time: 4:55
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<header class="w3-container w3-padding-32">
    <h2 class="w3-center"><b>Welcome, <span class="w3-tag">${log_user.getLogin()}</span></b></h2>

    <a href="/logout" class="w3-button w3-theme w3-right">Logout</a>
</header>
<c:choose>
    <c:when test="${log_user.getRole()==1}">
<div class="w3-row-padding">
    <div class="w3-third w3-container w3-margin-bottom">
                <div class="w3-container w3-white">
                    <h6 class="w3-opacity">ADD NEW USER</h6>

                    <form class="w3-container w3-card w3-padding-32 w3-white" action="/adduseradmin" method="post">
                    Login : <input type="text" name="login">
                    <br>
                    <br>
                    Password : <input type="password" name="password">
                    <br>
                    <br>
                    Role : <input type="text" name="role">
                    <br>
                    <br>
                    <button type="submit" class="w3-button w3-teal w3-right">Send</button>
                </form>
            </div>
        </div>

    <div class="w3-third w3-container w3-margin-bottom">
        <div class="w3-container w3-white">
            <h6 class="w3-opacity">ADD NEW TASK</h6>
            <form action="/addtask" method="post">
                Name : <input type="text" name="taskname">
                <br>
                <br>
                User : <select name="userid">
                <c:forEach items="${allUsers}" var="p">
                <option value="${p.id}">${p.login}</option>
                </c:forEach>
            </select>
                <br>
                <br>
                <button type="submit" class="w3-button w3-teal w3-right">Send</button>
            </form>
        </div>
    </div>
    </div>

        <br>
        <br>

<div class="w3-row-padding">
    <h3 class="w3-center"><b>Users</b></h3>
    <br>
    <br>

    <table class="w3-table-all w3-hoverable w3-centered w3-striped w3-border">
        <thead>
        <tr class="w3-light-grey">
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Role</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <c:forEach items="${allUsers}" var="p">
            <tr>
                <form action="/updateuser" method="post">
                    <input type="hidden" name="id" value="${p.id}">
                    <td><h4>${p.id}</h4></td>
                    <td><h4><input type="text" name="login" value="${p.login}"></h4></td>
                    <td><h4><input type="text" name="password" value="${p.password}"></h4></td>
                    <td><h4><input type="text" name="role" value="${p.role}"></h4></td>
                    <td><button type="submit" class="w3-button w3-teal w3-center">EDIT</button></td>
                </form>
                <form action="/deleteuser" method="post">
                    <input type="hidden" name="id" value="${p.id}">
                    <td><button type="submit" class="w3-button w3-teal w3-center">DELETE</button></td>
                </form>

            </tr>
        </c:forEach>
    </table>
         </div>
    <br>
    <br>
    <h3 class="w3-center"><b>Tasks</b></h3>
    <br>
    <br>
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
                    <c:choose>
                        <c:when test="${t.userId==u.id}">
                            <tr>
                                <td><h4>${t.id}</h4></td>
                                <td><h4>${t.name}</h4></td>
                                <c:if test="${t.status==1}">
                                    <td><h4>Not finished</h4></td>
                                </c:if>
                                <c:if test="${t.status==2}">
                                    <td><h4>Submitted by worker</h4></td>
                                </c:if>
                                <c:if test="${t.status==3}">
                                    <td><h4>Is done</h4></td>
                                </c:if>
                                <c:if test="${t.status==4}">
                                    <td><h4>Is failed</h4></td>
                                </c:if>
                                <td><h4>${u.login}</h4></td>
                                <c:if test="${t.status==2}">
                                    <form action="/edittask" method="post">
                                        <input type="hidden" value="${t.id}" name="id">
                                    <td><button type="submit" class="w3-button w3-teal w3-center">EDIT</button></td>
                                    </form>
                                </c:if>

                            </tr>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>

    </c:otherwise>
</c:choose>
<br>
<br>
<h3 class="w3-center"><b>My Tasks</b></h3>
<br>
<br>
<table class="w3-table-all w3-hoverable w3-centered w3-striped w3-border">
    <thead>
    <tr class="w3-light-grey">
        <th>ID</th>
        <th>Name</th>
        <th>Status</th>
        <th>User</th>
<c:forEach items="${allTasks}" var="t">
    <c:if test="${log_user.getId()==t.userId&&t.status==1||log_user.getId()==t.userId&&t.status==4}">
        <th>Edit</th>
    </c:if>
</c:forEach>
    </tr>
    </thead>

    <c:forEach items="${allTasks}" var="t">
        <c:if test="${log_user.getId()==t.userId}">
            <tr>

                <form action="/updateTaskUser" method="post">
                    <td><h4>${t.id}</h4></td>
                    <input type="hidden" name="taskId" value="${t.id}">
                    <td><h4>${t.name}</h4></td>
                    <input type="hidden" name="name" value="${t.name}">
                    <td><h4>${t.status}</h4></td>
                    <input type="hidden" name="status" value="${t.status}">
                    <td><h4>${log_user.getLogin()}</h4></td>
                    <input type="hidden" name="userId" value="${t.userId}">
                    <c:if test="${t.status!=2&&t.status!=3}">
                        <td> <button type="submit" class="w3-button w3-teal w3-center">SUBMIT</button></td>
                    </c:if>
                </form>
            </tr>
        </c:if>
    </c:forEach>

</table>
</body>
</html>
