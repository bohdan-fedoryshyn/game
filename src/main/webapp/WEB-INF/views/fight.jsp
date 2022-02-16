<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RPG</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        .char_div {
            width: 400px;
            height: 500px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand">Fight</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="" class="nav-item nav-link ">${location.name}</a>
            </div>
            <div class="navbar-nav">
                <a href="/${hero.user.login}/hero/${hero.name}/lobby" class="nav-item nav-link ">Lobby</a>
            </div>
            <div class="navbar-nav ms-auto">
                <sec:authorize access="isAuthenticated()">
                    <a href="/logout" class="nav-item nav-link">Logout</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</nav>

<div style="height: 650px">

    <div style="position:absolute; width: 100%; height: 650px">
        <img style=" z-index: 1; position:relative; width: 100%; height: 650px; opacity: 80%;"
             src="/images/locations/${location.image}">
    </div>

    <div class="d-flex justify-content-start" style="position: absolute;">
        <div style=" z-index: 2;position: relative;">
            <p>${hero.character.name}</p>
            <p>${hero.currentHp}</p>
        </div>
    </div>

    <div class="d-flex justify-content-end">
        <div style=" z-index: 2;position: relative;">
            <p>${monster.name}</p>
            <p>${monster.currentHp}</p>
        </div>
    </div>

    <div style="position: absolute;">
        <img class="char_div" style="z-index: 2; position: relative; top: 50px;"
             src="/images/characters/${hero.character.image}">
    </div>

    <div class="d-flex justify-content-end">
        <img class="char_div" style="z-index: 2; position: relative; top: 50px;"
             src="/images/monsters/${monster.image}">
    </div>
</div>

<div class="d-flex justify-content-center">
    <form method="POST">
        <button class="btn btn-success btn-lg" name="choose" value="kick">Kick</button>
        <button class="btn btn-success btn-lg" name="choose" value="kick">Heal</button>
    </form>
</div>

</body>
</html>