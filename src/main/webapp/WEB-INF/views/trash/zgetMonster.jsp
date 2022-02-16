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

<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <table class="table table-dark">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">HP</th>
                    <th scope="col">MP</th>
                    <th scope="col">Power</th>
                    <th scope="col">Location</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">${monsterDTO.id}</th>
                    <td>${monsterDTO.name}</td>
                    <td>${monsterDTO.hp}</td>
                    <td>${monsterDTO.mp}</td>
                    <td>${monsterDTO.power}</td>
                    <td>${monsterDTO.location.name}</td>
                    <td>
                        <div>
                            <a href="/monsters/delete/${monsterDTO.id}">
                                <button class="btn btn-danger" type="submit">Delete</button>
                            </a>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>