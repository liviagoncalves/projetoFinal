package model;
public class Cor {
    private int idcor;
    private String nome;

    public Cor() {
    }

    public Cor(int idcor, String nome) {
        this.idcor = idcor;
        this.nome = nome;
    }

    public int getIdcor() {
        return idcor;
    }

    public void setIdcor(int idcor) {
        this.idcor = idcor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Cor{" + "nome=" + nome + '}';
    }
    
}
