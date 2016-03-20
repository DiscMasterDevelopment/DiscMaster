<%@ page import="discmaster.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>

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

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'whishList', 'error')} ">
	<label for="whishList">
		<g:message code="user.whishList.label" default="Whish List" />
		
	</label>
	<g:select name="whishList" from="${discmaster.WishList.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.whishList*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'reviews', 'error')} ">
	<label for="reviews">
		<g:message code="user.reviews.label" default="Reviews" />
		
	</label>
	<g:select name="reviews" from="${discmaster.Review.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.reviews*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'order', 'error')} ">
	<label for="order">
		<g:message code="user.order.label" default="Order" />
		
	</label>
	<g:select name="order" from="${discmaster.PurchaseOrder.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.order*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'car', 'error')} ">
	<label for="car">
		<g:message code="user.car.label" default="Car" />
		
	</label>
	<g:select id="car" name="car.id" from="${discmaster.CarList.list()}" optionKey="id" value="${userInstance?.car?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>

</div>

