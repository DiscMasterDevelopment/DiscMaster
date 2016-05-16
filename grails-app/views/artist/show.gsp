<%@ page import="discmaster.Artist" %>
<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Artist')}" />
    <meta name="layout" content="main">
    <title><g:message code="${artistInstance?.name}" /></title>
</head>
<body>

<div class="row">
    <div class="large-12 columns">
        <h1>
            <g:if test="${artistInstance?.name}">
                <g:fieldValue bean="${artistInstance}" field="name"/>
            </g:if>
        </h1>
        <hr/>
    </div>
</div>


<div class="row">

    <div class="large-9 columns" role="content">
        <hr/>
        <article>
            <h1>
                <g:if test="${artistInstance?.description.shortDescription}">
                    <g:fieldValue bean="${artistInstance}" field="description.shortDescription"/>
                </g:if>
            </h1>
            <!--<h6>Written by <a href="#">John Smith</a> on August 12, 2012.</h6>-->
            <div class="row">
                <div class="large-6 columns">
                    <g:if test="${artistInstance?.description.description}">
                        <p><g:fieldValue bean="${artistInstance}" field="description.description"/></p>
                    </g:if>
                </div>
                <div class="large-6 columns">
                    <img src="http://placehold.it/400x240&text=[img]"/>
                </div>
            </div>
            <g:if test="${artistInstance?.officialPage}">
                <p>Mira el <a href=<g:fieldValue bean="${artistInstance}" field="officialPage"/>>sitio oficial </a> de la banda.</p>
            </g:if>
        </article>
    </div>


    <aside class="large-3 columns">
        <h5>Categories</h5>
        <ul class="side-nav">
            <li><a href="#">News</a></li>
        </ul>
        <div class="panel">
            <h5>Featured</h5>
            <p>Pork drumstick turkey fugiat. Tri-tip elit turducken pork chop in. Swine short ribs meatball irure bacon nulla pork belly cupidatat meatloaf cow.</p>
            <a href="#">Read More &rarr;</a>
        </div>
    </aside>

</div>


<footer class="row">
    <div class="large-12 columns">
        <hr/>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.3/js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
<script type="text/javascript" src="https://intercom.zurb.com/scripts/zcom.js"></script>
</body>
</html>
