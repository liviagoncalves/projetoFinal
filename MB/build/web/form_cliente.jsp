<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Cadastrar Cliente</title>
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
                    <h1 class="display-5 text-center">Cadastrar Cliente</h1>
                    <form action="gerenciar_cliente.do" method="POST" id="meuForm">
                        <input type="hidden" name="idcliente" id="idcliente" value="${cli.idcliente}"/>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="nome">Nome</label>
                                <input type="text" name="nome" class="form-control" id="nome" value="${cli.nome}" required="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="email">Email</label>
                                <input type="email" name="email" class="form-control" id="email" value="${cli.email}" required="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label for="cpf">CPF</label>
                                <input type="text" name="cpf" class="form-control" id="cpf" value="${cli.cpf}" required="">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="rg">RG</label>
                                <input type="text" name="rg" class="form-control" id="rg" value="${cli.rg}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="data_nasc">Data de Nascimento</label>
                                <input type="text" name="data_nasc" class="form-control" id="data_nasc" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${cli.data_nasc}"/>" required="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="Sexo">Gênero</label>
                                <select id="sexo" name="sexo" class="form-control">
                                    <option selected>Selecionar...</option>
                                    <option value="1" 
                                        <c:if test="${cli.sexo==1}">selected=""</c:if>
                                    >Feminino</option>
                                    <option value="2"
                                        <c:if test="${cli.sexo==2}">selected=""</c:if>
                                    >Masculino</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="fidelidade">Fidelidade</label>
                                <select id="fidelidade" name="fidelidade" class="form-control">
                                    <option selected>Selecionar...</option>
                                    <option value="1"
                                        <c:if test="${cli.fidelidade==1}">selected=""</c:if>
                                    >Sim</option>
                                    <option value="2"
                                        <c:if test="${cli.fidelidade==2}">selected=""</c:if>
                                    >Não</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="promocao">Promoção</label>
                                <select id="promocao" name="promocao" class="form-control">
                                    <option selected>Selecionar...</option>
                                    <option value="1"
                                        <c:if test="${cli.promocao==1}">selected=""</c:if>
                                    >Sim</option>
                                    <option value="2"
                                        <c:if test="${cli.promocao==2}">selected=""</c:if>
                                    >Não</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="telefone">Telefone</label>
                                <input type="text" name="telefone" class="form-control" id="telefone" value="${cli.telefone}">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="cliente_desde">Cliente Desde</label>
                                <input type="text" name="cliente_desde" class="form-control" id="cliente_desde" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${cli.cliente_desde}"/>" required="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label for="cep">CEP</label>
                                <input type="text" name="cep" class="form-control" id="cep" value="${cli.cep}">
                            </div>
                            <div class="form-group col-md-9">
                                <label for="rg">Endereço</label>
                                <input type="text" name="endereco" class="form-control" id="endereco" value="${cli.endereco}">
                            </div>
                            <div class="form-group col-md-1">
                                <label for="numero">Número</label>
                                <input type="text" name="numero" class="form-control" id="numero" value="${cli.numero}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <label for="complemento">Complemento</label>
                                <input type="text" name="complemento" class="form-control" id="complemento" value="${cli.complemento}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="bairro">Bairro</label>
                                <input type="text" name="bairro" class="form-control" id="bairro" value="${cli.bairro}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="cidade">Cidade</label>
                                <input type="text" name="cidade" class="form-control" id="cidade" value="${cli.cidade}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="uf">UF</label>
                                <input type="text" name="uf" class="form-control" id="uf" value="${cli.uf}">
                            </div>
                        </div>
                        <button class="btn btn-info">Gravar</button>
                        <a href="listar_cliente.jsp" class="btn btn-danger">Voltar</a>
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
            $(document).ready(function(){
               var $seuCampoCpf = $("#cpf");
               $seuCampoCpf.mask('000.000.000-00', {reverse: true});
               var $seuCampoTelefone = $("#telefone");
               $seuCampoTelefone.mask('(00)00000-0000');
               var $seuCampoCep = $("#cep");
               $seuCampoCep.mask('00.000-000');
            });
        </script>
        <script>

        $(document).ready(function() {

            function limpa_formulário_cep() {
                // Limpa valores do formulário de cep.
                $("#endereco").val("");
                $("#bairro").val("");
                $("#cidade").val("");
                $("#uf").val("");
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#endereco").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#uf").val("...");

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#endereco").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#uf").val(dados.uf);
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        });

    </script>
    </body>
</html>