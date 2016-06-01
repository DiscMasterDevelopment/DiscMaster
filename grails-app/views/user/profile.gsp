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
        <g:renderErrors bean="${userInstance}"></g:renderErrors>
    </div>
</g:hasErrors>

<div class="row small-up-1 large-up-1">
  <div class="small-1 large-1 columns">
    <h1>Bienvenido(a) ${userInstance.name}</h1>
  </div>
</div>

<div class="row small-up-1 large-up-2">
  <div class="medium-1 columns">
    <h2>Tus datos personales</h2>

    <div class="row small-up-1 large-up-3">
        <div class="small-1 medium-1 columns"> <b>Nombre:</b> </div>
        <div class="small-1 medium-2 columns"> ${userInstance.realName} </div>
    </div>
    
    <div class="row small-up-1 large-up-3">
        <div class="small-1 medium-1 columns"> <b>Teléfono:</b> </div>
        <div class="small-1 medium-2 columns"> ${userInstance.phone} </div>
    </div>
    
    <div class="row small-up-1 large-up-3">
        <div class="small-1 medium-1 columns"> <b>E-mail:</b> </div>
        <div class="small-1 medium-2 columns"> ${userInstance.email} </div>
    </div>
    
    <div class="row small-up-1 large-up-3">
        <div class="small-1 medium-1 columns"> <b>Age:</b> </div>
        <div class="small-1 medium-2 columns"> ${userInstance.age} </div>
    </div>

      <g:form url="[resource:userInstance, action:'delete']" method="DELETE">
          <fieldset class="buttons">
              <g:link class="button" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
              <g:actionSubmit class="button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"  onclick="return confirm('Esta seguro de eliminar su cuenta?');" />
          </fieldset>
      </g:form>

  </div>
  
  <div class="medium-1 columns">
    <a class="button alert" href="#">Informacion  Personal</a>
    <a class="button" href="#">Cambiar Contraseña</a>
    <a class="button" href="#">Mis compras</a>
  </div>

<g:if test="${session?.admin}">
    <fieldset class="buttons">
        <g:link class="button" controller="product" action="register" >Agregar Producto</g:link>
        <g:link controller="user" action="index" id="${product.id}" title="Lista Usuarios">Lista Usuario</g:link>

    </fieldset>
</g:if>
</div>
</body>
</html>
