package persistencia;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Cliente;

public class ClienteDAO {
    private Connection conexao;
    public ClienteDAO() {
        try {
            conexao = Conexao.criarConexao();
        } catch (Exception e) {
            System.out.println("Erro ClienteDAO");
            System.out.println(e);
        }
    }
    public ArrayList<Cliente> getLista(){
        ArrayList<Cliente> resultado = new ArrayList<>();
        try {
            Statement stmt = conexao.createStatement();
            ResultSet rs = stmt.executeQuery("select * from cliente");
            while(rs.next()){
                Cliente c = new Cliente();
                c.setIdcliente(rs.getInt("idcliente"));
                c.setNome(rs.getString("nome"));
                c.setEmail(rs.getString("email"));
                c.setCpf(rs.getString("cpf"));
                c.setRg(rs.getString("rg"));
                c.setData_nasc(rs.getDate("data_nasc"));
                c.setSexo(rs.getString("sexo"));
                c.setTelefone(rs.getString("telefone"));
                c.setCep(rs.getString("cep"));
                c.setEndereco(rs.getString("endereco"));
                c.setNumero(rs.getInt("numero"));
                c.setComplemento(rs.getString("complemento"));
                c.setBairro(rs.getString("bairro"));
                c.setCidade(rs.getString("cidade"));
                c.setUf(rs.getString("uf"));
                c.setCliente_desde(rs.getDate("cliente_desde"));
                c.setFidelidade(rs.getString("fidelidade"));
                c.setPromocao(rs.getString("promocao"));
                resultado.add(c);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    public Cliente getClientePorIdcliente (int idcliente){
        Cliente c = new Cliente();
        try {
            String sql = "SELECT * FROM cliente WHERE idcliente=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idcliente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                c.setIdcliente(idcliente);
                c.setNome(rs.getString("nome"));
                c.setEmail(rs.getString("email"));
                c.setCpf(rs.getString("cpf"));
                c.setRg(rs.getString("rg"));
                c.setData_nasc(rs.getDate("data_nasc"));
                c.setSexo(rs.getString("sexo"));
                c.setTelefone(rs.getString("telefone"));
                c.setCep(rs.getString("cep"));
                c.setEndereco(rs.getString("endereco"));
                c.setNumero(rs.getInt("numero"));
                c.setComplemento(rs.getString("complemento"));
                c.setBairro(rs.getString("bairro"));
                c.setCidade(rs.getString("cidade"));
                c.setUf(rs.getString("uf"));
                c.setCliente_desde(rs.getDate("cliente_desde"));
                c.setFidelidade(rs.getString("fidelidade"));
                c.setPromocao(rs.getString("promocao"));
            }
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return c;
    }
    public boolean gravar(Cliente c){
        try {
            String sql;
            if (c.getIdcliente() == 0) {
                sql = "INSERT INTO cliente (nome, email, cpf, rg, data_nasc, "
                        + "sexo, telefone, cep, endereco, numero, "
                        + "complemento, bairro, cidade, uf, cliente_desde, "
                        + "fidelidade, promocao) "
                        + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            } else {
                sql = "UPDATE cliente SET "
                        + "nome=?, "
                        + "email=?, "
                        + "cpf=?, "
                        + "rg=?, "
                        + "data_nasc=?, "
                        + "sexo=?, "
                        + "telefone=?, "
                        + "cep=?, "
                        + "endereco=?, "
                        + "numero=?, "
                        + "complemento=?, "
                        + "bairro=?, "
                        + "cidade=?, "
                        + "uf=?, "
                        + "cliente_desde=?, "
                        + "fidelidade=?, "
                        + "promocao=? "
                        + "WHERE idcliente=?";
            }
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, c.getNome());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getCpf());
            ps.setString(4, c.getRg());
            ps.setDate(5, new Date(c.getData_nasc().getTime()));
            ps.setString(6, c.getSexo());
            ps.setString(7, c.getTelefone());
            ps.setString(8, c.getCep());
            ps.setString(9, c.getEndereco());
            ps.setInt(10, c.getNumero());
            ps.setString(11, c.getComplemento());
            ps.setString(12, c.getBairro());
            ps.setString(13, c.getCidade());
            ps.setString(14, c.getUf());
            ps.setDate(15, new Date(c.getCliente_desde().getTime()));
            ps.setString(16, c.getFidelidade());
            ps.setString(17, c.getPromocao());
            if (c.getIdcliente() > 0) {
                ps.setInt(18, c.getIdcliente());
            }
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir (int idcliente){
        try {
            String sql = "DELETE FROM cliente WHERE idcliente=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idcliente);
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
}
