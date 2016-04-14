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
        <g:textField name="name" minlength="3" maxlength="20" required="" value="${user?.name}"></g:textField>
    </label>
    <label for="password">Contraseña:
        <g:passwordField name="password" minlength="8" maxlength="15" required="" value="${user?.password}"></g:passwordField>
    </label>
    <label for="confirm">Confirmar contraseña:
        <g:passwordField name="confirm" required="" value="${params?.confirm}"></g:passwordField>
    </label>
    <label for="realName">Nombre:
        <g:textField name="realName" required="" value="${user?.realName}"></g:textField>
    </label>
    <label for="age">Edad:
    <g:select name="age" from="${18..99}" noSelection="['':'Elige tu edad']" required="" value="${user?.age}"></g:select>
    </label>
    <label for="email">Correo electrónico:
        <g:textField name="email" required="" value="${user?.email}"></g:textField>
    </label>
    <label for="phone">Telefono:
        <g:textField name="phone" pattern="[0-9]{10}" required="" value="${user?.phone}"></g:textField>
    </label>
    <g:submitButton class="button" name="create" required="" value="Register"></g:submitButton>
</g:form>
</body>
</html>
