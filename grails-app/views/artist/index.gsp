<%--
  Created by IntelliJ IDEA.
  User: sergioandres
  Date: 14/05/2016
  Time: 4:50 AM
--%>

<%@ page import="discmaster.Artist" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<!-- <a href="#show-artist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div> -->
<div id="show-artist" class="content scaffold-show" role="main">
    <h1>Listado de artistas</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list artist">

        <g:if test="${artistInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="artist.description.label" default="Description" /></span>

                <span class="property-value" aria-labelledby="description-label"><g:link controller="description" action="show" id="${artistInstance?.description?.id}">${artistInstance?.description?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${artistInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="artist.name.label" default="Name" /></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${artistInstance}" field="name"/></span>

            </li>
        </g:if>

        <g:if test="${artistInstance?.news}">
            <li class="fieldcontain">
                <span id="news-label" class="property-label"><g:message code="artist.news.label" default="News" /></span>

                <g:each in="${artistInstance.news}" var="n">
                    <span class="property-value" aria-labelledby="news-label"><g:link controller="newsArticle" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${artistInstance?.officialPage}">
            <li class="fieldcontain">
                <span id="officialPage-label" class="property-label"><g:message code="artist.officialPage.label" default="Official Page" /></span>

                <span class="property-value" aria-labelledby="officialPage-label"><g:fieldValue bean="${artistInstance}" field="officialPage"/></span>

            </li>
        </g:if>

        <g:if test="${artistInstance?.products}">
            <li class="fieldcontain">
                <span id="products-label" class="property-label"><g:message code="artist.products.label" default="Products" /></span>

                <g:each in="${artistInstance.products}" var="p">
                    <span class="property-value" aria-labelledby="products-label"><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
   <!--  <g:form url="[resource:artistInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${artistInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form> -->
</div>
</body>
</html>
