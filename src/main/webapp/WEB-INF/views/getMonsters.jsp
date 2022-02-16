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
    <title>Monsters</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="" class="navbar-brand">Monster</a>
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

<div class="my-margin">
    <div class="my-margin d-flex justify-content-center">
        <form:form enctype="multipart/form-data" class="row g-3 align-items-center" method="post" modelAttribute="monster">
        <div class="col-auto">
            <label for="name" class="col-form-label">Name</label>
        </div>
        <div class="col-auto">
            <form:input path="name" type="text" id="name" class="form-control"/>
        </div>
        <div class="col-auto">
            <label for="hp" class="col-form-label">HP</label>
        </div>
        <div class="col-auto">
            <form:input path="hp" type="text" id="hp" class="form-control"/>
        </div>
        <div class="col-auto">
            <label for="mp" class="col-form-label">MP</label>
        </div>
        <div class="col-auto">
            <form:input path="mp" type="text" id="mp" class="form-control"/>
        </div>
        <div class="col-auto">
            <label for="power" class="col-form-label">Power</label>
        </div>
        <div class="col-auto">
            <form:input path="power" type="text" id="power" class="form-control"/>
        </div>
        <div class="col-auto">
            <label for="location" class="col-form-label">Location</label>
        </div>
        <div class="col-auto">
            <select class="form-select" aria-label="Default select example" id="location" name="chooseLocation">
                <option selected></option>
                <c:forEach var="location" items="${locations}">
                    <option value="${location.name}">${location.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="my-margin d-flex justify-content-center">

        <div class="col-auto">
            <label for="file" class="col-form-label">Image</label>
        </div>

        <div class="col-auto">
            <input name="file" type="file" id="file" class="col-form-label" accept="image/*"/>
        </div>

        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
    </form:form>


</div>

<div class="container my-margin">
    <div class="row">
        <div class="col-sm-12">
            <table class="table table-dark" width="">

                <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="monster" items="${monsters}">
                    <tr>
                        <td>${monster.name}</td>
                        <td>
                            <div>
                                <a href="/admin/control/monster/${monster.name}/edit">
                                    <button class="btn btn-primary" type="submit">Edit</button>
                                </a>
                            </div>
                        </td>
                        <td>
                            <div>
                                <a href="/admin/control/monster/${monster.name}/delete">
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

<script>
    document.getElementById('hider').onclick = function () {
        document.getElementById('config-btn').classList.toggle('hidden');
    }
</script>
</body>
</html>