<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Listar Cliente</title>
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
                    <h1 class="display-5 text-center">Listar Cliente</h1>
                    <a href="form_cliente.jsp" class="btn btn-info">Novo Cadastro</a><br><br>
                    <table class="table table-hover table-striped" id="listarCliente">
                        <thead class="table-info">
                            <tr class="text-center">
                                <th  scope="col">Id</th>
                                <th  scope="col">Nome</th>
                                <th  scope="col">CPF</th>
                                <th  scope="col">Data de nascimento</th>
                                <th  scope="col">Telefone</th>
                                <th  scope="col">Fidelidade</th>
                                <th  scope="col">Promoção</th>
                                <th  scope="col">Opções</th>
                            </tr>
                        </thead>
                        <tfoot class="table-info">
                            <tr class="text-center">
                                <th  scope="col">Id</th>
                                <th  scope="col">Nome</th>
                                <th  scope="col">CPF</th>
                                <th  scope="col">Data de nascimento</th>
                                <th  scope="col">Telefone</th>
                                <th  scope="col">Fidelidade</th>
                                <th  scope="col">Promoção</th>
                                <th  scope="col">Opções</th>
                            </tr>
                        </tfoot>
                        <jsp:useBean class="persistencia.ClienteDAO" id="cDAO"/>
                        <tbody>
                            <c:forEach var="c" items="${cDAO.lista}">
                                <tr class="text-center">
                                    <td>${c.idcliente}</td>
                                    <td>${c.nome}</td>
                                    <td>${c.cpf}</td>
                                    <td class="text-center"><fmt:formatDate pattern="dd/MM/YYYY" value="${c.data_nasc}"/></td>
                                    <td>${c.telefone}</td>
                                    <td>
                                        <c:if test="${c.fidelidade==1}">
                                            Sim
                                        </c:if>
                                        <c:if test="${c.fidelidade==2}">
                                            Não
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${c.promocao==1}">
                                            Sim
                                        </c:if>
                                        <c:if test="${c.promocao==2}">
                                            Não
                                        </c:if>
                                    </td>
                                    <td>
                                        <a href="./gerenciar_cliente.do?acao=alterar&idcliente=${c.idcliente}" class="btn btn-outline-info">
                                            <ion-icon name="pencil-sharp"></ion-icon>
                                        </a>
                                        <button class="btn btn-outline-danger" onclick="confirmarExclusao(${c.idcliente},'${c.nome}')">
                                            <ion-icon name="trash-sharp"></ion-icon>
                                        </button>
                                        <a href="form_vendas.jsp?acao=novo&idcliente=${c.idcliente}" class="btn btn-outline-primary">Realizar Venda</a>
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
        <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/scrollreveal"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#listarCliente").dataTable({
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
            function confirmarExclusao(idcliente, nome){
                if (confirm('Deseja realmente excluir este Cliente '+nome+'?')) {
                    location.href="./gerenciar_cliente.do?acao=excluir&idcliente="+idcliente;
                }
            }
        </script>
    </body>
</html>