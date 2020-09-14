package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Tamanho;
import persistencia.TamanhoDAO;

/**
 *
 * @author Livia
 */
public class GerenciarTamanho extends HttpServlet {

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
            int idtamanho = Integer.parseInt(request.getParameter("idtamanho"));
            TamanhoDAO tDAO = new TamanhoDAO();
            if (request.getParameter("acao").equals("alterar")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    Tamanho t = tDAO.getTamanhoPorIdtamanho(idtamanho);
                    if (t.getIdtamanho() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_tamanho.jsp");
                        request.setAttribute("t", t);
                        disp.forward(request, response);
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Tamanho não encontrado!');");
                        out.println("location.href='listar_tamanho.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_tamanho.jsp';");
                    out.println("</script>");
                }
            }
            if (request.getParameter("acao").equals("excluir")) {
                if(GerenciarLogin.verificarPermissao(request, response)){
                    PrintWriter out = response.getWriter();
                    if (tDAO.excluir(idtamanho)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Tamanho excluido com sucesso!');");
                        out.println("location.href='listar_tamanho.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Não foi possível excluir Tamanho!');");
                        out.println("location.href='listar_tamanho.jsp';");
                        out.println("</script>");
                    }
                }else{
                    PrintWriter out = response.getWriter();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Acesso Negado!');");
                    out.println("location.href='listar_tamanho.jsp';");
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
            Tamanho t = new Tamanho();
            if (!request.getParameter("idtamanho").isEmpty()) {
                t.setIdtamanho(Integer.parseInt(request.getParameter("idtamanho")));
            }
            t.setNome(request.getParameter("nome"));
            TamanhoDAO tDAO = new TamanhoDAO();
            if (tDAO.gravar(t)) {
                mensagem = "Tamanho gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar Tamanho!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao gravar Tamanho!";
            System.out.println("Erro ao Gravar Tamanho: " + e.getMessage());
        }
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_tamanho.jsp';");
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
