/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ItensVendas;
import model.Produto;
import model.Vendas;
import persistencia.ProdutoDAO;

/**
 *
 * @author Livia
 */
public class GerenciarCarrinho extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCarrinho</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            try {
                Vendas v = (Vendas) session.getAttribute("venda");
                ArrayList<ItensVendas> carrinho = v.getCarrinho();
                String acao = request.getParameter("acao");
                ProdutoDAO pDAO = new ProdutoDAO();
                if (acao.equals("add")) {
                    Produto p = new Produto();
                    int idproduto = Integer.parseInt(request.getParameter("idproduto"));
                    p = pDAO.getProdutoPorIdproduto(idproduto);
                    int qtde = Integer.parseInt(request.getParameter("qtde"));
                    ItensVendas iv = new ItensVendas();
                    iv.setProduto(p);
                    iv.setQtde(qtde);
                    iv.setVlr_venda(p.getVlr_venda());
                    carrinho.add(iv);
                    v.setCarrinho(carrinho);
                    session.setAttribute("venda", v);
                    response.sendRedirect("form_vendas.jsp?acao=c");
                }else if (acao.equals("excluir")) {
                    int index = Integer.parseInt(request.getParameter("index"));
                    carrinho.remove(index);
                    v.setCarrinho(carrinho);
                    session.setAttribute("venda", v);
                    response.sendRedirect("form_finalizar_venda.jsp");
                }
            } catch (Exception e) {
                out.print(e);
            }
            out.println("<h1>Servlet GerenciarCarrinho at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
