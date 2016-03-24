<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
		<title><g:layoutTitle default="DiscMaster"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'stylesheets', file: 'foundation.css')}">
  		<%-- <asset:stylesheet src="foundation.css"/>
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/> --%>
		<g:layoutHead/>
	</head>
	<body>
		<%-- <div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div> --%>

    <div class="top-bar">
        <div class="top-bar-left">
            <ul class="menu">
                <li class="menu-text">DiscMaster</li>

                <li class="has-form"> <%-- source: http://zurb.com/building-blocks/top-bar-with-mobile-and-desktop-search-bar --%>
                    <div class="row collapse">
                    <ul class="large-8 small-9 columns menu">
                        <li><input type="text" placeholder="Find Stuff"></li>
                        <li><a href="#" class="button expand">Search</a></li>
                    </ul>
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
                    <g:form controller="user" action="login" class="has-form" method="POST">
                        <div class="row collapse">
                            <ul class="large-8 small-9 columns menu">
                                <li><g:textField name="name" placeholder="user"></g:textField></li>
                                <li><g:textField name="password" placeholder="password"></g:textField></li>
                                <li><g:submitButton class="alert button expand" name="login" value="Login"></g:submitButton></li>
                            </ul>
                        </div>
                    </g:form>
                    </li>
                </g:else>
                <li><g:link action="register" controller="user" title="Sign In">Registrarse</g:link></li>
                <li><a href="#">Perfil</a></li>
                <li><a href="#">Cart</a></li>
            </ul>
        </div>
    </div>

        <div class="row">
		<g:layoutBody/>
        </div>

        <%--
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		--%>

        <script type="text/javascript" src="${resource(dir: 'javascripts/vendor', file: 'jquery.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'javascripts/vendor', file: 'what-input.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'javascripts/vendor', file: 'foundation.min.js')}"></script>
        <script>
          $(document).foundation();
        </script>
	</body>
</html>
