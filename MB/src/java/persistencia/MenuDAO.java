package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Menu;

public class MenuDAO{
    private Connection conexao;

    public MenuDAO() {
        try{
            conexao = Conexao.criarConexao();
        }catch(Exception e){
            System.out.println("Erro MenuDAO");
            System.out.println(e);
        }
    }
    public ArrayList<Menu> getLista(){
        ArrayList<Menu> resultado = new ArrayList<>();
        try {
            Statement stmt = conexao.createStatement();
            ResultSet rs = stmt.executeQuery("select * from menu");
            while (rs.next()) {                
                Menu m = new Menu();
                m.setIdmenu(rs.getInt("idmenu"));
                m.setNome(rs.getString("nome"));
                m.setLink(rs.getString("link"));
                m.setIcone(rs.getString("icone"));
                m.setExibir(rs.getInt("exibir"));
                resultado.add(m);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    public Menu getMenuPorIdmenu(int idmenu){
        Menu m = new Menu();
        try {
            String sql = "SELECT * FROM menu WHERE idmenu=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idmenu);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                m.setIdmenu(idmenu);
                m.setNome(rs.getString("nome"));
                m.setLink(rs.getString("link"));
                m.setIcone(rs.getString("icone"));
                m.setExibir(rs.getInt("exibir"));
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return m;
    }
    public boolean gravar(Menu m){
        try {
            String sql;
            if (m.getIdmenu() == 0) {
                sql = "INSERT INTO menu (nome, link, icone, exibir) VALUES (?,?,?,?)";
            }else{
                sql = "UPDATE menu SET nome=?, link=?, icone=?, exibir=? WHERE idmenu=?";
            }
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, m.getNome());
            ps.setString(2, m.getLink());
            ps.setString(3, m.getIcone());
            ps.setInt(4, m.getExibir());
            if (m.getIdmenu() > 0) {
                ps.setInt(5, m.getIdmenu());
            }
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir (int idmenu){
        try {
            String sql = "DELETE FROM menu WHERE idmenu=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idmenu);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
}
