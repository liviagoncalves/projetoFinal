<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Cadastrar</title>
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
                    <h1 class="display-5 text-center">Cadastrar Categoria</h1>
                    <form action="gerenciar_categoria.do" method="POST">
                    <input type="hidden" name="idcategoria" id="idcategoria" value="${ct.idcategoria}"/>
                    <div class="row">
                        <div class="form-group col-sm-8">
                            <label for="nome" class="control-label">Nome</label>
                            <input type="text" name="nome" id="nome" value="${ct.nome}" class="form-control" required="" maxlength="45"/>
                        </div>
                    </div>
                    <button class="btn btn-info">Gravar</button>
                    <a href="listar_categoria.jsp" class="btn btn-danger">Voltar</a>
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
