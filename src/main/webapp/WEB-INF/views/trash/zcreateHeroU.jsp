<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Hello Admin</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="#" class="navbar-brand">Hero</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="/heroes/create" class="nav-item nav-link ">Create</a>
                <a href="/heroes/get" class="nav-item nav-link">Get</a>

            </div>
            <div class="navbar-nav ms-auto">
                <a href="/login" class="nav-item nav-link">Login</a>
            </div>
            <a href="/heroes/control">back</a>
        </div>
    </div>
</nav>

<div class="row g-3 align-items-center">

    <form:form class="form-horizontal" method="POST"
               modelAttribute="heroDTO">

        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <form:input path="name" type="text" class="form-control" id="name"/>
        </div>

        <c:forEach var="characterDTO" items="${charactersDTO}">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="chooseCharacter" value="${characterDTO.name}"
                       id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    <tr>
                        <td>${characterDTO.name}</td>
                    </tr>
                </label>
            </div>

        </c:forEach>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
</div>

</body>
</html>