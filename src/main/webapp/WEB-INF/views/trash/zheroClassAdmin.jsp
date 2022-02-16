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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="header">
    <div class="header-right">
        <sec:authorize access="isAuthenticated()">
            <a href="/logout">Logout</a>
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <a href="/admin">Admin</a>
        </sec:authorize>

        <a href="/login">Login</a>
        <a href="/registration">Registration</a>
    </div>

</div>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <table class="table table-bordered">
                <tr>
                    <th>Name</th>
                    <th>HP</th>
                    <th>MP</th>
                </tr>
                <c:forEach var="heroClass" items="${heroClasses}">

                    <tr>
                        <td>${heroClass.heroName}</td>
                        <td>${heroClass.heroHp}</td>
                        <td>${heroClass.heroMp}</td>
                            <%--<td>--%>
                            <%--<div>--%>
                            <%--<a href="/location/delete/${location.locationId}">--%>
                            <%--<button class="btn btn-danger" type="submit">Delete</button>--%>
                            <%--</a>--%>
                            <%--</div>--%>
                            <%--</td>--%>

                    </tr>

                </c:forEach>
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