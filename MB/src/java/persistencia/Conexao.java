package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/mbfashionfinal";
    private static final String USUARIO = "root";
    private static final String SENHA = "";
    private static Connection cn = null;
    public static Connection criarConexao() throws SQLException{
        if (cn == null) {
            try {
                Class.forName(DRIVER);
                System.out.println("Driver foi carregado");
                cn = DriverManager.getConnection(URL, USUARIO, SENHA);
                System.out.println("Conexão realizada com sucesso");
            } catch (ClassNotFoundException e) {
                System.out.println("Driver não foi localizado");
            }
        }
        return cn;
    }
}
