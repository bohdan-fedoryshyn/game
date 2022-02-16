<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Hello Admin</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="#" class="navbar-brand">Choose Location</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
                <%--<a href="/monster/create" class="nav-item nav-link "></a>--%>
            </div>
            <div class="navbar-nav ms-auto">
                <sec:authorize access="isAuthenticated()">
                    <a href="/logout" class="nav-item nav-link">Logout</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</nav>

<div class="container" >
    <div class="row">
        <div class="col-sm-12">

            <form:form modelAttribute="locationDTO" method="post" class="form-horizontal">
                <table class="table table-dark">
                    <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Choose</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="locationDTO" items="${locationsDTO}">

                        <tr>
                            <th scope="row">${locationDTO.name}</th>
                            <td>
                                <div>
                                    <input class="form-check-input" type="checkbox" name="chooseLocation"
                                           value="${locationDTO.name}"
                                           id="flexCheckDefault">
                                </div>
                            </td>
                        </tr>


                        <%--<div class="form-check">--%>
                            <%--<input class="form-check-input" type="checkbox" name="chooseLocation"--%>
                                   <%--value="${locationDTO.name}" id="flexCheckDefault">--%>
                            <%--<label class="form-check-label" for="flexCheckDefault">--%>
                                <%--<tr>--%>
                                    <%--<td>${locationDTO.name}</td>--%>
                                <%--</tr>--%>
                            <%--</label>--%>
                        <%--</div>--%>

                    </c:forEach>
                    </tbody>

                </table>
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>