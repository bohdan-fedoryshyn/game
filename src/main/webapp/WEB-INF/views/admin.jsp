<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .my-margin {
            margin-top: 20px;
        }
    </style>
    <title>Admin Control</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="" class="navbar-brand">Admin</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
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
            <label for="control" class="col-form-label">Control</label>
        </div>
        <div class="col-auto">
            <select class="form-select" name="choose" id="control">
                <option selected></option>
                <option value="character">Character</option>
                <option value="hero">Hero</option>
                <option value="location">Location</option>
                <option value="monster">Monster</option>
            </select>
        </div>

        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>

    </form:form>
</div>
</body>
</html>