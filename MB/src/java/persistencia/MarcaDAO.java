package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Marca;

public class MarcaDAO {
    private Connection conexao;
    public MarcaDAO() {
        try {
            conexao = Conexao.criarConexao();
        } catch (Exception e) {
            System.out.println("Erro MarcaDAO");
            System.out.println(e);
        }
    }
    public ArrayList<Marca> getLista(){
        ArrayList<Marca> resultado = new ArrayList<>();
        try {
            Statement stmt = conexao.createStatement();
            ResultSet rs = stmt.executeQuery("select * from marca");
            while (rs.next()) {                
                Marca m = new Marca();
                m.setIdmarca(rs.getInt("idmarca"));  
                m.setNome(rs.getString("nome"));
                resultado.add(m);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    public Marca getMarcaPorIdmarca(int idmarca){
        Marca m = new Marca();
        try {
            String sql = "SELECT * FROM marca WHERE idmarca=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idmarca);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                m.setIdmarca(idmarca);
                m.setNome(rs.getString("nome"));
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return m;
    }
    public boolean gravar (Marca m){
        try {
            String sql;
            if (m.getIdmarca() == 0) {
                sql = "INSERT INTO marca (nome) VALUES (?)";
            } else {
                sql = "UPDATE marca SET nome=? WHERE idmarca=?";
            }
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, m.getNome());
            if (m.getIdmarca() > 0) {
                ps.setInt(2, m.getIdmarca());
            }
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir (int idmarca){
        try {
            String sql = "DELETE FROM marca WHERE idmarca = ?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idmarca);
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    } 
}
