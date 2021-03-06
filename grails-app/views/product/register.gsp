<!DOCTYPE html>
<html>

<%@ page import="discmaster.Product" contentType="text/html;charset=UTF-8" %>
<head>
	<meta name="layout" content="main">
	<title>Agregar Producto</title>
</head>
<body>
<h1>Nuevo Producto</h1>
<g:hasErrors bean="${Product}">
	<div class="errors">
		<g:renderErrors bean="${product}"></g:renderErrors>
	</div>
</g:hasErrors>
<g:form action="create">
	<label for="name">Nombre:
		<g:textField name="name" required="" value="${params?.name}"></g:textField>
	</label>
	<label for="price">Precio:
		<g:textField type="number" name="price" required="" value="${params?.price}"></g:textField>
	</label>
	<label for="totalInStorage">Total en bodega:
		<g:textField type="number" name="totalInStorage" required="" value="${params?.totalInStorage}"></g:textField>
	</label>
	<label for="discount">Descuento:
		<g:textField type="number" min="0" max="100" name="discount" required="" value="${params?.discount}"></g:textField>
	</label>
	<label for="limitPerUser">Limite por cliente:
		<g:textField name="limitPerUser" required="" value="${params?.limitPerUser}"></g:textField>
	</label>
	<label for="shortDescription">Descripcion corta:
		<g:textField name="shortDescription" required="" value="${params?.shortDescription}"></g:textField>
	</label>
	<label for="description">Descripcion larga:
		<g:textArea name="description" required="" value="${params?.description}"></g:textArea>
	</label>

	<label for="videoClip">ID del video de youtube:
		<g:textField name="videoClip" value="${params?.videoClip}"></g:textField>
	</label>

	<label for="audioClip">URL souncloud del audio:
		<g:textField name="audioClip" value="${params?.audioClip}"></g:textField>
	</label>

	<label for="tag">Tag:
		<g:select required="" name="tag" from="${discmaster.Tag.list()}" multiple="multiple" optionKey="id" size="5" optionValue="tag" value="${productInstance?.tag*.id}" class="many-to-many"/>
	</label>
	<g:submitButton class="button" name="crear"  value="Crear"></g:submitButton>
</g:form>
</body>
</html>