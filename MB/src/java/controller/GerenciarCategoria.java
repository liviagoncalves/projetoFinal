package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Categoria;
import persistencia.CategoriaDAO;

/**
 *
 * @author Livia
 */
public class GerenciarCategoria extends HttpServlet {
    

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
            int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
            CategoriaDAO ctDAO = new CategoriaDAO();
            if (request.getParameter("acao").equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Categoria ct = ctDAO.getCategoriaPorIdcategoria(idcategoria);
                    if (ct.getIdcategoria() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_categoria.jsp");
                        request.setAttribute("ct", ct);
                        disp.forward(request, response);
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Categoria não encontrado!');");
                        out.println("location.href='listar_categoria.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_categoria.jsp';");
                    out.println("</script>");
                }
            }
             if (request.getParameter("acao").equals("excluir")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    PrintWriter out = response.getWriter();
                    if (ctDAO.excluir(idcategoria)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Categoria excluido com sucesso!');");
                        out.println("location.href='listar_categoria.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Não foi possível excluir Categoria!');");
                        out.println("location.href='listar_categoria.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_categoria.jsp';");
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
            Categoria ct = new Categoria();
            if (!request.getParameter("idcategoria").isEmpty()) {
                ct.setIdcategoria(Integer.parseInt(request.getParameter("idcategoria")));
            }
            ct.setNome(request.getParameter("nome"));
            CategoriaDAO ctDAO = new CategoriaDAO();
            if (ctDAO.gravar(ct)) {
                mensagem = "Categoria gravada com sucesso!";
            } else {
                mensagem = "Erro ao gravar Categoria!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao gravar Categoria!";
            System.out.println("Erro ao gravar Categoria: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_categoria.jsp';");
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
