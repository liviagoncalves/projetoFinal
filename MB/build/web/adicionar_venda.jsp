<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Vendas</title>
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
                    <h1 class="display-5 text-center">Listar Vendas</h1>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Novo Cadastro</button>
                    <a href="form_vendas.jsp" class="btn btn-info">Novo Cadastro</a><br><br>
                    <table class="table table-hover table-striped" id="listarVendas">
                        <thead class="table-info">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Data Venda</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Faturado</th>
                                <th scope="col">Opções</th>
                            </tr>
                        </thead>
                        <tfoot class="table-info">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Data Venda</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Faturado</th>
                                <th scope="col">Opções</th>
                            </tr>
                        </tfoot>
                        <jsp:useBean id="vDAO" class="persistencia.VendasDAO"/>
                        <tbody>
                            <c:forEach var="v" items="${vDAO.lista}">
                                <tr>
                                    <td>${v.idvendas}</td>
                                    <td>${v.data_venda}</td>
                                    <td>${v.cliente.nome}</td>
                                    <td>${v.faturado}</td>
                                    <td>
                                        <a href="./gerenciar_vendas.do?acao=alterar&idproduto=${v.idvendas}" class="btn btn-info">
                                            <ion-icon name="pencil-sharp"></ion-icon>
                                        </a>
                                        <button class="btn btn-danger" onclick="confirmarExclusao(${v.idvendas})">
                                            <ion-icon name="trash-sharp"></ion-icon>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        <script type="text/javascript" src="datatables/jquery.js"></script>
        <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
        <script src="https://unpkg.com/scrollreveal"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#listarVendas").dataTable({
                    "bJQueryUI": true,
                    "oLanguage": {
                        "sProcessing": "Processando...",
                        "sLengthMenu": "Motrar _MENU_ registros",
                        "sZeroRecords": "Não foram encontrados resultados",
                        "sInfo": "Mostrar de _START_ até _END_ de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                        "sInfoFiltered": "",
                        "sInfoPostFix": "",
                        "sSearch": "Pesquisar",
                        "sUrl": "",
                        "oPaginate": {
                            "sFirst": "Primeiro",
                            "sPrevious": "Anterior",
                            "sNext": "proximo",
                            "sLast": "Último"
                        }
                    }
                })
            })
        </script>
        <script>
            function confirmarExclusao(idvendas) {
                if (confirm('Deseja realmente excluir o venda ' + idvendas + '?')) {
                    location.href = 'gerenciar_vendas.do?acao=excluir&idvendas=' + idvendas;
                }
            }
        </script>
    </body>
</html>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Venda</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
                <button class="btn btn-info">Continuar</button>
                <a href="listar_vendas.jsp" class="btn btn-danger">Voltar</a>
            </div>
        </div>
    </div>
</div>