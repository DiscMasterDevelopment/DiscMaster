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
    <h2>Our Newest Products</h2>
    <hr>
</div>

<div class="row small-up-2 large-up-4">
    <g:each in="${(productList.sort {it.added})[0..3]}" status="i" var="product">
        <div class="column">
            <discmaster:productImg product="${product}" class="thumbnail"></discmaster:productImg>
            <h5>${product.name}</h5>
            <p>$${product.price}</p>
            <g:link controller="product" action="addToCar" id="${product.id}" title="Buy" class="button expanded">Buy</g:link>
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
    <h2>Some Other Neat Products</h2>
    <hr>
</div>

<div class="row small-up-2 medium-up-3 large-up-6">
    <g:each in="${productList}" status="i" var="product">
        <div class="column">
            <discmaster:productImg product="${product}" class="thumbnail"></discmaster:productImg>
            <h5>${product.name}</h5>

            <p>$${product.price}</p>
            <g:link action="addToCar" controller="product" id="${product.id}" title="Buy" class="button expanded">Buy</g:link>
        </div>
    </g:each>
</div>
<hr>

<div class="row">
    <div class="medium-4 columns">
        <h4>Top Products</h4>

        <g:each in="${(productList.sort {it.added})[0..2]}" status="i" var="product">
            <div class="media-object">
                <div class="media-object-section">
                    <discmaster:productImg product="${product}" class="thumbnail" width="100"></discmaster:productImg>
                </div>
                <div class="media-object-section">
                    <h5>${product.name}</h5>
                    <p>${product.description.description}</p>
                </div>
            </div>
        </g:each>
    </div>

    <div class="medium-4 columns">
        <h4>Top Products</h4>

        <g:each in="${(productList.sort {it.added})[0..2]}" status="i" var="product">
            <div class="media-object">
                <div class="media-object-section">
                    <discmaster:productImg product="${product}" class="thumbnail" width="100"></discmaster:productImg>
                </div>
                <div class="media-object-section">
                    <h5>${product.name}</h5>
                    <p>${product.description.description}</p>
                </div>
            </div>
        </g:each>
    </div>

    <div class="medium-4 columns">
        <h4>Top Products</h4>

        <g:each in="${(productList.sort {it.added})[0..2]}" status="i" var="product">
            <div class="media-object">
                <div class="media-object-section">
                    <discmaster:productImg product="${product}" class="thumbnail" width="100"></discmaster:productImg>
                </div>
                <div class="media-object-section">
                    <h5>${product.name}</h5>
                    <p>${product.description.description}</p>
                </div>
            </div>
        </g:each>
    </div>
</div>
</body>
</html>
