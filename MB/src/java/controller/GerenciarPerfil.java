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
import model.Perfil;
import persistencia.PerfilDAO;

/**
 *
 * @author Livia
 */
public class GerenciarPerfil extends HttpServlet {

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
            int idperfil = Integer.parseInt(request.getParameter("idperfil"));
            PerfilDAO pDAO = new PerfilDAO();
            if(request.getParameter("acao").equals("alterar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Perfil p = pDAO.getPerfilPorIdperfil(idperfil);
                    if (p.getIdperfil() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_perfil.jsp");
                        request.setAttribute("p", p);
                        disp.forward(request, response);
                    }else{
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Perfil não encontrado!');");
                        out.println("location.href='listar_perfil.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_perfil.jsp';");
                    out.println("</script>");
                }
            }
            if (request.getParameter("acao").equals("excluir")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    PrintWriter out = response.getWriter();
                    if (pDAO.excluir(idperfil)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Perfil excluido com sucesso!');");
                        out.println("location.href='listar_perfil.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Não foi possível excluir Perfil!');");
                        out.println("location.href='listar_perfil.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_perfil.jsp';");
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
            Perfil p = new Perfil();
            if(!request.getParameter("idperfil").isEmpty()){
                p.setIdperfil(Integer.parseInt(request.getParameter("idperfil")));
            }
            p.setNome(request.getParameter("nome"));
            PerfilDAO pDAO = new PerfilDAO();
            if (pDAO.gravar(p)) {
                mensagem = "Perfil gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar Perfil!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao gravar Perfil!";
            System.out.println("Erro ao Gravar Perfil: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_perfil.jsp';");
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
