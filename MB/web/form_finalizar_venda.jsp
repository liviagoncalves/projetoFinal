<%@page import="persistencia.ClienteDAO"%>
<%@page import="model.ItensVendas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cliente"%>
<%@page import="model.Vendas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Cadastrar Vendas</title>
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
                    <h1 class="display-5 text-center">Finalizar Venda</h1>
                    <% 
                        Vendas v = new Vendas();
                        Cliente c = new Cliente();
                        try {
                            v = (Vendas) session.getAttribute("venda");
                        } catch (Exception e) {
                            out.println("Erro:" + e);
                        }
                    %>
                    <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="vendedor" class="control-label">Usuario:</label>
                                <label for="nome" class="control-label"><%=v.getUsuario().getNome()%></label>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="cliente" class="control-label">Cliente:</label>
                                <label for="cliente" class="control-label"><%=v.getCliente().getNome()%></label>
                            </div>
                    </div>
                    <table class="table table-hover table-striped" id="listarVenda">
                        <thead class="table-info">
                            <tr class="text-center">
                                <th  scope="col">Item</th>
                                <th  scope="col">Produto</th>
                                <th  scope="col">Quantidade</th>
                                <th  scope="col">Valor</th>
                                <th  scope="col">Total</th>
                                <th  scope="col">Opções</th>
                            </tr>
                        </thead>
                        <tfoot class="table-info">
                            <tr class="text-center">
                                <th  scope="col">Item</th>
                                <th  scope="col">Produto</th>
                                <th  scope="col">Quantidade</th>
                                <th  scope="col">Valor</th>
                                <th  scope="col">Total</th>
                                <th  scope="col">Opções</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <%
                                double Vlr_total = 0;
                                int cont = 0;
                                for(ItensVendas iv:v.getCarrinho()){
                    
                            %>
                            <tr class="text-center">
                                <td align="center"><%=cont+1%></td>
                                <td><%=iv.getProduto().getDescricao()%></td>
                                <td><%=iv.getQtde()%></td>
                                <td>R$ <%=iv.getVlr_venda()%></td>
                                <td>R$ <%=iv.getQtde()*iv.getVlr_venda()%></td>
                                <td>
                                    <a href="#" class="btn btn-outline-danger" onclick="excluir(<%=cont%>,<%=cont+1%>)">
                                        <ion-icon name="trash-sharp"></ion-icon>
                                    </a>
                                </td>
                            </tr>
                            <%
                                Vlr_total = Vlr_total + (iv.getQtde()*iv.getVlr_venda());
                                cont++;
                                }
                            %>
                        </tbody>
                    </table>
                    <a href="listar_cliente.jsp" class="btn btn-outline-danger">Cancelar</a>
                    <a href="form_vendas.jsp?acao=c" class="btn btn-outline-info">Continuar Vendendo</a>
                    <a href="gerenciar_venda.do" class="btn btn-outline-primary">Confirmar Venda</a>
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
                $("#listarVenda").dataTable({
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
        <script type="text/javascript">
            function excluir(index, item){
                if(confirm("Tem certeza que deseja excluir o item"+item+"?")){
                    window.open("gerenciar_carrinho.do?acao=excluir&index="+index,"_self");
                }
            }
        </script>
    </body>
</html>