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
import model.Menu;
import persistencia.MenuDAO;

/**
 *
 * @author Livia
 */
public class GerenciarMenu extends HttpServlet {

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
            int idmenu = Integer.parseInt(request.getParameter("idmenu"));
            MenuDAO mDAO = new MenuDAO();
            if (request.getParameter("acao").equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Menu m = mDAO.getMenuPorIdmenu(idmenu);
                    if (m.getIdmenu() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_menu.jsp");
                        request.setAttribute("m", m);
                        disp.forward(request, response);
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Menu não encontrado!');");
                        out.println("location.href='listar_menu.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_menu.jsp';");
                    out.println("</script>");
                }
            }
            if (request.getParameter("acao").equals("excluir")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    PrintWriter out = response.getWriter();
                    if (mDAO.excluir(idmenu)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Menu excluido com sucesso!');");
                        out.println("location.href='listar_menu.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Não foi possível excluir menu!');");
                        out.println("location.href='listar_menu.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_menu.jsp';");
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
            Menu m = new Menu();
            if (!request.getParameter("idmenu").isEmpty()) {
                m.setIdmenu(Integer.parseInt(request.getParameter("idmenu")));
            }
            m.setNome(request.getParameter("nome"));
            m.setLink(request.getParameter("link"));
            m.setIcone(request.getParameter("icone"));
            m.setExibir(Integer.parseInt(request.getParameter("exibir")));
            MenuDAO mDAO = new MenuDAO();
            if (mDAO.gravar(m)) {
                mensagem = "Menu gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar Menu!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao gravar Menu!";
            System.out.println("Erro ao Gravar Menu: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_menu.jsp';");
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
