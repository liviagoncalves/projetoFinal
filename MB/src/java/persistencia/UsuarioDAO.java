package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Perfil;
import model.Usuario;

public class UsuarioDAO {
    private Connection conexao;

    public UsuarioDAO() {
        try {
            conexao = Conexao.criarConexao();
        } catch (Exception e) {
            System.out.println("Erro UsuarioDAO");
            System.out.println(e);
        }
    }
    public ArrayList<Usuario> getLista(){
        ArrayList<Usuario> resultado = new ArrayList<>();
        try {
            String sql = "SELECT u.*, p.nome FROM usuario u "
                    + "INNER JOIN perfil p ON p.idperfil = u.idperfil ";
            Statement stm = conexao.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                Usuario u = new Usuario();
                u.setIdusuario(rs.getInt("u.idusuario"));
                u.setNome(rs.getString("u.nome"));
                u.setLogin(rs.getString("u.login"));
                u.setSenha(rs.getString("u.senha"));
                u.setStatus(rs.getInt("u.status"));
                Perfil p = new Perfil();
                p.setIdperfil(rs.getInt("u.idperfil"));
                p.setNome(rs.getString("p.nome"));
                u.setPerfil(p);
                resultado.add(u);
            }
        } catch (Exception e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return resultado;
    }
    public Usuario getUsuarioPorIdusuario(int idusuario){
        Usuario u = new Usuario();
        try {
            String sql = "SELECT u.*, p.nome FROM usuario u "
                    + "INNER JOIN perfil p ON p.idperfil = u.idperfil "
                    + "WHERE u.idusuario=?";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1,idusuario);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                u.setIdusuario(rs.getInt("u.idusuario"));
                u.setNome(rs.getString("u.nome"));
                u.setLogin(rs.getString("u.login"));
                u.setSenha(rs.getString("u.senha"));
                u.setStatus(rs.getInt("u.status"));
                Perfil p = new Perfil();
                p.setIdperfil(rs.getInt("u.idperfil"));
                p.setNome(rs.getString("p.nome"));
                u.setPerfil(p);
            }
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return u;
    }
    public boolean gravar(Usuario u){
        try {
            String sql;
            if(u.getIdusuario()==0){
                sql = "INSERT INTO usuario (nome, login, senha, status, idperfil) "
                + "VALUES (?,?,?,?,?)";
            }else{
                sql = "UPDATE usuario SET nome=?, login=?, senha=?, status=?, idperfil=? "
                        + " WHERE idusuario=?";
            }
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, u.getNome());
            ps.setString(2, u.getLogin());
            ps.setString(3, u.getSenha());
            ps.setInt(4, u.getStatus());
            ps.setInt(5, u.getPerfil().getIdperfil());
            if(u.getIdusuario() > 0){
                ps.setInt(6, u.getIdusuario());
            }
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public boolean excluir(int idusuario){
        try{
            //desativar usuario
            String sql = "UPDATE usuario SET status=2 WHERE idusuario=? ";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setInt(1, idusuario);
            ps.execute();
            return true;
        }catch(SQLException e){
            System.out.println("Erro de SQL: " + e.getMessage());
            return false;
        }
    }
    public Usuario getRecuperarUsuario (String login){
        Usuario u = new Usuario();
        try {
            String sql = "SELECT u.* FROM usuario u "
                    + "WHERE u.login=? AND u.status=1";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, login);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                u.setIdusuario(rs.getInt("u.idusuario"));
                u.setNome(rs.getString("u.nome"));
                u.setLogin(rs.getString("u.login"));
                u.setSenha(rs.getString("u.senha"));
                u.setStatus(rs.getInt("u.status"));
                PerfilDAO pDAO = new PerfilDAO();
                u.setPerfil(pDAO.getPerfilPorIdperfil(rs.getInt("u.idperfil")));
            }
            rs.close();
            ps.close();
            return u;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
}
