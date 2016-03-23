<!DOCTYPE html>
<html>

<%@ page import="discmaster.User" contentType="text/html;charset=UTF-8" %>
<head>
    <title>Registrarse</title>
</head>
<body id="body">
<h1>Registro</h1>
<g:hasErrors bean="${User}">
    <div class="errors">
        <g:renderErrors bean="${user}"></g:renderErrors>
    </div>
</g:hasErrors>
<g:form action="create" name="createForm">
    <div class="formField">
        <label for="name">Nick:</label>
        <g:textField name="name" value="${user?.name}"></g:textField>
    </div>
    <div class="formField">
        <label for="password">Contraseña:</label>
        <g:passwordField name="password" value="${user?.password}"></g:passwordField>
    </div>
    <div class="formField">
        <label for="confirm">Confirmar contraseña:</label>
        <g:passwordField name="confirm" value="${params?.confirm}"></g:passwordField>
    </div>
    <div class="formField">
        <label for="realName">Nombre:</label>
        <g:textField name="realName" value="${user?.realName}"></g:textField>
    </div>
    <div class="formField">
        <label for="email">Correo electronico:</label>
        <g:textField name="email" value="${user?.email}"></g:textField>
    </div>
    <div class="formField">
        <label for="phone">Telefono:</label>
        <g:textField name="phone" value="${user?.phone}"></g:textField>
    </div>
    <g:submitButton class="formButton" name="create" value="Regisster"></g:submitButton>
</g:form>
</body>
</html>
