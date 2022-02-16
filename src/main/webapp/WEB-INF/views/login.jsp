<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Login</title>
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
        <a href="#" class="navbar-brand">Login</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">

            <div class="navbar-nav ms-auto">

                <a href="/registration" class="nav-item nav-link">Registration</a>

            </div>
        </div>
    </div>
</nav>

<div class=" d-flex justify-content-center">
    <form:form method="POST" action="/login">
    <div class="col-auto">
        <label for="login" class="col-form-label">Login</label>
    </div>
    <div class="col-auto">
        <input type="text" name="login" id="login" class="form-control"/>
    </div>
    <div>
        <div class="col-auto">
            <label for="password" class="col-form-label">Password</label>
        </div>
        <div class="col-auto">
            <input type="password" name="password" id="password" class="form-control"/>
        </div>
    </div>
    <div>

        <div class="col-auto my-margin">
            <div class="checkbox">
                <label><input type="checkbox" name="rememberMe"/> Remember me</label>
            </div>
        </div>
    </div>


    <div class="col-auto my-margin my-margin">
        <div class="col-sm-10 col-sm-offset-2">
            <button class="btn btn-primary" type="submit">Login</button>
        </div>
    </div>
    </form:form>


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
    <%--</div>--%>
    <%--<div class="container">--%>
    <%--<div class="row">--%>
    <%--<div class="col-sm-8 col-sm-offset-2">--%>
    <%--<form:form class="form-horizontal" action="/login" method="POST">--%>
    <%--<div class="form-group">--%>
    <%--<label for="name" class="control-label col-sm-2">Email or phone:</label>--%>
    <%--<div class="col-sm-10">--%>
    <%--<input type="text" name="login" id="name" class="form-control"/>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
    <%--<label for="password" class="control-label col-sm-2">Password:</label>--%>
    <%--<div class="col-sm-10">--%>
    <%--<input type="password" name="password" id="password" class="form-control"/>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
    <%--<div class="col-sm-offset-2 col-sm-10">--%>
    <%--<div class="checkbox">--%>
    <%--<label><input type="checkbox" name="rememberMe"/> Remember me</label>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
    <%--<div class="col-sm-10 col-sm-offset-2">--%>
    <%--<button class="btn btn-success" type="submit">Sing in</button>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</form:form>--%>
    <%--<a href="/registration"> registration</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
</body>
</html>