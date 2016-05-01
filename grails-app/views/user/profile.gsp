<!DOCTYPE html>
<html>

<%@ page import="discmaster.User" contentType="text/html;charset=UTF-8" %>
<head>
	<meta name="layout" content="main">
    <title>Perfil</title>
</head>
<body>
<g:hasErrors bean="${User}">
    <div class="errors">
        <g:renderErrors bean="${user}"></g:renderErrors>
    </div>
</g:hasErrors>

<div class="row small-up-1 large-up-1">
  <div class="small-1 large-1 columns">
    <h1>Bienvenido(a) ${session?.user.name}</h1>
  </div>
</div>

<div class="row small-up-1 large-up-2">
  <div class="medium-1 columns">
    <h2>Tus datos personales</h2>

    <div class="row small-up-1 large-up-3">
        <div class="small-1 medium-1 columns"> <b>Nombre:</b> </div>
        <div class="small-1 medium-2 columns"> ${session.user?.realName} </div>
    </div>
    
    <div class="row small-up-1 large-up-3">
        <div class="small-1 medium-1 columns"> <b>Teléfono:</b> </div>
        <div class="small-1 medium-2 columns"> ${session.user?.phone} </div>
    </div>
    
    <div class="row small-up-1 large-up-3">
        <div class="small-1 medium-1 columns"> <b>E-mail:</b> </div>
        <div class="small-1 medium-2 columns"> ${session.user?.email} </div>
    </div>
    
    <div class="row small-up-1 large-up-3">
        <div class="small-1 medium-1 columns"> <b>Age:</b> </div>
        <div class="small-1 medium-2 columns"> ${session.user?.age} </div>
    </div>
    
    <a class="button" href="#">Modificar cuenta</a>
    <a class="button" href="#">Borrar cuenta</a>
  </div>
  
  <div class="medium-1 columns">
    <a class="button alert" href="#">Informacion  Personal</a> 
    <a class="button" href="#">Cambiar Contraseña</a>
    <a class="button" href="#">Mis compras</a> 
  </div>
</div>

<%--

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

</g:form>
--%>
</body>
</html>
