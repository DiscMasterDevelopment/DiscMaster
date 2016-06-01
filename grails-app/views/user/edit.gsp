<%@ page import="discmaster.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:userInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
						<label for="name">
							<g:message code="user.name.label" default="Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="name" required="" value="${userInstance?.name}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
						<label for="email">
							<g:message code="user.email.label" default="Email" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="email" required="" value="${userInstance?.email}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'phone', 'error')} ">
						<label for="phone">
							<g:message code="user.phone.label" default="Phone" />

						</label>
						<g:textField name="phone" value="${userInstance?.phone}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'realName', 'error')} ">
						<label for="realName">
							<g:message code="user.realName.label" default="Real Name" />

						</label>
						<g:textField name="realName" value="${userInstance?.realName}"/>

					</div>

				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="button" action="update" value="${message(code: 'default.button.update.label', default: 'Actualizar')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
