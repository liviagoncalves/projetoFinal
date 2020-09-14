<%@page import="model.ItensVendas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <a href="listar_cliente.jsp" class="btn btn-info">Nova Venda</a><br><br>
                    <table class="table table-hover table-striped" id="listarVendas">
                        <thead class="table-info">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Data Venda</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Vendedor</th>
                                <th scope="col">Valor</th>
                                <th scope="col">Opções</th>
                            </tr>
                        </thead>
                        <tfoot class="table-info">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Data Venda</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Vendedor</th>
                                <th scope="col">Valor</th>
                                <th scope="col">Opções</th>
                            </tr>
                        </tfoot>
                        <jsp:useBean id="vDAO" class="persistencia.VendasDAO"/>
                        <tbody>
                            <c:forEach var="v" items="${vDAO.lista}">
                                <tr>
                                    <td>${v.idvendas}</td>
                                    <td><fmt:formatDate pattern="dd/MM/YYYY" value="${v.data_venda}"/></td>
                                    <td>${v.cliente.nome}</td>
                                    <td>${v.usuario.nome}</td>
                                    <td>
                                        R$ <fmt:formatNumber pattern="#,##0.00" value="${v.vlr_total}"></fmt:formatNumber>
                                    </td>
                                    <td>
                                        <button class="btn btn-danger" onclick="confirmarExclusao(${v.idvendas},'${v.cliente.nome}')">
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
            $(document).ready(function(){
                $("#listarVendas").dataTable({
                    "bJQueryUI":true,
                    "oLanguage":{
                        "sProcessing":"Processando...",
                        "sLengthMenu":"Motrar _MENU_ registros",
                        "sZeroRecords":"Não foram encontrados resultados",
                        "sInfo":"Mostrar de _START_ até _END_ de _TOTAL_ registros",
                        "sInfoEmpty":"Mostrando de 0 até 0 de 0 registros",
                        "sInfoFiltered":"",
                        "sInfoPostFix":"",
                        "sSearch":"Pesquisar",
                        "sUrl":"",
                        "oPaginate":{
                            "sFirst":"Primeiro",
                            "sPrevious":"Anterior",
                            "sNext":"proximo",
                            "sLast":"Último"
                        }
                    }
                })
            })
        </script>
        <script>
            function confirmarExclusao(idvendas, nome){
                if(confirm('Deseja realmente desativar a venda: '+idvendas+ 'do cliente'+nome +'?')){
                    window.open("gerenciar_venda.do?acao=excluir&idvenda"+idvendas);
                }
            }
        </script>
    </body>
</html>