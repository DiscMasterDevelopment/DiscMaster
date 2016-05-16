<%@ page import="discmaster.Artist" %>



<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="artist.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="description" name="description.id" from="${discmaster.Description.list()}" optionKey="id" required="" value="${artistInstance?.description?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="artist.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${artistInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'news', 'error')} ">
	<label for="news">
		<g:message code="artist.news.label" default="News" />
		
	</label>
	<g:select name="news" from="${discmaster.NewsArticle.list()}" multiple="multiple" optionKey="id" size="5" value="${artistInstance?.news*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'officialPage', 'error')} required">
	<label for="officialPage">
		<g:message code="artist.officialPage.label" default="Official Page" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="officialPage" required="" value="${artistInstance?.officialPage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'products', 'error')} ">
	<label for="products">
		<g:message code="artist.products.label" default="Products" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${artistInstance?.products?}" var="p">
    <li><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="product" action="create" params="['artist.id': artistInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'product.label', default: 'Product')])}</g:link>
</li>
</ul>


</div>

