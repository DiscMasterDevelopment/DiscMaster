<%@ page import="discmaster.Product" %>
<!doctype html>
<head>
    <meta name="layout" content="main">
    <title>Productos - search - DiscMaster</title>
</head>

<body>
    
    <g:each in="${products}" status="i" var="product">
        <hr/>
        <div class="row">
            <%-- TODO: replace hard written styles for css files --%>
            <div class="medium-5 columns" style="text-align: center">
                <discmaster:productImg product="${product}" class="thumbnail" width="350" />
                <%-- TODO: add youtube videos, and sound to this
                <div class="row small-up-4">
                    <div class="column"> <img class="thumbnail" src="http://placehold.it/250x200"> </div>
                    <div class="column"> <img class="thumbnail" src="http://placehold.it/250x200"> </div>
                    <div class="column"> <img class="thumbnail" src="http://placehold.it/250x200"> </div>
                    <div class="column"> <img class="thumbnail" src="http://placehold.it/250x200"> </div>
                </div>
                --%>
            </div>


            <div class="medium-7 large-6 columns">
                <h3><g:link controller="product" action="show" id="${product.id}">${fieldValue(bean: product, field: "name")}</g:link></h3>
                <div class="row"><div class="small- column">
                    <span id="price-label" class="property-label"><g:message code="product.price.label" default="COP " /></span>
                    <span class="property-value" aria-labelledby="price-label"><discmaster:productPrice product="${product}"/></span>
                </div></div>

                <p>${product.description.shortDescription}</p>

                <g:if test="${!session?.admin}">
                <div class="row">
                    <div class="small-3 columns"> <label for="middle-label" class="middle">Cantidad</label> </div>
                    <div class="small-9 columns"> <input id="middle-label" placeholder="One fish two fish" type="text"> </div>
                </div>
                <a href="#" class="button large expanded">Añadir al carrito</a>

                <div class="small secondary expanded button-group">
                    <a class="button">Facebook</a>
                    <a class="button">Twitter</a>
                    <a class="button">Yo</a>
                </div>
                </g:if>

                <g:else>
                <div class="row">
                    <a href="#" class="button small-3">Editar producto</a>
                    <a href="#" class="button alert small-3">Eliminar producto</a>
                </div>
                </g:else>
            </div>
        </div>
    </g:each>

</body>
</html>
