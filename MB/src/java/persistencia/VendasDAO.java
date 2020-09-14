package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.ItensVendas;
import model.Vendas;

public class VendasDAO {
    private Connection conexao;

    public VendasDAO() {
        try {
            conexao = Conexao.criarConexao();
        } catch (Exception e) {
            System.out.println("Erro VendaDAO");
            System.out.println(e);
        }
    }
    
    public ArrayList<Vendas>getLista(){
        ArrayList<Vendas> resultado = new ArrayList<Vendas>();
        try {
            String sql = "SELECT * FROM vendas ";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                Vendas v = new Vendas();
                v.setIdvendas(rs.getInt("idvendas"));
                v.setData_venda(rs.getDate("data_venda"));
                v.setVlr_total(rs.getDouble("vlr_total"));
                UsuarioDAO uDAO = new UsuarioDAO();
                v.setUsuario(uDAO.getUsuarioPorIdusuario(rs.getInt("idusuario")));
                ClienteDAO cDAO = new ClienteDAO();
                v.setCliente(cDAO.getClientePorIdcliente(rs.getInt("idcliente")));
                resultado.add(v);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    
    public boolean registrar(Vendas v){
        try {
            String sql = "INSERT INTO vendas (data_venda, vlr_total, "
                    + "idusuario, idcliente) "
                    + "VALUES (now(),?,?,?)";
            PreparedStatement ps = conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, v.getVlr_total());
            ps.setInt(2, v.getUsuario().getIdusuario());
            ps.setInt(3, v.getCliente().getIdcliente());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                v.setIdvendas(rs.getInt(1));
            }
            for (ItensVendas i: v.getCarrinho()) {
                String sql_itens = "INSERT INTO itens_de_venda(idvendas, idproduto, "
                        + "vlr_venda, qtde) "
                        + "VALUES (?,?,?,?)";
                PreparedStatement ps_itens = conexao.prepareCall(sql_itens);
                ps_itens.setInt(1, v.getIdvendas());
                ps_itens.setInt(2, i.getProduto().getIdproduto());
                ps_itens.setDouble(3, i.getVlr_venda());
                ps_itens.setInt(4, i.getQtde());
                ps_itens.execute();
            }
            return true;
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public void excluir(int idproduto){
        try {
            String sql = "DELETE FROM produto WHERE idproduto=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idproduto);
            ps.execute();
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
    }
    public Vendas getVendasPoridvendas(int idvendas){
        Vendas v = new Vendas();
        try {
            String sql = " SELECT * FROM vendas WHERE idvendas=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idvendas);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                v.setIdvendas(rs.getInt("idvendas"));
                v.setData_venda(rs.getDate("data_venda"));
                v.setVlr_total(rs.getDouble("vlr_total"));
                UsuarioDAO uDAO = new UsuarioDAO();
                v.setUsuario(uDAO.getUsuarioPorIdusuario(rs.getInt("idusuario")));
                ClienteDAO cDAO = new ClienteDAO();
                v.setCliente(cDAO.getClientePorIdcliente(rs.getInt("idcliente")));
                v.setCarrinho(this.itensVenda(idvendas));
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return v;
    }
    public ArrayList<ItensVendas> itensVenda(int idvendas){
        ArrayList<ItensVendas> resultado = new ArrayList<ItensVendas>();
        try {
            String sql = "SELECT * FROM itens_de_vendas WHERE idvenda=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idvendas);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                ItensVendas iv = new ItensVendas();
                iv.setIditens(rs.getInt("idvendas"));
                ProdutoDAO pDAO = new ProdutoDAO();
                iv.setProduto(pDAO.getProdutoPorIdproduto(rs.getInt("idproduto")));
                iv.setVlr_venda(rs.getDouble("vlr_venda"));
                iv.setQtde(rs.getInt("qtde"));
                
                resultado.add(iv);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
}
