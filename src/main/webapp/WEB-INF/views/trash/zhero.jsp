<%--<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>

<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>--%>


<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
    <%--<title>Hello Admin</title>--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
          <%--integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <%--<style>--%>
        <%--.header-right {--%>
            <%--float: right;--%>
        <%--}--%>

        <%--.header {--%>
            <%--padding: 20px;--%>
            <%--background: lightslategrey;--%>
            <%--overflow: hidden;--%>

        <%--}--%>

        <%--.header a {--%>
            <%--padding: 10px;--%>
            <%--color: black;--%>
            <%--text-decoration: none;--%>
            <%--font-family: Arial;--%>
        <%--}--%>

        <%--body {--%>
            <%--margin: 0;--%>
        <%--}--%>

        <%--.header a:hover {--%>
            <%--background: #ddd;--%>
            <%--color: black;--%>
        <%--}--%>

        <%--.container {--%>
            <%--margin-top: 20px;--%>
        <%--}--%>
    <%--</style>--%>
<%--</head>--%>
<%--<body>--%>
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
<%--<div class="container">--%>

    <%--<div class="row">--%>
        <%--<div class="col-sm-8 col-sm-offset-2">--%>
            <%--&lt;%&ndash;<form:form action="/getHero" method="get" modelAttribute="hero">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<h2>${hero.name}</h2>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</form:form>&ndash;%&gt;--%>

                <%--<c:forEach var="hero" items="${heroes}">--%>
                    <%--<tr>--%>
                        <%--<td>${hero.name}</td>--%>
                    <%--</tr>--%>
                <%--</c:forEach>--%>
            <%--<form:form class="form-horizontal" action="/hero/create" method="post" modelAttribute="heroDTO">--%>
                <%--<div class="form-group">--%>
                    <%--<label for="name" class="control-label col-sm-2">Hero name:</label>--%>
                    <%--<div class="col-sm-10">--%>
                        <%--<form:input path="name" class="form-control" id="name"/>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="form-group">--%>
                    <%--<label for="character" class="control-label col-sm-2">Character:</label>--%>
                    <%--<div class="col-sm-10">--%>
                        <%--<form:input path="character" class="form-control" id="character"/>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<label for="heroClass.heroId" class="control-label col-sm-2">heroClass:</label>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="col-sm-10">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<form:select path="heroClass.heroId"/>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<label for="user" class="control-label col-sm-2">user:</label>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="col-sm-10">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<form:select path="user" items="${roles}"/>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>


                <%--<div class="form-group">--%>
                <%--<div class="col-sm-10 col-sm-offset-2">--%>
                    <%--<button class="btn btn-success" type="submit">create</button>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--</form:form>--%>
        <%--</div>--%>
    <%--</div>--%>

<%--</div>--%>


<%--</body>--%>
<%--</html>--%>