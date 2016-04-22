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
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>

        <%--
        <div class="off-canvas position-left reveal-for-large" id="my-info" data-off-canvas data-position="left">
            <div class="row column">
                <br>
                <img class="thumbnail" src="http://placehold.it/550x350">
                <h5>Carrito de compras</h5>
                <p>Descrición de producto</p>
            </div>
        </div>
        --%>

        <hr>
        <div class="off-canvas-content" data-off-canvas-content>
            <div class="row small-up-2 medium-up-3 large-up-4">
                <g:each in="${carList.productList}" var="productQuantity">
                    <g:set var="product" value="${productQuantity.product}" />
                    <div class="column">
                        <discmaster:productImg product="${product}" class="thumbnail"></discmaster:productImg>
                        <h5>${product.name}</h5>
                        <p><discmaster:productPrice product="${product}"/></p>
                    </div>
                </g:each>
            </div>
        </div>
    </div>
</div>
</body>
</html>
