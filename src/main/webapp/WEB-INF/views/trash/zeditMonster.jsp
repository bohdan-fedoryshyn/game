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

<div class="row g-3 align-items-center">

    <form:form class="form-horizontal" method="POST"
               modelAttribute="monster">

        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <form:input path="name" type="text" class="form-control" id="name" placeholder="${monster.name}"/>
        </div>

        <div class="mb-3">
            <label for="hp" class="form-label">HP</label>
            <form:input path="hp" type="text" class="form-control" id="hp" placeholder="${monster.hp}"/>
        </div>

        <div class="mb-3">
            <label for="mp" class="form-label">MP</label>
            <form:input path="mp" type="text" class="form-control" id="mp" placeholder="${monster.mp}"/>
        </div>

        <div class="mb-3">
            <label for="power" class="form-label">Power</label>
            <form:input path="power" type="text" class="form-control" id="power" placeholder="${monster.power}"/>
        </div>

        <div class="mb-3">
            ${monster.location.name}
        </div>
        <c:forEach var="location" items="${locations}">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="choose" value="${location.name}" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    <tr>
                        <td>${location.name}</td>
                    </tr>
                </label>
            </div>

        </c:forEach>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
</div>

</body>
</html>