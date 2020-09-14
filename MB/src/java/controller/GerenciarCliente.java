package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import persistencia.ClienteDAO;

/**
 *
 * @author Livia
 */
public class GerenciarCliente extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idcliente = Integer.parseInt(request.getParameter("idcliente"));
            ClienteDAO cDAO = new ClienteDAO();
            if (request.getParameter("acao").equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Cliente c = cDAO.getClientePorIdcliente(idcliente);
                    if (c.getIdcliente() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_cliente.jsp");
                        request.setAttribute("cli", c);
                        disp.forward(request, response);
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Cliente não encontrado!');");
                        out.println("location.href='listar_cliente.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Acesso Negado!');");
                        out.println("location.href='listar_cliente.jsp';");
                        out.println("</script>");
                }
            }
            if (request.getParameter("acao").equals("excluir")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    PrintWriter out = response.getWriter();
                    if (cDAO.excluir(idcliente)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Cliente excluido com sucesso!');");
                        out.println("location.href='listar_cliente.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Não foi possível excluir Cliente!');");
                        out.println("location.href='listar_cliente.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Acesso Negado!');");
                        out.println("location.href='listar_cliente.jsp';");
                        out.println("</script>");
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao recuperar dados!");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String idcliente = request.getParameter("idcliente");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String rg = request.getParameter("rg");
        String data_nasc = request.getParameter("data_nasc");
        String sexo = request.getParameter("sexo");
        String telefone = request.getParameter("telefone");
        String cep = request.getParameter("cep");
        String endereco = request.getParameter("endereco");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");
        String cliente_desde = request.getParameter("cliente_desde");
        String fidelidade = request.getParameter("fidelidade");
        String promocao = request.getParameter("promocao");
        String mensagem;
        try {
            SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
            Cliente c = new Cliente();
            if (!idcliente.isEmpty()) {
                c.setIdcliente(Integer.parseInt(request.getParameter("idcliente")));
            }
            c.setNome(nome);
            c.setEmail(email);
            c.setCpf(cpf);
            c.setRg(rg);
            if(!data_nasc.isEmpty()){
                c.setData_nasc(data.parse(data_nasc));
            }
            c.setSexo(sexo);
            c.setTelefone(telefone);
            c.setCep(cep);
            c.setEndereco(endereco);
            c.setNumero(Integer.parseInt(numero));
            c.setComplemento(complemento);
            c.setBairro(bairro);
            c.setCidade(cidade);
            c.setUf(uf);
            if(!cliente_desde.isEmpty()){
                c.setCliente_desde(data.parse(cliente_desde));
            }
            c.setFidelidade(fidelidade);
            c.setPromocao(promocao);
            ClienteDAO cDAO = new ClienteDAO();
            if (cDAO.gravar(c)) {
                mensagem = "Cliente gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar Cliente!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao gravar Cliente!";
            System.out.println("Erro ao Gravar Cliente: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_cliente.jsp';");
        out.println("</script>");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
