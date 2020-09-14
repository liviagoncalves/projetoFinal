package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Fornecedor;
import persistencia.FornecedorDAO;

/**
 *
 * @author Livia
 */
public class GerenciarFornecedor extends HttpServlet {


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
            int idfornecedor = Integer.parseInt(request.getParameter("idfornecedor"));
            FornecedorDAO fDAO = new FornecedorDAO();
            if (request.getParameter("acao").equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Fornecedor f = fDAO.getFornecedorPorIdfornecedor(idfornecedor);
                    if (f.getIdfornecedor() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_fornecedor.jsp");
                        request.setAttribute("for", f);
                        disp.forward(request, response);
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Fornecedor não encontrado!');");
                        out.println("location.href='listar_fornecedor.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_fornecedor.jsp';");
                    out.println("</script>");
                }
            }
            if (request.getParameter("acao").equals("excluir")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    PrintWriter out = response.getWriter();
                    if (fDAO.excluir(idfornecedor)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Fornecedor excluido com sucesso!');");
                        out.println("location.href='listar_fornecedor.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Não foi possível excluir Fornecedor!');");
                        out.println("location.href='listar_fornecedor.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_fornecedor.jsp';");
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
        String mensagem;
        try {
            Fornecedor f = new Fornecedor();
            if (!request.getParameter("idfornecedor").isEmpty()) {
                f.setIdfornecedor(Integer.parseInt(request.getParameter("idfornecedor"))); 
            }
            f.setRazao_social(request.getParameter("razao_social"));
            f.setCnpj(request.getParameter("cnpj"));
            f.setInscricao_estadual(request.getParameter("inscricao_estadual"));
            f.setTelefone(request.getParameter("telefone"));
            f.setCep(request.getParameter("cep"));
            f.setEndereco(request.getParameter("endereco"));
            f.setNumero(Integer.valueOf(request.getParameter("numero")));
            f.setComplemento(request.getParameter("complemento"));
            f.setBairro(request.getParameter("bairro"));
            f.setCidade(request.getParameter("cidade"));
            f.setUf(request.getParameter("uf"));
            FornecedorDAO fDAO = new FornecedorDAO();
            if (fDAO.gravar(f)) {
                mensagem = "Fornecedor gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar Fornecedor!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao gravar Fornecedor!";
            System.out.println("Erro ao Gravar Fornecedor: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_fornecedor.jsp';");
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
