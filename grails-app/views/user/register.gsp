<!DOCTYPE html>
<html>

<%@ page import="discmaster.User" contentType="text/html;charset=UTF-8" %>
<head>
	<meta name="layout" content="main">
    <title>Registrarse</title>
</head>
<body>
<h1>Registro</h1>
<g:hasErrors bean="${User}">
    <div class="errors">
        <g:renderErrors bean="${user}"></g:renderErrors>
    </div>
</g:hasErrors>
<g:form action="create">
    <label for="name">Nick:
        <g:textField name="name" value="${user?.name}"></g:textField>
    </label>
    <label for="password">Contraseña:
        <g:passwordField name="password" value="${user?.password}" type="password"></g:passwordField>
    </label>
    <label for="confirm">Confirmar contraseña:
        <g:passwordField name="confirm" value="${params?.confirm}" type="password"></g:passwordField>
    </label>
    <label for="realName">Nombre:
        <g:textField name="realName" value="${user?.realName}"></g:textField>
    </label>
    <label for="email">Correo electrónico:
        <g:textField name="email" value="${user?.email}"></g:textField>
    </label>
    <label for="phone">Telefono:
        <g:textField name="phone" value="${user?.phone}"></g:textField>
    </label>
    <g:submitButton class="button" name="create" value="Register"></g:submitButton>
</g:form>
</body>
</html>
