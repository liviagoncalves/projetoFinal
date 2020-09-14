/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Categoria;
import model.Cor;
import model.Fornecedor;
import model.Marca;
import model.Produto;
import model.Tamanho;
import persistencia.ProdutoDAO;

/**
 *
 * @author Livia
 */
public class GerenciarProduto extends HttpServlet {

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
            String mensagem = "";
        try {
            int idproduto = Integer.parseInt(request.getParameter("idproduto"));
            ProdutoDAO prDAO = new ProdutoDAO();
            if (request.getParameter("acao").equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Produto pr = prDAO.getProdutoPorIdproduto(idproduto);
                    if (pr.getIdproduto() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_produto.jsp");
                        request.setAttribute("pr", pr);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Produto não encontrado";
                    }
                }else{
                    mensagem = "Acesso Negado";
                }
            }
            if (request.getParameter("acao").equals("excluir")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    if (prDAO.excluir(idproduto)) {
                        mensagem = "Produto excluido com sucesso";
                    } else {
                        mensagem = "Não foi possível excluir Produto";
                    }
                }else{
                    mensagem = "Acesso Negado";
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao recuperar dados!");
            mensagem = "Erro ao recuperar dados";
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_produto.jsp';");
        out.println("</script>");
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
        try{
            Produto pr = new Produto();
            if (!request.getParameter("idproduto").isEmpty()) {
                pr.setIdproduto(Integer.parseInt(request.getParameter("idproduto")));
            }
            Fornecedor f = new Fornecedor();
            f.setIdfornecedor(Integer.parseInt(request.getParameter("idfornecedor")));
            Categoria c = new Categoria();
            c.setIdcategoria(Integer.parseInt(request.getParameter("idcategoria")));
            Cor cor = new Cor();
            cor.setIdcor(Integer.parseInt(request.getParameter("idcor")));
            Tamanho t = new Tamanho();
            t.setIdtamanho(Integer.parseInt(request.getParameter("idtamanho")));
            Marca m = new Marca();
            m.setIdmarca(Integer.parseInt(request.getParameter("idmarca")));
            pr.setDescricao(request.getParameter("descricao"));
            double novovalor=0;
            if (request.getParameter("vlr_compra").isEmpty() == false) {
                novovalor = Double.parseDouble(request.getParameter("vlr_compra").replace(".", "").replace(",", "."));
            }
            pr.setVlr_compra(novovalor);
            double novovenda=0;
            if (request.getParameter("vlr_venda").isEmpty() == false) {
                novovenda = Double.parseDouble(request.getParameter("vlr_venda").replace(".", "").replace(",", "."));
            }
            pr.setVlr_venda(novovenda);
            pr.setQtde(Integer.parseInt(request.getParameter("qtde")));
            pr.setFornecedor(f);
            pr.setCategoria(c);
            pr.setCor(cor);
            pr.setTamanho(t);
            pr.setMarca(m);
            ProdutoDAO prDAO = new ProdutoDAO();
            if (prDAO.gravar(pr)) {
                mensagem = "Produto gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar Produto!";
            }
        }catch(Exception e) {
            mensagem = "Erro ao gravar Produto!";
            System.out.println("Erro ao Gravar produto: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_produto.jsp';");
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
