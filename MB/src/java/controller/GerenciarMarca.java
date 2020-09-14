package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Marca;
import persistencia.MarcaDAO;

/**
 *
 * @author Livia
 */
public class GerenciarMarca extends HttpServlet {

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
            int idmarca = Integer.parseInt(request.getParameter("idmarca"));
            MarcaDAO mDAO = new MarcaDAO();
            if (request.getParameter("acao").equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Marca m = mDAO.getMarcaPorIdmarca(idmarca);
                    if (m.getIdmarca() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_marca.jsp");
                        request.setAttribute("m", m);
                        disp.forward(request, response);
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Marca não encontrado!');");
                        out.println("location.href='listar_marca.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_marca.jsp';");
                    out.println("</script>");
                }
            }
            if (request.getParameter("acao").equals("excluir")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    PrintWriter out = response.getWriter();
                    if (mDAO.excluir(idmarca)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Marca excluido com sucesso!');");
                        out.println("location.href='listar_marca.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Não foi possível excluir Marca!');");
                        out.println("location.href='listar_marca.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_marca.jsp';");
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
            Marca m = new Marca();
            if (!request.getParameter("idmarca").isEmpty()) {
                m.setIdmarca(Integer.parseInt(request.getParameter("idmarca")));
            }
            m.setNome(request.getParameter("nome"));
            MarcaDAO mDAO = new MarcaDAO();
            if (mDAO.gravar(m)) {
                mensagem = "Marca gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar Marca!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao gravar Marca!";
            System.out.println("Erro ao Gravar Marca: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_marca.jsp';");
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
