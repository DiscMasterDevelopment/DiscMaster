<%@ page import="discmaster.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Producto')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-product" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${productInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${productInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:productInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${productInstance?.version}" />
				<fieldset class="form">

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
						<label for="name">
							<g:message code="product.name.label" default="Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="name" required="" value="${productInstance?.name}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'price', 'error')} required">
						<label for="price">
							<g:message code="product.price.label" default="Price" />
							<span class="required-indicator">*</span>
						</label>
						<g:field name="price" type="number" value="${fieldValue(bean: productInstance, field: 'price')}" required=""/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'discount', 'error')} required">
						<label for="discount">
							<g:message code="product.discount.label" default="Discount" />
							<span class="required-indicator">*</span>
						</label>
						<g:field name="discount" type="number" value="${fieldValue(bean: productInstance, field: 'discount')}" required=""/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'totalInStorage', 'error')} required">
						<label for="totalInStorage">
							<g:message code="product.totalInStorage.label" default="Total In Storage" />
							<span class="required-indicator">*</span>
						</label>
						<g:field name="totalInStorage" type="number" min="0" value="${productInstance.totalInStorage}" required=""/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'limitPerUser', 'error')} required">
						<label for="limitPerUser">
							<g:message code="product.limitPerUser.label" default="Limit Per User" />
							<span class="required-indicator">*</span>
						</label>
						<g:field name="limitPerUser" type="number" value="${productInstance.limitPerUser}" required=""/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} required">
						<label for="description">
							<g:message code="product.description.label" default="Description" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="description" required="" value="${productInstance?.description}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'shortDescription', 'error')} required">
						<label for="shortDescription">
							<g:message code="product.shortDescription.label" default="Short Description" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="shortDescription" required="" value="${productInstance?.shortDescription}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'videoClip', 'error')} ">
						<label for="videoClip">
							<g:message code="product.videoClip.label" default="Video Clip" />

						</label>
						<g:textField name="videoClip" value="${productInstance?.videoClip}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'audioClip', 'error')} ">
						<label for="audioClip">
							<g:message code="product.audioClip.label" default="Audio Clip" />

						</label>
						<g:textField name="audioClip" value="${productInstance?.audioClip}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'image', 'error')} ">
						<label for="image">
							<g:message code="product.image.label" default="Image" />

						</label>
						<g:select id="image" name="image.id" from="${discmaster.Image.list()}" optionKey="id" value="${productInstance?.image?.id}" class="many-to-one" noSelection="['null': '']"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'tag', 'error')} ">
						<label for="tag">
							<g:message code="product.tag.label" default="Tag" />

						</label>
						<g:select name="tag" from="${discmaster.Tag.list()}" multiple="multiple" optionKey="id" size="5" optionValue="tag" value="${productInstance?.tag*.id}" class="many-to-many"/>

					</div>


				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
