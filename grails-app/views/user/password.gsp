<!DOCTYPE html>
<html>
<%@ page import="discmaster.User" contentType="text/html;charset=UTF-8" %>
<head>
	<meta name="layout" content="main">
    <title>Perfil</title>
</head>
<body>
<h1>Cambiar contraseña</h1>

</g:hasErrors>
<g:form action="cambiar">
    <label for="password">Contraseña:
        <g:passwordField name="password" value="${user?.password}"></g:passwordField>
    </label>
    <label for="confirm">Confirmar contraseña:
        <g:passwordField name="confirm" value="${params?.confirm}"></g:passwordField>
    </label>
    <g:submitButton class="button" name="create" value="Guardar"></g:submitButton>
</g:form>
</body>
</html>
