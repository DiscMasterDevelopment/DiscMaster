<!DOCTYPE html>
<html>

<%@ page import="discmaster.User" contentType="text/html;charset=UTF-8" %>
<head>
	<meta name="layout" content="main">
	<title>Registrarse</title>
	<asset:javascript src="application.js"/>
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
	<label for="password">ContraseÃ±a:
	<g:passwordField name="password" minlength="8" maxlength="15" required="" value="${user?.password}"></g:passwordField>
	</label>
	<label for="confirm">Confirmar contraseÃ±a:
	<g:passwordField name="confirm" required="" value="${params?.confirm}"></g:passwordField>
	</label>
	<label for="realName">Nombre:
	<g:textField name="realName" required="" value="${user?.realName}"></g:textField>
	</label>
	<label for="age">Edad:
	<g:select name="age" from="${18..99}" noSelection="['':'Elige tu edad']" required="" value="${user?.age}"></g:select>
	</label>
	<label for="email">Correo electrÃ³nico:
	<g:textField name="email" required="" value="${user?.email}"></g:textField>
	</label>
	<label for="phone">Telefono:
	<g:textField name="phone" pattern="[0-9]{10}" required="" value="${user?.phone}"></g:textField>
	</label>
	<g:submitButton class="button" name="create" required="" value="Register"></g:submitButton>


<div class="page-header">
	<h1>Login on Facebook </h1>
</div>
<div class="row">
	<div class="span12">
		<g:if test="${!facebookContext.app.id}">

			<g:render template="/website/configError" />

		</g:if>
		<g:else>

			<facebook:initJS appId="${facebookContext.app.id}">
				// Put here any JS code to be executed after Facebook JS initialization
			</facebook:initJS>

			<g:if test="${!facebookContext.authenticated}">

				<p>
					<facebook:loginLink appPermissions="${facebookContext.app.permissions}" elementClass="large primary btn">Login</facebook:loginLink>
				</p>
			</g:if>
			<g:else>
				<h2 class="tab">Permissions</h2>
				<ul class="permissions">
					<g:each in="${permissions}" var="permission">
						<li>
							${permission.permission} (${permission.status})
						</li>
					</g:each>
				</ul>

			</g:else>
			<p>&nbsp;</p>
		</g:else>
		<p>&nbsp;</p>
		<h2 class="tab">Facebook Dialogs</h2>
		<script type="text/javascript">

			function publish_callback(response) {if (response && response.success) alert('Published successfully')};
			function send_callback(response) {if (response && response.success) alert('Sent successfully')};
			function share_callback(response) {if (response && response.success) alert('Shared successfully')};
		</script>

		<facebook:publishLink callback="publish_callback" elementClass="btn">Publicar </facebook:publishLink>
		<facebook:shareLink callback="share_callback" elementClass="btn" href="https://discmaster.herokuapp.com/ ">Compartir con mis amigos</facebook:shareLink>
		<facebook:sendLink callback="send_callback" elementClass="btn" link="https://discmaster.herokuapp.com/ " to= "100000749042528">Enviar Link a un amigo</facebook:sendLink>


	</div>
</div>



</g:form>

</body>
</html>
