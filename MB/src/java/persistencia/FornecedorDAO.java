package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Fornecedor;

public class FornecedorDAO {
    private Connection conexao;

    public FornecedorDAO() {
        try {
            conexao = Conexao.criarConexao();
        } catch (Exception e) {
            System.out.println("Erro FornecedorDAO");
            System.out.println(e);
        }
    }
    public ArrayList<Fornecedor> getLista(){
        ArrayList<Fornecedor> resultado = new ArrayList<>();
        try {
            Statement stmt = conexao.createStatement();
            ResultSet rs = stmt.executeQuery("select * from fornecedor");
            while (rs.next()) {                
                Fornecedor f = new Fornecedor();
                f.setIdfornecedor(rs.getInt("idfornecedor"));
                f.setRazao_social(rs.getString("razao_social"));
                f.setCnpj(rs.getString("cnpj"));
                f.setInscricao_estadual(rs.getString("inscricao_estadual"));
                f.setTelefone(rs.getString("telefone"));
                f.setCep(rs.getString("cep"));
                f.setEndereco(rs.getString("endereco"));
                f.setNumero(rs.getInt("numero"));
                f.setComplemento(rs.getString("complemento"));
                f.setBairro(rs.getString("bairro"));
                f.setCidade(rs.getString("cidade"));
                f.setUf(rs.getString("uf"));
                resultado.add(f);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    public Fornecedor getFornecedorPorIdfornecedor(int idfornecedor){
        Fornecedor f = new Fornecedor();
        try {
            String sql = "SELECT * FROM fornecedor WHERE idfornecedor=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idfornecedor);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                f.setIdfornecedor(idfornecedor);
                f.setRazao_social(rs.getString("razao_social"));
                f.setCnpj(rs.getString("cnpj"));
                f.setInscricao_estadual(rs.getString("inscricao_estadual"));
                f.setTelefone(rs.getString("telefone"));
                f.setCep(rs.getString("cep"));
                f.setEndereco(rs.getString("endereco"));
                f.setNumero(rs.getInt("numero"));
                f.setComplemento(rs.getString("complemento"));
                f.setBairro(rs.getString("bairro"));
                f.setCidade(rs.getString("cidade"));
                f.setUf(rs.getString("uf"));
            }
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return f;
    }
    public boolean gravar(Fornecedor f){
        try {
            String sql;
            if (f.getIdfornecedor() == 0) {
                sql = "INSERT INTO fornecedor ( "
                        + "razao_social, cnpj, "
                        + "inscricao_estadual, telefone, cep, "
                        + "endereco, numero, complemento, bairro, "
                        + "cidade, uf) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            } else {
                sql = "UPDATE fornecedor SET "
                        + "razao_social=?, "
                        + "cnpj=?, "
                        + "inscricao_estadual=?, "
                        + "telefone=?, "
                        + "cep=?, "
                        + "endereco=?, "
                        + "numero=?, "
                        + "complemento=?, "
                        + "bairro=?, "
                        + "cidade=?, "
                        + "uf=? "
                        + "WHERE idfornecedor=?";
            }
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, f.getRazao_social());
            ps.setString(2, f.getCnpj());
            ps.setString(3, f.getInscricao_estadual());
            ps.setString(4, f.getTelefone());
            ps.setString(5, f.getCep());
            ps.setString(6, f.getEndereco());
            ps.setInt(7, f.getNumero());
            ps.setString(8, f.getComplemento());
            ps.setString(9, f.getBairro());
            ps.setString(10, f.getCidade());
            ps.setString(11, f.getUf());
            if (f.getIdfornecedor() > 0) {
                ps.setInt(12, f.getIdfornecedor());
            }
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir(int idfornecedor){
        try {
            String sql = "DELETE FROM fornecedor WHERE idfornecedor=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idfornecedor);
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
}
