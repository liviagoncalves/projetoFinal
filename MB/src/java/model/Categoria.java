package model;
public class Categoria {
    private int idcategoria;
    private String nome;

    public Categoria() {
    }

    public Categoria(int idcategoria, String nome) {
        this.idcategoria = idcategoria;
        this.nome = nome;
    }

    public int getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(int idcategoria) {
        this.idcategoria = idcategoria;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
}
