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
            <div class="navbar-nav ms-auto">
                <div class="navbar-nav">
                    <a href="/admin/control" class="nav-item nav-link">Back</a>
                </div>
                <sec:authorize access="isAuthenticated()">
                    <a href="/logout" class="nav-item nav-link">Logout</a>
                </sec:authorize>
            </div>

        </div>
    </div>
</nav>


<div class="my-margin d-flex justify-content-center">


    <form:form class="row g-3 align-items-center" method="post" modelAttribute="hero">
        <div class="col-auto">
            <label for="name" class="col-form-label">Name</label>
        </div>
        <div class="col-auto">
            <form:input path="name" type="text" id="name" class="form-control"/>
        </div>
        <div class="col-auto">
            <label for="character" class="col-form-label">Character</label>
        </div>

        <div class="col-auto">
            <select class="form-select" aria-label="Default select example" id="character" name="chooseCharacter">
                <option selected>${hero.character.name}</option>
                <c:forEach var="character" items="${characters}">
                    <option value="${character.name}">${character.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-auto">
            <label for="character" class="col-form-label">User</label>
        </div>

        <div class="col-auto">
            <select class="form-select" aria-label="Default select example" name="chooseUser">
                <option selected>${hero.user.login}</option>
                <c:forEach var="user" items="${users}">
                    <option value="${user.login}">${user.login}</option>
                </c:forEach>
            </select>
        </div>


        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Create</button>
        </div>

    </form:form>


</div>

<div class="container my-margin">
    <div class="row">
        <div class="col-sm-12">
            <table class="table table-dark">

                <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="hero" items="${heroes}">
                    <tr>
                        <td>${hero.name}</td>


                        <td>
                            <div>
                                <a href="/admin/control/hero/${hero.name}/edit">
                                    <button class="btn btn-primary" type="submit">Edit</button>
                                </a>
                            </div>
                        </td>
                        <td>
                            <div>
                                <a href="/admin/control/hero/delete/${hero.name}">
                                    <button class="btn btn-danger" type="submit">Delete</button>
                                </a>
                            </div>
                        </td>

                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>