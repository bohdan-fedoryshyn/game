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

        .my-margin-left{
            margin-left: 20px;
        }

        .image {
            width: 400px;
            height: 150px;
        }
        .wid-tab{
            width: 600px;
        }

    </style>
    <title>Characters</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="" class="navbar-brand">Character</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto">
                <div class="navbar-nav">
                    <a href="/admin/control/location" class="nav-item nav-link">Back</a>
                </div>
                <sec:authorize access="isAuthenticated()">
                    <a href="/logout" class="nav-item nav-link">Logout</a>
                </sec:authorize>
            </div>

        </div>
    </div>
</nav>


<div class="my-margin d-flex justify-content-center">
    <form:form class="row g-3 align-items-center" method="post"
               action="/admin/control/location/${location.name}/edit/name">
        <div class="col-auto">
            <label for="name" class="col-form-label">Name</label>
        </div>
        <div class="col-auto">
            <input name="updateName" type="text" id="name" class="form-control"/>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form:form>

    <form:form class="row g-3 align-items-center" method="post"
               action="/admin/control/location/${location.name}/edit/image"
               enctype="multipart/form-data">
        <div class="col-auto my-margin-left">
            <label for="file" class="col-form-label">Image</label>
        </div>

        <div class="col-auto">
            <input type="file" name="updateImage" id="file" class="col-form-label " accept="image/*"/>

        </div>

        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form:form>


</div>

<div class="container my-margin my-table">

    <div class="row ">
        <div class="col-sm-12">
            <table class="table table-dark ">

                <thead>
                <tr>
                    <th scope="col">Name</th>
                    <td class="wid-tab">${location.name}</td>
                </tr>

                </thead>
                <tbody>
                <tr>
                    <th scope="col">Image</th>
                    <td class="wid-tab"><img class="image" src="/images/locations/${location.image}"></td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="my-margin d-flex justify-content-center">
    <div>
        <a href="/admin/control/location/${location.name}/delete">
            <button class="btn btn-danger" type="submit">Delete</button>
        </a>
    </div>
</div>

</body>
</html>