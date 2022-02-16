<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .my-margin {
            margin-top: 20px;
        }
    </style>
    <title>Heroes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="" class="navbar-brand">Hero</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ">
                <a href="/${userName}/hero/create" class="nav-item nav-link">Create</a>
            </div>
            <div class="navbar-nav ms-auto">
                <sec:authorize access="isAuthenticated()">
                    <a href="/logout" class="nav-item nav-link">Logout</a>
                </sec:authorize>
            </div>

        </div>
    </div>
</nav>

<div class="my-margin d-flex justify-content-center">

    <form:form method="post" class="row g-3 align-items-center">

        <div class="col-auto">
            <label for="control" class="col-form-label">Hero</label>
        </div>

        <div class="col-auto">
            <select class="form-select" aria-label="Default select example" id="control" name="chooseHero">
                <option selected></option>
                <c:forEach var="hero" items="${heroes}">
                    <option value="${hero.name}">${hero.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Choose</button>
        </div>

    </form:form>

</div>

</body>

<script>
    function login() {
        fetch("/login")
            .then((res) => {
            if (res.status == 200 || res.status == 302) {
            return res.json()
        } else {
            throw Error(res.statusText)
        }
    })
    .then(data => {
            localStorage.setItem("token", data.token)
        logResponse("loginResponse", localStorage set with token value: ${data.token})
    })
    .catch(console.error)
    }
</script>
</html>