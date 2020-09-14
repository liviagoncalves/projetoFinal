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
import model.Usuario;
import persistencia.UsuarioDAO;

/**
 *
 * @author Livia
 */
public class GerenciarUsuario extends HttpServlet {
    
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
           int idusuario = Integer.parseInt(request.getParameter("idusuario"));
            UsuarioDAO uDAO = new UsuarioDAO();
            if (request.getParameter("acao").equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Usuario u = uDAO.getUsuarioPorIdusuario(idusuario);
                    if (u.getIdusuario() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_usuario.jsp");
                        request.setAttribute("u", u);
                        disp.forward(request, response);
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Usuário não encontrado!');");
                        out.println("location.href='listar_usuario.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_usuario.jsp';");
                    out.println("</script>");
                }
            }
            if (request.getParameter("acao").equals("excluir")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    PrintWriter out = response.getWriter();
                    if (uDAO.excluir(idusuario)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Usuário desativado com sucesso!');");
                        out.println("location.href='listar_usuario.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Não foi possível desativa Usuário!');");
                        out.println("location.href='listar_usuario.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_usuario.jsp';");
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
            Usuario u = new Usuario();
            if(!request.getParameter("idusuario").isEmpty()){
                u.setIdusuario(Integer.parseInt(request.getParameter("idusuario")));
            }
            Perfil perfil = new Perfil();
            perfil.setIdperfil(Integer.parseInt(request.getParameter("idperfil")));
            u.setNome(request.getParameter("nome"));
            u.setLogin(request.getParameter("login"));
            u.setSenha(request.getParameter("senha"));
            u.setStatus(Integer.parseInt(request.getParameter("status")));
            u.setPerfil(perfil);
            UsuarioDAO uDAO = new UsuarioDAO();
            if (uDAO.gravar(u)) {
                mensagem = "Usuário gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar Usuário!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao gravar Usuário!";
            System.out.println("Erro ao Gravar usuário: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_usuario.jsp';");
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
