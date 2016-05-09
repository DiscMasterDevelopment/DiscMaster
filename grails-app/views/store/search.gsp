<%@ page import="discmaster.Product" %>
<!doctype html>
<head>
    <meta name="layout" content="main">
    <title>Productos - Búsqueda - DiscMaster</title>
</head>

<body>

    <hr/>
    <g:form controller="store" action="search" class="has-form row small-collapse small-up-4" method="GET">
        <g:each in="${params.subMap(['string', 'sortBy']).keySet()}"> <%-- Keeping info about the search in hidden fields --%>
            <g:hiddenField name="${it}" value="${params[it]}"/>
        </g:each>

        <div class="column"><g:textField name="artist"   value="${params.artist}" placeholder="Artista"/></div>
        <div class="column"><g:textField name="minPrice" value="${params.minPrice}" placeholder="Precio mínimo"/></div>
        <div class="column"><g:textField name="maxPrice" value="${params.maxPrice}" placeholder="Precio máximo"/></div>
        <div class="column"><g:submitButton class="button alert expand" name="referer" value="Refinar búsqueda"/></div>
    </g:form>

    <hr/>
    <div class="row small-up-4">
      <g:set var="translations" value="[price: 'Precio', discount: 'Descuento', totalInStorage: 'Total en bodega', added: 'Fecha de Publicación']"/>
      <g:each in="['price', 'discount', 'totalInStorage', 'added']">
        <div class="column">
            <g:if test="${params.sortBy.equals(it)}"> <% params.direction = params.direction.equals('asc') ? 'desc' : 'asc' %> </g:if>
            <g:link action="search" params="${params + [sortBy: it]}"> Ordenar por ${translations[it]} ${params.sortBy.equals(it) ? (params.direction.equals("desc") ? "⬆" : "⬇") : "" }</g:link>
        </div>
      </g:each>
    </div>
    
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

                <p>${product.shortDescription}</p>

                <g:if test="${!session?.admin}">
                <g:form action="addProduct" controller="carList" id="${product?.id}">
                    <div class="row">
                        <span id="quantity-label" class="property-label"><g:message code="quantity.label" default="Cantidad:" /></span>
                        <span class="property-value" aria-labelledby="quantity-label"><g:select name="quantity" from="${1..99}" value="${quantity}"></g:select></span>

                    </div>
                    <div class="row small-up-2 collapse">
                        <div class="column">
                            <g:submitButton class="button expanded" name="addProduct" required="" value="Añadir al carrito" title="Agregar al carrito" ></g:submitButton>
                        </div>
                        <div class="column">
                            <g:link controller="wishList" action="addProduct" id="${product?.id}" class="button expanded" title="Añadir a la lista de deseos">Añadir a la lista de deseos</g:link>
                        </div>
                    </div>
                </g:form>

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
