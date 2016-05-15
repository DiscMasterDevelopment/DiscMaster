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

<div class="row small-up-2 large-up-1">
    <g:each in="${Artist.list()}" status="i" var="artist">
        <div class="column">
            <g:link controller="artist" action="show" id="${artist.id}" title="Ver artista">

                <h3>${artist.name}</h3>
            </g:link>

        </div>
    </g:each>
</body>
</html>>