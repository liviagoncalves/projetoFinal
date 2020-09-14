package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cor;
import persistencia.CorDAO;

/**
 *
 * @author Livia
 */
public class GerenciarCor extends HttpServlet {


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
            int idcor = Integer.parseInt(request.getParameter("idcor"));
            CorDAO cDAO = new CorDAO();
            if (request.getParameter("acao").equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Cor c = cDAO.getCorPorIdcor(idcor);
                    if (c.getIdcor() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_cor.jsp");
                        request.setAttribute("cor", c);
                        disp.forward(request, response);
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Cor não encontrado!');");
                        out.println("location.href='listar_cor.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_cor.jsp';");
                    out.println("</script>");
                }
            }
            if (request.getParameter("acao").equals("excluir")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    PrintWriter out = response.getWriter();
                    if (cDAO.excluir(idcor)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Cor excluido com sucesso!');");
                        out.println("location.href='listar_cor.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Não foi possível excluir Cpr!');");
                        out.println("location.href='listar_cor.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_cor.jsp';");
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
            Cor c = new Cor();
            if (!request.getParameter("idcor").isEmpty()) {
                c.setIdcor(Integer.parseInt(request.getParameter("idcor")));
            }
            c.setNome(request.getParameter("nome"));
            CorDAO cDAO = new CorDAO();
            if (cDAO.gravar(c)) {
                mensagem = "Cor gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar Cor!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao gravar Cor!";
            System.out.println("Erro ao Gravar Cor: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_cor.jsp';");
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
