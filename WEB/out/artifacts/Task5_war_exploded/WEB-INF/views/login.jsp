<%--
  Created by IntelliJ IDEA.
  User: Roma
  Date: 21.11.2018
  Time: 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
    </style>
</head>

<body class="w3-theme-l5">
<div class="w3-row-padding">
    <div class="w3-col m12">
        <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
                <h6 class="w3-opacity"><span class="w3-tag w3-opacity"><a href="/">REGISTRATION</a></span>LOG IN FORM</h6>


<form action="/loginuser" method="post" class="w3-container w3-card w3-padding-32 w3-white">
    LOGIN : <input type="text" name="login">
    <br><br>
    PASSWORD : <input type="password" name="password">
    <br><br>
    <br><br>
    <button type="submit" class="w3-button w3-teal w3-right">LOGIN</button>
</form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
