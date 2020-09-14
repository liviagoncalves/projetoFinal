<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Editar Venda</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilo/layout.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <main role="main">
            <%@include file="banner.jsp"%>
            <div class="jumbotron jumbotron-fluid formulario">
                <div class="container-fluid">
                    <h1 class="display-5 text-center">Editar Venda</h1>
                    <ul class="nav nav-tabs">
                        <li class="active" id="tabDetalhes"><a href="#tab1" data-toggle="tab">Detalhes da Venda</a></li>
                    </ul>
                    
                            <form action="" method="POST" id="formVendas">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab1">
                                        <input type="hidden" name="idvendas" id="idvendas" value=""/>
                                        <div class="form-row">
                                            <div class="form-group col-md-2">
                                                <label for="data_venda">Data da Venda</label>
                                                <input type="text" name="data_venda" class="form-control datapicker" id="data_venda" value="" required=""/>
                                            </div>
                                            <div class="form-group col-md-5">
                                                <label for="cliente">Cliente</label>
                                                <input type="text" name="cliente" class="form-control" id="cliente" value="" required="">
                                                <input id="idcliente" class="span12" type="hidden" name="idcliente" value="" />
                                            </div>
                                            <div class="form-group col-md-5">
                                                <label for="usuario">Vendedor</label>
                                                <input type="text" name="vendedor" class="form-control" id="usuario" value="" required="">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="produto">produto</label>
                                                <input type="text" name="produto" class="form-control" id="produto" value="" required=""/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="preco">Preco</label>
                                                <input type="text" name="preco" class="form-control" id="preco" value="" required=""/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="qtde">Quantidade</label>
                                                <input type="text" name="qtde" class="form-control" id="qtde" value="" required="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-info">Continuar</button>
                                <a href="listar_vendas.jsp" class="btn btn-danger">Voltar</a>
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