package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Categoria;
import model.Cor;
import model.Fornecedor;
import model.Marca;
import model.Produto;
import model.Tamanho;

public class ProdutoDAO {
    private Connection conexao;

    public ProdutoDAO() {
        try {
            conexao = Conexao.criarConexao();
        } catch (Exception e) {
            System.out.println("Erro ProdutoDAO");
            System.out.println(e);
        }
    }
   
    public ArrayList<Produto>getLista(){
        ArrayList<Produto> resultado = new ArrayList<>();
        try {
            String sql = "SELECT pr.*, f.razao_social, c.nome, cor.nome, "
                    + "t.nome, m.nome FROM produto pr "
                    + "INNER JOIN fornecedor f ON f.idfornecedor = pr.idfornecedor "
                    + "INNER JOIN categoria c ON c.idcategoria = pr.idcategoria "
                    + "INNER JOIN cor cor ON cor.idcor = pr.idcor "
                    + "INNER JOIN tamanho t ON t.idtamanho = pr.idtamanho "
                    + "INNER JOIN marca m ON m.idmarca = pr.idmarca";
            Statement stm = conexao.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {                
                Produto pr = new Produto();
                pr.setIdproduto(rs.getInt("idproduto"));
                pr.setDescricao(rs.getString("descricao"));
                pr.setVlr_compra(rs.getDouble("vlr_compra"));
                pr.setVlr_venda(rs.getDouble("vlr_venda"));
                pr.setQtde(rs.getInt("qtde"));
                Fornecedor f = new Fornecedor();
                f.setIdfornecedor(rs.getInt("pr.idfornecedor"));
                f.setRazao_social(rs.getString("f.razao_social"));
                pr.setFornecedor(f);
                Categoria c = new Categoria();
                c.setIdcategoria(rs.getInt("pr.idcategoria"));
                c.setNome(rs.getString("c.nome"));
                pr.setCategoria(c);
                Cor cor = new Cor();
                cor.setIdcor(rs.getInt("pr.idcor"));
                cor.setNome(rs.getString("cor.nome"));
                pr.setCor(cor);
                Tamanho t = new Tamanho();
                t.setIdtamanho(rs.getInt("pr.idtamanho"));
                t.setNome(rs.getString("t.nome"));
                pr.setTamanho(t);
                Marca m = new Marca();
                m.setIdmarca(rs.getInt("pr.idmarca"));
                m.setNome(rs.getString("m.nome"));
                pr.setMarca(m);
                resultado.add(pr);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    public Produto getProdutoPorIdproduto (int idproduto){
        Produto pr = new Produto();
        try {
            String sql = "SELECT pr.*, f.razao_social, c.nome, cor.nome, "
                    + "t.nome, m.nome FROM produto pr "
                    + "INNER JOIN fornecedor f ON f.idfornecedor = pr.idfornecedor "
                    + "INNER JOIN categoria c ON c.idcategoria = pr.idcategoria "
                    + "INNER JOIN cor cor ON cor.idcor = pr.idcor "
                    + "INNER JOIN tamanho t ON t.idtamanho = pr.idtamanho "
                    + "INNER JOIN marca m ON m.idmarca = pr.idmarca "
                    + "WHERE pr.idproduto=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idproduto);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pr.setIdproduto(rs.getInt("pr.idproduto"));
                pr.setDescricao(rs.getString("pr.descricao"));
                pr.setVlr_compra(rs.getDouble("pr.vlr_compra"));
                pr.setVlr_venda(rs.getDouble("pr.vlr_venda"));
                pr.setQtde(rs.getInt("pr.qtde"));
                Fornecedor f = new Fornecedor();
                f.setIdfornecedor(rs.getInt("pr.idfornecedor"));
                f.setRazao_social(rs.getString("f.razao_social"));
                pr.setFornecedor(f);
                Categoria c = new Categoria();
                c.setIdcategoria(rs.getInt("pr.idcategoria"));
                c.setNome(rs.getString("c.nome"));
                pr.setCategoria(c);
                Cor cor = new Cor();
                cor.setIdcor(rs.getInt("pr.idcor"));
                cor.setNome(rs.getString("cor.nome"));
                pr.setCor(cor);
                Tamanho t = new Tamanho();
                t.setIdtamanho(rs.getInt("pr.idtamanho"));
                t.setNome(rs.getString("t.nome"));
                pr.setTamanho(t);
                Marca m = new Marca();
                m.setIdmarca(rs.getInt("pr.idmarca"));
                m.setNome(rs.getString("m.nome"));
                pr.setMarca(m);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return pr;
    }
    public boolean gravar(Produto pr){
        try {
            String sql;
            if (pr.getIdproduto() == 0) {
                sql = "INSERT INTO produto(descricao, vlr_compra, vlr_venda, "
                        + "qtde, idfornecedor, idcategoria, "
                        + "idcor, idtamanho, idmarca) "
                        + "VALUES (?,?,?,?,?,?,?,?,?)";
            } else {
                sql = "UPDATE produto SET "
                        + "descricao=?, "
                        + "vlr_compra=?, "
                        + "vlr_venda=?, "
                        + "qtde=?, "
                        + "idfornecedor=?, "
                        + "idcategoria=?, "
                        + "idcor=?, "
                        + "idtamanho=?, "
                        + "idmarca=? "
                        + "WHERE idproduto=?";
            }
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, pr.getDescricao());
            ps.setDouble(2, pr.getVlr_compra());
            ps.setDouble(3, pr.getVlr_venda());
            ps.setInt(4, pr.getQtde());
            ps.setInt(5, pr.getFornecedor().getIdfornecedor());
            ps.setInt(6, pr.getCategoria().getIdcategoria());
            ps.setInt(7, pr.getCor().getIdcor());
            ps.setInt(8, pr.getTamanho().getIdtamanho());
            ps.setInt(9, pr.getMarca().getIdmarca());
            if (pr.getIdproduto() > 0) {
                ps.setInt(10, pr.getIdproduto());
            }
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir (int idproduto){
        try {
            String sql = "DELETE FROM produto WHERE idproduto=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idproduto);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
}
