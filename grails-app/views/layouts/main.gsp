<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
		<title><g:layoutTitle default="DiscMaster"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	    <link rel="stylesheet" type="text/css" href="${resource(dir: 'stylesheets', file: 'stylefont.css')}">
        <asset:stylesheet src="foundation/foundation.css"/>
		<g:layoutHead/>
	</head>
	<body>
        <header>
            <div class="top-bar">
                <div class="top-bar-left">
                    <ul class="menu">
                        <li><g:link uri="/" title="Site's page">DiscMaster</g:link></li>

                        <li class="has-form"> <%-- based on: http://zurb.com/building-blocks/top-bar-with-mobile-and-desktop-search-bar --%>
                            <div class="row collapse"> <%-- look at foundation grids: http://foundation.zurb.com/sites/docs/grid.html --%>
                                <div class="small-9 columns"><input placeholder="Find Stuff" type="text"></div>
                                <div class="small-3 columns"><a href="#" class="button expand">Search</a></div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="top-bar-right">
                    <ul class="menu">
                        <g:if test="${session?.user}">
                            <li>Estas logeado como: ${session.user?.name}</li>
                            <li><g:link action="logout" controller="user" title="Logout">Logout</g:link></li>
                        </g:if>
                        <g:else>
                            <li>
                                <g:form controller="user" action="login" class="has-form rows large-collapse small-collapse" method="POST">
                                    <div class="large-5 columns"><g:textField name="name" placeholder="user"></g:textField></div>
                                    <div class="large-5 columns"><g:passwordField name="password" placeholder="password"></g:passwordField></div>
                                    <div class="large-2 columns"><g:submitButton class="alert button expand" name="login" value="Login"></g:submitButton></div>
                                </g:form>
                            </li>
                            <li><g:link action="register" controller="user" title="Sign In">Registrarse</g:link></li>
                        </g:else>
                        <li><a href="#">Perfil</a></li>
                        <li><g:link controller="CarList" action="aCarList" title="Carrito de compras">
                            <a href="/DiscMaster/carList/aCarList"><img src="${resource(dir: 'images', file: 'carrito-de-compras.png')}" alt="kart" style="width:30px;height:30px;"></a></g:link>
                        </li>
                    </ul>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="medium-4 columns">
                    <h1 class="header-font">DiscMaster</h1>
                    <!--                    <img src="http://placehold.it/450x183&text=DiscMaster" alt="company logo">-->
                </div>
                <div class="medium-7 columns">
                    <!--                    <img src="http://placehold.it/900x175&text=Responsive Ads - ZURB Playground/333" alt="advertisement for deep fried Twinkies">-->
                </div>
            </div>

            <br>
            <div class="title-bar" data-responsive-toggle="main-menu" data-hide-for="medium" style="background-color:red">
                <button class="menu-icon" type="button" data-toggle></button>
                <div class="title-bar-title">Menu</div>
            </div>
            <div class="top-bar" id="main-menu">
                <ul class="menu vertical medium-horizontal expanded medium-text-center" data-responsive-menu="drilldown medium-dropdown">
                    <li><a class="botonMenu" href="#">Home</a></li>
                    <li><a class="botonMenu" href="#">Bandas</a></li>
                    <li><g:link controller="store" action="catalog" class="botonMenu" title="Catálogo">Catálogo</g:link></li>
                    <li><a class="botonMenu" href="#">Contacto</a></li>
                </ul>
            </div>
        </header>

        <div class="row">
		<g:layoutBody/>
        </div>

        <footer>
            <hr>
            <div class="row expanded">
                <div class="medium-6 columns">
                    <ul class="menu">
                        <li><a href="#">Legal</a></li>
                        <li><a href="#">Partner</a></li>
                        <li><a href="#">Explore</a></li>
                    </ul>
                </div>
                <div class="medium-6 columns">
                    <ul class="menu align-right">
                        <li class="menu-text">Copyright © 2016 DiscMaster</li>
                    </ul>
                </div>
            </div>
        </footer>
        <%--
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		--%>

        <asset:javascript src="vendor/jquery.min.js"/>
        <asset:javascript src="vendor/what-input.min.js"/>
        <asset:javascript src="foundation.min.js"/>
        <script>
          $(document).foundation();
        </script>
	</body>
</html>
