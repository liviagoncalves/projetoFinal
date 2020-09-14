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
                    <h1 class="display-5 text-center">Venda</h1>
                    <% 
                        Vendas v = new Vendas();
                        Cliente c = new Cliente();
                        try {
                            ClienteDAO cDAO = new ClienteDAO();
                            if (request.getParameter("acao").equals("novo")) {
                                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                                c = cDAO.getClientePorIdcliente(idcliente);
                                v.setCliente(c);
                                v.setUsuario(ulogado);
                                v.setCarrinho(new ArrayList<ItensVendas>());
                                session.setAttribute("venda", v);
                            } else {
                                v = (Vendas) session.getAttribute("venda");
                            }
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
                    <div class="form-row">
                        <div class="form-group col-md-2">
                            <label for="catalogo">Catálogo</label>
                            <label for="catalogo" class="control-label">(<%=v.getCarrinho().size()%> itens do Carrinho)</label>
                        </div>
                    </div>
                    <jsp:useBean class="persistencia.ProdutoDAO" id="produto"/>
                    <c:forEach var="p" items="${produto.lista}">
                        <div id="prod${p.idproduto}">
                            <form action="gerenciar_carrinho.do" method="GET">
                                <input type="hidden" name="acao" value="add">
                                <input type="hidden" name="idproduto" value="${p.idproduto}">
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        ${p.descricao}
                                    </div>
                                    <div class="form-group col-md-1">
                                        ${p.qtde}
                                    </div>
                                    <div class="form-group col-md-1">
                                        ${p.tamanho.nome}
                                    </div>
                                    <div class="form-group col-md-1">
                                        <input type="number" name="qtde" class="form-control" value="1" style="width: 60px">
                                       
                                    </div>
                                    <button class="btn btn-outline-primary">
                                            Adicionar
                                        </button>
                                </div>
                                
                            </form>
                        </div>
                    </c:forEach>
                    <a href="listar_cliente.jsp" class="btn btn-outline-danger">Cancelar</a>
                    <a href="form_finalizar_venda.jsp" class="btn btn-outline-info">Finalizar Venda</a>
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