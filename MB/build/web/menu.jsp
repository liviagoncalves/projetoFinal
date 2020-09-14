<%@page import="controller.GerenciarLogin"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    Usuario ulogado = GerenciarLogin.verificarAcesso(request, response);
    request.setAttribute("ulogado", ulogado);
    
%>
<header>
    
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-white">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" style="background-color: rgb(10,186,181);">
                <span class="navbar-toggler-icon" style="background-color: rgb(10,186,181);"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <c:if test="${ulogado!=null && ulogado.perfil!=null}">
                        <c:forEach var="menu" items="${ulogado.perfil.menu}">
                            <c:if test="${menu.exibir==1}">
                                <li class="nav-item active">
                                    <a class="nav-link" href="${menu.link}">${menu.nome}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
            <div class="pull-right">
                Bem Vindo, <c:if test="${ulogado!=null}">${ulogado.nome}</c:if>
            </div>
            <div class="pull-right">
                <a href="gerenciar_login.do">Sair</a>
            </div>
        </div>
    </nav> 
</header>

<link rel="stylesheet" href="estilo/menu.css"/>
