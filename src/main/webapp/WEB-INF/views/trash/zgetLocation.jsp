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

<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <table class="table table-dark">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">${locationDTO.id}</th>
                    <td>${locationDTO.name}</td>
                    <td>
                        <div>
                            <a href="/locations/delete/${locationDTO.id}">
                                <button class="btn btn-danger" type="submit">Delete</button>
                            </a>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <%--<div class="row">--%>
    <%--<div class="col-sm-8 col-sm-offset-2">--%>
    <%--<form:form class="form-horizontal" action="/addLocation" method="post">--%>
    <%--<div class="form-group">--%>
    <%--<label for="locationName" class="control-label col-sm-2">Location name:</label>--%>
    <%--<div class="col-sm-10">--%>
    <%--<input type="text" name="locationName" id="locationName" class="form-control"/>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
    <%--<div class="col-sm-10 col-sm-offset-2">--%>
    <%--<button class="btn btn-success" type="submit">add Location</button>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</form:form>--%>
    <%--</div>--%>
    <%--</div>--%>
</div>


</body>
</html>