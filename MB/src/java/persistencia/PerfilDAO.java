package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Menu;
import model.Perfil;

public class PerfilDAO {
    private Connection conexao;
    public PerfilDAO(){
        try{
            conexao = Conexao.criarConexao();
        }catch(Exception e){
            System.out.println("Erro PerfilDAO");
            System.out.println(e);
        }
    }
    public ArrayList<Perfil> getLista(){
        ArrayList<Perfil> resultado = new ArrayList<>();
        try {
            Statement stmt = conexao.createStatement();
            ResultSet rs = stmt.executeQuery("select * from perfil");
            while (rs.next()) {                
                Perfil p = new Perfil();
                p.setIdperfil(rs.getInt("idperfil"));
                p.setNome(rs.getString("nome"));
                resultado.add(p);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    
    public Perfil getPerfilPorIdperfil(int idperfil){
        Perfil p = new Perfil();
        try {
            String sql = "SELECT * FROM perfil WHERE idperfil=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idperfil);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p.setIdperfil(idperfil);
                p.setNome(rs.getString("nome"));
                p.setMenu(menuVinculadosPorPerfil(idperfil));
                p.setNaoMenu(menuNaoVinculadosPorPerfil(idperfil));
            }
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return p;
    }
    
    public boolean gravar(Perfil p){
        try {
            String sql;
            if (p.getIdperfil() == 0) {
                sql = "INSERT INTO perfil (nome) VALUES (?)";
            } else {
                sql = "UPDATE perfil SET nome=? WHERE idperfil=?";
            }
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, p.getNome());
            if (p.getIdperfil() > 0) {
                ps.setInt(2, p.getIdperfil());
            }
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir (int idperfil){
        try {
            String sql = "DELETE FROM perfil WHERE idperfil = ?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idperfil);
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public ArrayList<Menu> menuVinculadosPorPerfil(int idperfil){
        ArrayList<Menu> lista = new ArrayList<Menu>();
        try {
            String sql = "SELECT m.* FROM menu_perfil as mp, menu as m "
                    + "WHERE mp.idmenu = m.idmenu AND mp.idperfil = ?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idperfil);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                Menu m = new Menu();
                m.setIdmenu(rs.getInt("m.idmenu"));
                m.setNome(rs.getString("m.nome"));
                m.setLink(rs.getString("m.link"));
                m.setIcone(rs.getString("m.icone"));
                m.setExibir(rs.getInt("m.exibir"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return lista;
    }
    public boolean vincular(int idmenu, int idperfil){
        try {
            String sql = "INSERT INTO menu_perfil(idmenu, idperfil) "
                    + "VALUES (?,?)";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idmenu);
            ps.setInt(2, idperfil);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public ArrayList<Menu> menuNaoVinculadosPorPerfil(int idperfil){
        ArrayList<Menu> lista = new ArrayList<Menu>();
        try {
            String sql = "SELECT m.* FROM menu as m "
                    + "WHERE m.idmenu NOT IN "
                    + "(SELECT mp.idmenu FROM menu_perfil as mp "
                    + "WHERE mp.idperfil=?)";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idperfil);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                Menu m = new Menu();
                m.setIdmenu(rs.getInt("m.idmenu"));
                m.setNome(rs.getString("m.nome"));
                m.setLink(rs.getString("m.link"));
                m.setIcone(rs.getString("m.icone"));
                m.setExibir(rs.getInt("m.exibir"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return lista;
    }
    public boolean desvincular(int idmenu, int idperfil){
        try {
            String sql = "DELETE FROM menu_perfil "
                    + "WHERE idmenu=? AND idperfil=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idmenu);
            ps.setInt(2, idperfil);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
}