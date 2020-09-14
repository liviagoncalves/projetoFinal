package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Categoria;

public class CategoriaDAO {
    private Connection conexao;
    public CategoriaDAO() {
        try {
            conexao = Conexao.criarConexao();
        } catch (Exception e) {
            System.out.println("Erro CategoriaDAO");
            System.out.println(e);
        }
    }
    public ArrayList<Categoria> getLista(){
        ArrayList<Categoria> resultado = new ArrayList<>();
        try {
            Statement stmt = conexao.createStatement();
            ResultSet rs = stmt.executeQuery("select * from categoria");
            while (rs.next()){
                Categoria c = new Categoria();
                c.setIdcategoria(rs.getInt("idcategoria"));
                c.setNome(rs.getString("nome"));
                resultado.add(c);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    public Categoria getCategoriaPorIdcategoria(int idcategoria){
        Categoria c = new Categoria();
        try {
            String sql = "SELECT * FROM categoria WHERE idcategoria=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idcategoria);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setIdcategoria(idcategoria);
                c.setNome(rs.getString("nome"));
            }
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return c;
    }
    public boolean gravar (Categoria c){
        try {
            String sql;
            if (c.getIdcategoria() == 0) {
                sql = "INSERT INTO categoria (nome) VALUES (?)";
            } else {
                sql = "UPDATE categoria SET nome=? WHERE idcategoria=?";
            }
            PreparedStatement ps =conexao.prepareStatement(sql);
            ps.setString(1, c.getNome());
            if (c.getIdcategoria() > 0) {
                ps.setInt(2, c.getIdcategoria());
            }
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir (int idcategoria){
        try{
            String sql = "DELETE FROM categoria WHERE idcategoria = ?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idcategoria);
            ps.execute();
            return true;
        }catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
}