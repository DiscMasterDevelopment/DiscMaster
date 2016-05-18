
<%@ page import="discmaster.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>Lista de Usuarios</title>
	</head>
	<body>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1>Lista de Usuarios</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="name" title="${message(code: 'user.name.label', default: 'Nick')}" />
						<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Correo')}" />
						<g:sortableColumn property="phone" title="${message(code: 'user.phone.label', default: 'Telefono')}" />
						<g:sortableColumn property="realName" title="${message(code: 'user.realName.label', default: 'Nombre')}" />


					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${fieldValue(bean: userInstance, field: "name")}</td>

						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "email")}</g:link></td>

						<td>${fieldValue(bean: userInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "realName")}</td>


					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
