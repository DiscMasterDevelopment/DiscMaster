<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
		<title><g:layoutTitle default="DiscMaster"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
        <%--<link rel="stylesheet" type="text/css" href="${resource(dir: 'stylesheets', file: 'foundation.css')}"> --%>
        <asset:stylesheet src="foundation/foundation.css"/>
		<g:layoutHead/>
	</head>
	<body>
		<%-- <div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div> --%>

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
                            <div class="large-5 columns"><g:textField name="password" placeholder="password" type="password"></g:textField></div>
                            <div class="large-2 columns"><g:submitButton class="alert button expand" name="login" value="Login"></g:submitButton></div>
                        </g:form>
                    </li>
                    <li><g:link action="register" controller="user" title="Sign In">Registrarse</g:link></li>
                </g:else>
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

        <asset:javascript src="vendor/jquery.min.js"/>
        <asset:javascript src="vendor/what-input.min.js"/>
        <asset:javascript src="foundation.min.js"/>
        <script>
          $(document).foundation();
        </script>
	</body>
</html>
