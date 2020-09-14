<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Cadastrar Usuário</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilo/layout.css"/>
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <main role="main">
            <%@include file="banner.jsp"%>
            <div class="jumbotron jumbotron-fluid formulario">
                <div class="container-fluid">
                    <h1 class="display-5 text-center">Cadastrar Usuário</h1>
                    <form action="gerenciar_usuario.do" method="POST">
                        <input type="hidden" name="idusuario" id="idusuario" value="${u.idusuario}"/>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="nome">Nome</label>
                                <input type="text" name="nome" class="form-control" id="nome" value="${u.nome}" required="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="login">Login</label>
                                <input type="login" name="login" class="form-control" id="login" value="${u.login}" required="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label for="senha">Senha</label>
                                <input type="password" name="senha" class="form-control" id="senha" value="${u.senha}" required="">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="status">Status</label>
                                <select name="status" class="form-control">
                                    <option selected>Selecionar...</option>
                                    <option value="1"
                                        <c:if test="${u.status==1}">selected=""</c:if>
                                    >Ativo</option>
                                    <option value="2"
                                       <c:if test="${u.status==2}">selected=""</c:if>
                                    >Inativo</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="idperfil">Perfil</label>
                                <select name="idperfil" class="form-control" id="idperfil" required="">
                                    <option selected>Selecionar...</option>
                                    <jsp:useBean id="pDAO" class="persistencia.PerfilDAO"/>
                                    <c:forEach var="p" items="${pDAO.lista}">
                                    <option value="${p.idperfil}"
                                            <c:if test="${p.idperfil==u.perfil.idperfil}">selected=""</c:if>                                  
                                    >${p.nome}</option>
                                </c:forEach>
                                </select>
                            </div>
                        </div>
                        <button class="btn btn-info">Gravar</button>
                        <a href="listar_usuario.jsp" class="btn btn-danger">Voltar</a>
                    </form>
                </div>
            </div>
        </main>
        <script type="text/javascript" src="datatables/jquery.js"></script>
        <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
        <script src="https://unpkg.com/scrollreveal"></script>
    </body>
</html>