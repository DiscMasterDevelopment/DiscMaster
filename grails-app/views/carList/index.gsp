<%--
  Created by IntelliJ IDEA.
  User: sergioandres
  Date: 08/04/2016
  Time: 11:53 AM
--%>


<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta name="layout" content="main">

</head>
<body>
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>

        <div class="off-canvas position-left reveal-for-large" id="my-info" data-off-canvas data-position="left">
            <div class="row column">
                <br>
                <img class="thumbnail" src="http://placehold.it/550x350">
                <h5>Carrito de compras</h5>
                <p>Descrición de producto</p>
            </div>
        </div>

        <div class="off-canvas-content" data-off-canvas-content>
            <div class="title-bar hide-for-large">
                <div class="title-bar-left">
                    <button class="menu-icon" type="button" data-open="my-info"></button>
                    <span class="title-bar-title">Carrito de compra</span>
                </div>
            </div>
            <div class="row small-up-2 medium-up-3 large-up-4">
                <div class="column">
                    <img class="thumbnail" src="http://placehold.it/550x550">
                    <h5>Producto</h5>
                </div>
            </div>
            <hr>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
<script>
    $(document).foundation();
</script>
<script type="text/javascript" src="https://intercom.zurb.com/scripts/zcom.js"></script>
</body>
</html>