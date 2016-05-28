<%@ page import="discmaster.Product" %>
<%@ page import="discmaster.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="${productInstance?.name}" /></title>
	</head>
	<body>
	<div class="row small-up-1 medium-up-2 large-up-2">

		<h1 style="text-align: center"><g:message code="${productInstance?.name}" /></h1>
		<div class="medium-1 columns" style="text-align: center">
            <discmaster:productImg product="${productInstance}" class="thumbnail" width="360px"/>

            <div>
                <discmaster:productPrice product="${productInstance}"/>
                &nbsp;&nbsp;&nbsp; Stock: ${productInstance.totalInStorage}
            </div>

            <g:if test="${productInstance?.description}">
                <div class="row" style="text-align: center">
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="description"/></span>
                </div>
            </g:if>

            <%-- testing if user already have the product in their carlist --%>
            <g:if test="${session.user?.id && User.get(session.user.id).car?.productList.find {it.product == productInstance} }">
                <h3>Ya tienes este producto en tu carrito de compas :D, genial</h3>
            </g:if>
            <g:else>
                <g:form action="addProduct" controller="carList" id="${productInstance?.id}">
                    <span id="quantity-label" class="property-label"><g:message code="quantity.label" default="Cantidad:" /></span>
                    <span class="property-value" aria-labelledby="quantity-label"><g:select name="quantity" from="${1..99}" value="${quantity}"></g:select></span>

                    <div class="row small-up-2 collapse">
                        <div class="column">
                            <g:submitButton class="button expanded" name="addProduct" required="" value="Añadir al carrito" title="Agregar al carrito" ></g:submitButton>
                        </div>
                        <div class="column">
                            <g:link controller="wishList" action="addProduct" id="${productInstance?.id}" class="button expanded" title="Añadir a la lista de deseos">Añadir a la lista de deseos</g:link>
                        </div>
                    </div>
                </g:form>
            </g:else>
        </div>

        <div class="medium-1 columns" style="text-align: center">
            <g:if test="${productInstance?.videoClip}">
                <div class="videoWrapper">
                    <iframe width="640" height="360" src="${"https://www.youtube.com/embed/"+ productInstance?.videoClip}" frameborder="0" allowfullscreen></iframe>
                </div>
            </g:if>
            <g:if test="${productInstance?.audioClip}">
                <iframe width="100%" height="166" scrolling="no" frameborder="no" src= "${"https://w.soundcloud.com/player/?url="+ productInstance?.audioClip + "&amp;color=000000&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"}"></iframe>
            </g:if>
            <g:if test="${productInstance?.tag}">
                <div class="row" style="text-align: center">
                    <g:each in="${productInstance.tag}" var="t">
                        <g:link controller="store" action="search" params="${[string:'', tag: t.tag]}" >
                            <span class="label" aria-labelledby="tag-label"><g:fieldValue bean="${t}" field="tag"/></span>
                        </g:link>
                    </g:each>
                </div>
            </g:if>
		</div>
	</div>


    <g:if test="${session?.admin}">
        <g:form url="[resource:productInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="button" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </g:if>


	</body>
</html>
