<%--
  Created by IntelliJ IDEA.
  User: sergioandres
  Date: 14/05/2016
  Time: 4:50 AM
--%>

<%@ page import="discmaster.Artist" %>
<!DOCTYPE html>

<html>
<head>
    <meta name="layout" content="main">
</head>
<body>

<div class="row column text-center">
    <h2>Bandas</h2>
    <hr>
</div>

<div class="row small-up-1 medium-up-2 large-up-3">
    <g:each in="${Artist.list()}" status="i" var="artist">
        <div class="column">

            <g:link controller="artist" action="show" id="${artist.id}" title="Ver artista">
                <div class="row small-up-2 large-up-2">
                    <div class="column">
                        <h3>${artist.name}</h3>
                        <p>${artist.description.shortDescription}</p>
                    </div>
                    <div class="column">
                        <discmaster:artistImg artist="${artist}" class="image" width="360px"/>
                    </div>
                </div>
            </g:link>

        </div>
    </g:each>
</body>
</html>
