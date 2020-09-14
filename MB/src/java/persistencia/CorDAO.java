package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Cor;

public class CorDAO {
    private Connection conexao;
    public CorDAO() {
        try {
            conexao = Conexao.criarConexao();
        } catch (Exception e) {
            System.out.println("Erro CorDAO");
            System.out.println(e);
        }
    }
    public ArrayList<Cor> getLista(){
        ArrayList<Cor> resultado = new ArrayList<>();
        try {
            Statement stmt = conexao.createStatement();
            ResultSet rs = stmt.executeQuery("select * from cor");
            while (rs.next()) {                
                Cor c = new Cor();
                c.setIdcor(rs.getInt("idcor"));
                c.setNome(rs.getString("nome"));
                resultado.add(c);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    public Cor getCorPorIdcor(int idcor){
        Cor c = new Cor();
        try {
            String sql = "SELECT * FROM cor WHERE idcor=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idcor);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setIdcor(idcor);
                c.setNome(rs.getString("nome"));
            }
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return c;
    }
    public boolean gravar (Cor c){
        try {
            String sql;
            if (c.getIdcor() == 0) {
                sql = "INSERT INTO cor (nome) VALUES (?)";
            } else {
                sql = "UPDATE cor SET nome=? WHERE idcor=?";
            }
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, c.getNome());
            if (c.getIdcor() > 0) {
                ps.setInt(2, c.getIdcor());
            }
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir (int idcor){
        try {
            String sql = "DELETE FROM cor WHERE idcor=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idcor);
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
}
