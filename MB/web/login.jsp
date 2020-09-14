<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MB Fashion - Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilo/login.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
    </head>
    <body class="text-center">
        <%
            String mensagem = (String)request.getSession().getAttribute("mensagem");
            if (mensagem !=null) {
                    request.getSession().removeAttribute("mensagem");
        %>
        <div class="alert alert-info"><%=mensagem%></div>
        <%
            }
        %>
        <form action="gerenciar_login.do" method="POST" class="form-signin">
            <img class="mb-4" src="imagem/Logo_flor.png" alt="" width="150" height="150">
            <h1 class="h3 mb-3 font-weight-normal">Acesso Restrito</h1>
            <label for="login" class="sr-only">Login</label>
            <input type="text" id="login" name="login" class="form-control" placeholder="Login" required="" autofocus>
            <label for="senha" class="sr-only">Senha</label>
            <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required="">
            <button class="btn btn-lg btn-info btn-block" type="submit">Entrar</button>
        </form>
        <script type="text/javascript" src="datatables/jquery.js"></script>
        <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
        <script src="https://unpkg.com/scrollreveal"></script>
    </body>
</html>