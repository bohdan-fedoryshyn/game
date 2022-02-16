<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello world!</title>
    <style>
        .header-right {
            float: right;
        }

        .header {
            padding: 20px;
            background: lightslategrey;
            overflow: hidden;

        }

        .header a {
            padding: 10px;
            color: black;
            text-decoration: none;
            font-family: Arial;
        }

        body {
            margin: 0;
        }

        .header a:hover {
            background: #ddd;
            color: black;
        }
    </style>
</head>
<body>
<%--<h2 class="hello-title">Hello world!</h2>--%>
<div class="header">
    <div class="header-right">
        <sec:authorize access="isAuthenticated()">
            <a href="/logout">Logout</a>
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <a href="/admin">Admin</a>
        </sec:authorize>

        <a href="/login">Login</a>
        <a href="/registration">Registration</a>
    </div>

</div>


</body>
</html>