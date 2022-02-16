<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .container {
            margin-top: 20px;
        }
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
    <title>Hello Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="#" class="navbar-brand">Lobby</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="/${hero.user.login}/hero/${hero.name}/location/choose" class="nav-item nav-link ">Choose Location</a>
            </div>

            <div class="navbar-nav ms-auto">
                <sec:authorize access="isAuthenticated()">
                    <a href="/logout" class="nav-item nav-link">Logout</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <table class="table table-dark">
                <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Character</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${hero.name}</td>
                    <td>${hero.character.name}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>