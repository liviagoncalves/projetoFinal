<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Cadastrar Menu</title>
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
                    <h1 class="display-5 text-center">Cadastrar Menu</h1>
                    <form action="gerenciar_menu.do" method="POST">
                        <input type="hidden" name="idmenu" id="idmenu" value="${m.idmenu}"/>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="nome">Nome</label>
                                <input type="text" name="nome" class="form-control" id="nome" value="${m.nome}" required="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="link">Link</label>
                                <input type="text" name="link" class="form-control" id="link" value="${m.link}" required="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="icone">Icone</label>
                                <input type="text" name="icone" class="form-control" id="icone" value="${m.icone}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exibir">Exibir</label>
                                <select id="exibir" class="form-control" name="exibir">
                                    <option selected>Selecionar...</option>
                                    <option value="1" 
                                        <c:if test="${m.exibir==1}">selected=""</c:if>
                                    >Sim</option>
                                    <option value="2"
                                        <c:if test="${m.exibir==2}">selected=""</c:if>
                                    >Não</option>
                                </select>
                            </div>
                        </div>
                        <button class="btn btn-info">Gravar</button>
                        <a href="listar_menu.jsp" class="btn btn-danger">Voltar</a>
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
