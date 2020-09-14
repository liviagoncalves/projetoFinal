package model;
public class Marca {
    private int idmarca;
    private String nome;

    public Marca() {
    }

    public Marca(int idmarca, String nome) {
        this.idmarca = idmarca;
        this.nome = nome;
    }

    public int getIdmarca() {
        return idmarca;
    }

    public void setIdmarca(int idmarca) {
        this.idmarca = idmarca;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Marca{" + "idMarca=" + idmarca + ", nome=" + nome + '}';
    }
    
    
    
}
