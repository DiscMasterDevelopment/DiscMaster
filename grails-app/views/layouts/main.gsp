<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
		<title><g:layoutTitle default="DiscMaster"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	    <link rel="stylesheet" type="text/css" href="${resource(dir: 'stylesheets', file: 'stylefont.css')}">
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'stylesheets', file: 'foundation.css')}">
		<g:layoutHead/>
	</head>
	<body>
        <header>
            <div class="principal-bar">
                <div class="top-bar-left">
                    <nav class="searching">
                        <a href="#" id="search-icon"></a>
                        <ul class="menu">
                            <%-- <li><g:link uri="/" title="Site's page">DiscMaster</g:link></li> --%>

                            <li> <%-- based on: http://zurb.com/building-blocks/top-bar-with-mobile-and-desktop-search-bar --%>
                                <g:form controller="store" action="search" class="has-form row large-collapse small-collapse" method="GET"> <%-- look at foundation grids: http://foundation.zurb.com/sites/docs/grid.html --%>
                                    <div class="large-9 columns"><g:textField name="string" placeholder="Busca el 'merchandising'"></g:textField></div>
                                    <div class="large-3 columns"><g:submitButton class="button alert expand" name="referer" value="search_box"></g:submitButton></div>
                                </g:form>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="top-bar-right">
                    <nav>
                        <a href="#" id="menu-icon"></a>
                        <ul class="menu">
                            <g:if test="${session?.user}">
                                <li>Estas logeado como: ${session.user?.name}</li>
                                <li><g:link action="logout" controller="user" title="Logout">Logout</g:link></li>
                            </g:if>
                            <g:elseif test="${session?.admin}">
                                <li>Bienvenido administrador: ${session.admin?.name}</li>
                                <li><g:link action="logout" controller="user" title="Logout">Logout</g:link></li>
                            </g:elseif>
                            <g:else>
                                <li>
                                    <g:form controller="user" action="login" class="has-form rows large-collapse small-collapse" method="POST">
                                        <div class="large-5 columns"><g:textField name="name" placeholder="usuario"></g:textField></div>
                                        <div class="large-5 columns"><g:passwordField name="password" placeholder="contraseña"></g:passwordField></div>
                                        <div class="large-2 columns"><g:submitButton class="alert button expand" name="login" value="Loguearse"></g:submitButton></div>
                                    </g:form>
                                </li>
                                <li><g:link action="register" controller="user" title="Sign In">Registrarse</g:link></li>
                            </g:else>

                            <li><g:link action="profile" controller="user" title="Profile">Perfil</g:link></li>

                            <li>
                                <g:link controller="CarList" action="show" title="Carrito de compras">
                                    <img src="${resource(dir: 'images', file: 'carrito-de-compras.png')}" alt="kart" style="width:30px;height:30px;">
                                </g:link>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <br>
            <br>
            <br>
            <div class="row">
                <h1 class="header-font">DiscMaster</h1>
            </div>

            <div class="title-bar" data-responsive-toggle="main-menu" data-hide-for="medium" style="background-color:#ea2e2e">
                <button class="menu-icon" type="button" data-toggle></button>
                <div class="title-bar-title">Menu</div>
            </div>
            <div class="top-bar" id="main-menu">
                <ul class="menu vertical medium-horizontal expanded medium-text-center" data-responsive-menu="drilldown medium-dropdown">
                    <li><g:link controller="store" action="index" class="botonMenu" title="Home">Home</g:link></li>
                    <li><a class="botonMenu" href="#">Bandas</a></li>
                    <li><g:link controller="store" action="catalog" class="botonMenu" title="Catálogo">Catálogo</g:link></li>
                    <li><a class="botonMenu" href="#">Contacto</a></li>
                </ul>
            </div>
        </header>

		<g:layoutBody/>

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
