<%--
  Created by IntelliJ IDEA.
  User: sergioandres
  Date: 08/04/2016
  Time: 11:53 AM
--%>

<%@ page import="discmaster.CarList" %>
<%@ page import="discmaster.Product" %>
<%@ page import="discmaster.ProductQuantity" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta name="layout" content="main">

</head>
<body>
<hr>
<div class="row">
    <div class="small-12 medium-8 large-8 column">
        <div class="row small-up-2 medium-up-2 large-up-3">
                <g:set var="quantity" value="${carList.productList.size()}" />
                <g:if test = "${quantity == 0}">
                    <div class="row small-up-1 large-up-2">
                        <h1 style="text-align: center">Tu carrito de compras está vacío</h1>
                    </div>
                </g:if>
                <g:else>
                <g:each in="${carList.productList}" var="productQuantity">
                    <g:set var="product" value="${productQuantity.product}" />
                    <div class="column">
                        <g:link controller="product" action="show" id="${product.id}" title="Ver producto">
                            <discmaster:productImg product="${product}" class="thumbnail"></discmaster:productImg>
                            <h5>${product.name}</h5>
                            <p><discmaster:productPrice product="${product}"/></p>
                            <p>Total en el carrito: ${productQuantity.quantity}</p>
                        </g:link>
                        <g:link action="deleteProduct" id="${carList.id}" params="${[idToDelete: productQuantity.id]}" class="button expanded alert" title="Eliminar del carrito">Eliminar del carrito</g:link>
                    </div>
                </g:each>
                    </g:else>
        </div>
    </div>

    <div class="small-12 medium-4 large-4 column">
      <h2>¡Tu carrito de compras!</h2>
      <p><b>Total a pagar (sin descuentos):</b> $${totalWithoutDisccount}</p>
      <p><b>Total a pagar:</b> $${totalToPay}</p>
      <a href='#' class="button expanded alert" title="Próximamente pagos por PSE">Pagar y recibir mi mercancía</a>
    </div>

    </div>
</div>
</body>
</html>
