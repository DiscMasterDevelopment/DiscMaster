<%@ page import="discmaster.Product" %>
<!doctype html>
<head>
    <meta name="layout" content="main">
    <title>Catálogo - DiscMaster</title>
</head>

<body>

<%--
<div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit>
    <ul class="orbit-container">
        <button class="orbit-previous" aria-label="previous"><span class="show-for-sr">Previous Slide</span>&#9664;</button>
        <button class="orbit-next" aria-label="next"><span class="show-for-sr">Next Slide</span>&#9654;</button>

        <li class="orbit-slide is-active"> <g:img dir="images" file="2000x750.png"></g:img> </li>
                
        <li class="orbit-slide"> <g:img dir="images" file="2000x750.png"></g:img> </li>
        <li class="orbit-slide"> <g:img dir="images" file="2000x750.png"></g:img> </li>
        <li class="orbit-slide"> <g:img dir="images" file="2000x750.png"></g:img> </li>
    </ul>
</div>
--%>

<div class="row column text-center">
    <h2>Nuestros últimos productos</h2>
    <hr>
</div>

<div class="row small-up-2 large-up-4">
    <g:each in="${newest}" status="i" var="product">
        <div class="column">
            <g:link controller="product" action="show" id="${product.id}" title="Ver producto">
                <discmaster:productImg product="${product}" class="thumbnail" />

                <h5>${product.name}</h5>
                <p><discmaster:productPrice product="${product}"/></p>
            </g:link>
            <div class="row small-up-2 collapse">
                <div class="column">
                    <g:link controller="product" action="show" id="${product.id}" class="button expanded" title="Ver producto">Ver</g:link>
                </div>
                <div class="column">
                    <g:link controller="product" action="addToCar" id="${product.id}" class="button expanded alert" title="Agregar al carrito">Carrito [+]</g:link>
                </div>
            </div>
        </div>
    </g:each>
</div>
<hr>

<%--
<div class="row column">
    <div class="callout primary">
        <h3>Really big special this week on items.</h3>
    </div>
</div>
<hr>
--%>

<div class="row column text-center">
    <h2>Promociones / Descuentos</h2>
    <hr>
</div>

<div class="row small-up-2 medium-up-3 large-up-6">
    <g:each in="${promotions}" var="product">
        <div class="column">
            <g:link controller="product" action="show" id="${product.id}" title="Ver producto">
                <discmaster:productImg product="${product}" class="thumbnail" />
                <h5>${product.name}</h5>
                <p><discmaster:productPrice product="${product}"/></p>
            </g:link>
            <g:link controller="product" action="addToCar" id="${product.id}" title="Agregar al carrito" class="button expanded">Carrito [+]</g:link>
        </div>
    </g:each>
</div>
<hr>

<div class="row">
    <div class="medium-4 columns">
        <h4>Últimos en bodega</h4>

        <g:each in="${lastInStorage}" status="i" var="product">
            <div class="media-object">
                <g:link controller="product" action="show" id="${product.id}" title="Ver producto">
                    <div class="media-object-section">
                        <discmaster:productImg product="${product}" class="thumbnail" width="100" />
                    </div>
                    <div class="media-object-section">
                        <h5>${product.name}</h5>
                        <p>${product.description.description}</p>
                        <p>${product.totalInStorage} en Bodega</p>
                    </div>
                </g:link>
            </div>
        </g:each>
    </div>

    <div class="medium-4 columns">
        <h4>Más promociones</h4> <%-- Alias, the cheapest XD --%>

        <g:each in="${cheapest}" status="i" var="product">
            <div class="media-object">
                <g:link controller="product" action="show" id="${product.id}" title="Ver producto">
                    <div class="media-object-section">
                        <discmaster:productImg product="${product}" class="thumbnail" width="100" />
                    </div>
                    <div class="media-object-section">
                        <h5>${product.name}</h5>
                        <p>${product.description.description}</p>
                        <p><discmaster:productPrice product="${product}"/></p>
                    </div>
                </g:link>
            </div>
        </g:each>
    </div>

    <div class="medium-4 columns">
        <h4>Otros de nuestros productos</h4>

        <g:each in="${randomItems}" status="i" var="product">
            <div class="media-object">
                <g:link controller="product" action="show" id="${product.id}" title="Ver producto">
                    <div class="media-object-section">
                        <discmaster:productImg product="${product}" class="thumbnail" width="100" />
                    </div>
                    <div class="media-object-section">
                        <h5>${product.name}</h5>
                        <p>${product.description.description}</p>
                    </div>
                </g:link>
            </div>
        </g:each>
    </div>
</div>
</body>
</html>
