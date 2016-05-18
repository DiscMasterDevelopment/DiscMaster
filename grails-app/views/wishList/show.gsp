<%@ page import="discmaster.WishList" %>
<%@ page import="discmaster.Product" %>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta name="layout" content="main">
</head>

<body>
<div class="off-canvas-wrapper">

    <hr/>
    <div class="row small-up-1">
        <div class="column">
            <h2 style="text-align: center;">Lista de deseos</h5>
        </div>
    </div>

    <hr/>
    <div class="row small-up-2 medium-up-3 large-up-4">
        <g:set var="quantity" value="${wishList.productList.size()}" />
        <g:if test = "${quantity == 0}">
            <div class="row small-up-1 large-up-2">
                <h1 style="text-align: center">Tu lista de deseos esta vacía</h1>
            </div>
        </g:if>
        <g:else>
        <g:each in="${wishList.productList}" var="product">
            <div class="column">
                <g:link controller="product" action="show" id="${product.id}" title="Ver producto">
                    <discmaster:productImg product="${product}" class="thumbnail"></discmaster:productImg>
                    <h5>${product.name}</h5>
                    <p><discmaster:productPrice product="${product}"/></p>
                </g:link>
                <g:link action="deleteProduct" id="${product.id}" class="button expanded alert" title="Eliminar de la lista de deseos">Eliminar de la lista de deseos</g:link>
            </div>
        </g:each>
        </g:else>
    </div>
</div>
</body>
</html>
