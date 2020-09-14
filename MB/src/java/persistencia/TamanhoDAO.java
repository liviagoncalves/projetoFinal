package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Tamanho;

public class TamanhoDAO {
    private Connection conexao;
    public TamanhoDAO() {
        try {
            conexao = Conexao.criarConexao();
        } catch (Exception e) {
            System.out.println("Erro TamanhoDAO");
            System.out.println(e);
        }
    }
    public ArrayList<Tamanho> getLista(){
        ArrayList<Tamanho> resultado = new ArrayList<>();
        try {
            Statement stmt = conexao.createStatement();
            ResultSet rs = stmt.executeQuery("select * from tamanho");
            while (rs.next()) {                
                Tamanho t = new Tamanho();
                t.setIdtamanho(rs.getInt("idtamanho"));
                t.setNome(rs.getString("nome"));
                resultado.add(t);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    public Tamanho getTamanhoPorIdtamanho(int idtamanho){
        Tamanho t = new Tamanho();
        try {
            String sql = "SELECT * FROM tamanho WHERE idtamanho=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idtamanho);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                t.setIdtamanho(idtamanho);
                t.setNome(rs.getString("nome"));
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return t;
    }
    public boolean gravar (Tamanho t){
        try {
            String sql;
            if (t.getIdtamanho() == 0) {
                sql = "INSERT INTO tamanho (nome) VALUES (?)";
            } else {
                sql = "UPDATE tamanho SET nome=? WHERE idtamanho=?";
            }
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, t.getNome());
            if (t.getIdtamanho() > 0) {
                ps.setInt(2, t.getIdtamanho());
            }
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir(int idtamanho){
        try {
            String sql = "DELETE FROM tamanho WHERE idtamanho=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idtamanho);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
}
