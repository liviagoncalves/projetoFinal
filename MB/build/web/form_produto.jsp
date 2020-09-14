<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Cadastrar Produto</title>
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
                    <h1 class="display-5 text-center">Cadastrar Produto</h1>
                    <form action="gerenciar_produto.do" method="POST">
                        <input type="hidden" name="idproduto" id="idproduto" value="${pr.idproduto}"/>
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <label for="descricao">Descrição</label>
                                <input type="text" name="descricao" class="form-control" id="descricao" value="${pr.descricao}" required="">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="vlr_compra">Valor Compra</label>
                                <input type="text" name="vlr_compra" class="form-control" id="vlr_compra" value="<fmt:formatNumber pattern="#,##0.00" value="${pr.vlr_compra}"/>" required="">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="vlr_venda">Valor Venda</label>
                                <input type="text" name="vlr_venda" class="form-control" id="vlr_venda" value="<fmt:formatNumber pattern="#,##0.00" value="${pr.vlr_venda}"/>" required="">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="qtde">Quantidade</label>
                                <input type="text" name="qtde" class="form-control" id="qtde" value="${pr.qtde}" required="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="idfornecedor">Fornecedor</label>
                                <select name="idfornecedor" class="form-control" id="idfornecedor" required="">
                                    <option selected="">Selecionar</option>
                                    <jsp:useBean id="fDAO" class="persistencia.FornecedorDAO"/>
                                    <c:forEach var="f" items="${fDAO.lista}">
                                        <option value="${f.idfornecedor}" 
                                                <c:if test="${f.idfornecedor==pr.fornecedor.idfornecedor}">selected=""</c:if>
                                        >${f.razao_social}</option>
                                    </c:forEach>
                                </select>
                                <small id="linkcadastrar" class="form-text text-muted">
                                    <a class="link" href="listar_fornecedor.jsp">Cadastrar Fornecedor</a>
                                </small>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="idcategoria">Categoria</label>
                                <select name="idcategoria" class="form-control" id="idcategoria" required="">
                                    <option selected="">Selecionar</option>
                                    <jsp:useBean id="cDAO" class="persistencia.CategoriaDAO"/>
                                    <c:forEach var="c" items="${cDAO.lista}">
                                        <option value="${c.idcategoria}"
                                                <c:if test="${c.idcategoria==pr.categoria.idcategoria}">selected=""</c:if>
                                        >${c.nome}</option>
                                    </c:forEach>
                                </select>
                                <small id="linkcadastrar" class="form-text text-muted">
                                    <a class="link" href="listar_categoria.jsp">Cadastrar Categoria</a>
                                </small>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="idcor">Cor</label>
                                <select name="idcor" class="form-control" id="idcor">
                                    <option selected="">Selecionar</option>
                                    <jsp:useBean id="corDAO" class="persistencia.CorDAO"/>
                                    <c:forEach var="cor" items="${corDAO.lista}">
                                        <option value="${cor.idcor}"
                                                <c:if test="${cor.idcor==pr.cor.idcor}">selected=""</c:if>
                                        >${cor.nome}</option>
                                    </c:forEach>
                                </select>
                                <small id="linkcadastrar" class="form-text text-muted">
                                    <a class="link" href="listar_cor.jsp">Cadastrar Cor</a>
                                </small>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="idtamanho">Tamanho</label>
                                <select name="idtamanho" class="form-control" id="idtamanho">
                                    <option selected="">Selecionar</option>
                                    <jsp:useBean id="tDAO" class="persistencia.TamanhoDAO"/>
                                    <c:forEach var="t" items="${tDAO.lista}">
                                        <option value="${t.idtamanho}" 
                                                <c:if test="${t.idtamanho==pr.tamanho.idtamanho}">selected=""</c:if>
                                        >${t.nome}</option>
                                    </c:forEach>
                                </select>
                                <small id="linkcadastrar" class="form-text text-muted">
                                    <a class="link" href="listar_tamanho.jsp">Cadastrar Tamanho</a>
                                </small>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="marca">Marca</label>
                                <select name="idmarca" class="form-control" id="idmarca">
                                    <option selected="">Selecionar</option>
                                    <jsp:useBean id="mDAO" class="persistencia.MarcaDAO"/>
                                    <c:forEach var="m" items="${mDAO.lista}">
                                        <option value="${m.idmarca}"
                                                <c:if test="${m.idmarca==pr.marca.idmarca}">selected=""</c:if>
                                        >${m.nome}</option>
                                    </c:forEach>
                                </select>
                                <small id="linkcadastrar" class="form-text text-muted">
                                    <a class="link" href="listar_marca.jsp">Cadastrar Marca</a>
                                </small>
                            </div>
                        </div>
                        <button class="btn btn-info">Gravar</button>
                        <a href="listar_produto.jsp" class="btn btn-danger">Voltar</a>
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
        <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.5.0.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
        <script type="text/javascript" src="datatables/jquery.mask.js"></script>
        <script type="text/javascript">
            /*$(document).ready(function(){
               var $seuCampoDinheiro = $("#vlr_venda");
               $seuCampoDinheiro.mask('000.000.000.000.000,00', {reverse: true});
            });*/
        </script>
    </body>
</html>