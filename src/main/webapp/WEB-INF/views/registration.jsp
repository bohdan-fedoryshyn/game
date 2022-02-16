<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Registration</title>
    <style>

        .my-margin {
            margin-top: 20px;
        }

        .form-control {
            width: 400px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="#" class="navbar-brand">Registration</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">

        </div>
    </div>
</nav>


<div class=" d-flex justify-content-center">
    <form:form method="POST"
               action="/registration" modelAttribute="userDTO">

        <div class="col-auto">
            <label for="login" class="col-form-label">Name</label>
        </div>
        <div class="col-auto">
            <form:input type="text" path="login" id="login" class="form-control"/>
        </div>

        <div>
            <div class="col-auto">
                <label for="password" class="col-form-label">Password</label>
            </div>
            <div class="col-auto">
                <form:password path="password" id="password" class="form-control"/>
            </div>
        </div>

        <div>
            <div class="col-auto">
                <label for="passwordRepeat" class="col-form-label">Password Repeat</label>
            </div>
            <div class="col-auto">
                <form:password path="passwordRepeat" id="passwordRepeat" class="form-control"/>
            </div>
        </div>

        <div class="col-auto my-margin">
            <div class="col-sm-10 col-sm-offset-2">
                <button class="btn btn-primary" type="submit">Register</button>
            </div>
        </div>
    </form:form>

</div>

<%--<div class="header">--%>
<%--<div class="header-right">--%>
<%--<sec:authorize access="isAuthenticated()">--%>
<%--<a href="/logout">Logout</a>--%>
<%--</sec:authorize>--%>

<%--<sec:authorize access="hasRole('ROLE_ADMIN')">--%>
<%--<a href="/admin">Admin</a>--%>
<%--</sec:authorize>--%>

<%--<a href="/login">Login</a>--%>
<%--<a href="/registration">Registration</a>--%>
<%--</div>--%>

<%--</div>--%>
<%--<div class="container">--%>
<%--<div class="row">--%>

<%--<div class="d-flex justify-content-center">--%>
<%--<div class="col-auto">--%>
<%--<label for="a" class="col-form-label">Password</label>--%>
<%--</div>--%>
<%--<div class="col-auto">--%>
<%--<input type="password" id="a" class="form-control" aria-describedby="passwordHelpInline">--%>
<%--</div>--%>
<%--<div class="col-auto">--%>
<%--<span id="b" class="form-text">--%>
<%--Must be 8-20 characters long.--%>
<%--</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--<form>--%>
<%--<div class="mb-3">--%>
<%--<label for="exampleInputEmail1" class="form-label">Email address</label>--%>
<%--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">--%>
<%--<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>--%>
<%--</div>--%>
<%--<div class="mb-3">--%>
<%--<label for="exampleInputPassword1" class="form-label">Password</label>--%>
<%--<input type="password" class="form-control" id="exampleInputPassword1">--%>
<%--</div>--%>
<%--<div class="mb-3 form-check">--%>
<%--<input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--<label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
<%--</div>--%>
<%--<button type="submit" class="btn btn-primary">Submit</button>--%>
<%--</form>--%>
<%--<div class="col-sm-10 col-sm-offset-2"><form:errors path="checkPassword"/></div>--%>
<%--<label for="passwordRepeat" class="control-label">Password repeat</label>--%>
<%--</div>--%>

<%--</div>--%>

</body>

</html>