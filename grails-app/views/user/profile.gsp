<!DOCTYPE html>
<html>

<%@ page import="discmaster.User" contentType="text/html;charset=UTF-8" %>
<head>
	<meta name="layout" content="main">
    <title>Perfil</title>
</head>
<body>
<h1>Bienvenido(a)</h1>
<g:hasErrors bean="${User}">
    <div class="errors">
        <g:renderErrors bean="${user}"></g:renderErrors>
    </div>
</g:hasErrors>
<g:submitButton class="button" name="create" value="Informacion  Personal" action="profile"></g:submitButton> 
<g:submitButton class="button" name="create" value="Cambiar Contraseña"></g:submitButton>
 
<g:submitButton class="button" name="create" value="Mis compras"></g:submitButton> 
<g:form action="create">
    
  
    <div class="large-5 columns"><label for="realName">Nombre:
        <g:textField name="realName" value="${user?.realName}"></div></g:textField>
    	
    </label> 
    	
	<label for="phone">Telefono:
        <g:textField name="phone" value="${user?.phone}"></g:textField>
    </label>
    <label for="name">Nick:
        <g:textField name="name" value="${user?.name}"></g:textField>
    </label>
    <label for="email">Correo electrónico:
        <g:textField name="email" value="${user?.email}"></g:textField>
    </label>
    <g:submitButton class="button" name="create" value="Guardar"></g:submitButton>
    <g:submitButton class="button" name="create" value="Borrar cuenta"></g:submitButton>

</g:form>
</body>
</html>
