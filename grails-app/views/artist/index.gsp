<%--
  Created by IntelliJ IDEA.
  User: sergioandres
  Date: 14/05/2016
  Time: 4:50 AM
--%>

<%@ page import="discmaster.Artist" %>
<!DOCTYPE html>

<head>
    <meta name="layout" content="main">
</head>
<body>

<div class="row small-up-1 large-up-2">
    <g:each in="${Artist.list()}" status="i" var="artist">
        <div class="column">
            <g:link controller="artist" action="show" id="${artist.id}" title="Ver artista">

                <h5>${artist.name}</h5>
            </g:link>

        </div>
    </g:each>
</body>
