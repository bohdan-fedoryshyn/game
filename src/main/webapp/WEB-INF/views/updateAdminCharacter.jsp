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

        .my-margin-left {
            margin-left: 20px;
        }

        .image {
            width: 300px;
            height: 400px;
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
                    <a href="/admin/control/character" class="nav-item nav-link">Back</a>
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
               action="/admin/control/character/${character.name}/edit/name">
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
               action="/admin/control/character/${character.name}/edit/hp">
        <div class="col-auto my-margin-left">
            <label for="hp" class="col-form-label">HP</label>
        </div>

        <div class="col-auto">
            <input name="updateHp" type="text" id="hp" class="form-control"/>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form:form>

    <form:form class="row g-3 align-items-center" method="post"
               action="/admin/control/character/${character.name}/edit/mp">
        <div class="col-auto my-margin-left">
            <label for="mp" class="col-form-label">MP</label>
        </div>

        <div class="col-auto">
            <input name="updateMp" type="text" id="mp" class="form-control"/>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form:form>

    <form:form class="row g-3 align-items-center" method="post"
               action="/admin/control/character/${character.name}/edit/power">
        <div class="col-auto my-margin-left">
            <label for="power" class="col-form-label">Power</label>
        </div>

        <div class="col-auto">
            <input name="updatePower" type="text" id="power" class="form-control"/>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form:form>
</div>
<div class="my-margin d-flex justify-content-center">

    <form:form class="row g-3 align-items-center" method="post"
               action="/admin/control/character/${character.name}/edit/image"
               enctype="multipart/form-data">
        <div class="col-auto">
            <label for="file" class="col-form-label">Image</label>
        </div>

        <div class="col-auto">
            <input type="file" name="updateImage" id="file" class="col-form-label " accept="image/*"/>

        </div>

        <div class="col-auto ">
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
                    <td>${character.name}</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="col">Hp</th>
                    <td>${character.hp}</td>
                </tr>
                <tr>
                    <th scope="col">Mp</th>
                    <td>${character.mp}</td>
                </tr>
                <tr>
                    <th scope="col">Power</th>
                    <td>${character.power}</td>
                </tr>

                <tr>
                    <th scope="col">Image</th>
                    <td class="wid-tab"><img class="image" src="/images/characters/${character.image}"></td>
                </tr>


                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="my-margin d-flex justify-content-center">
    <div>
        <a href="/admin/control/character/${character.name}/delete">
            <button class="btn btn-danger" type="submit">Delete</button>
        </a>
    </div>
</div>

</body>
</html>