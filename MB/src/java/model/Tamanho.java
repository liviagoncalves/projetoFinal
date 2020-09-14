package model;
public class Tamanho {
    private int idtamanho;
    private String nome;

    public Tamanho() {
    }

    public Tamanho(int idtamanho, String nome) {
        this.idtamanho = idtamanho;
        this.nome = nome;
    }

    public int getIdtamanho() {
        return idtamanho;
    }

    public void setIdtamanho(int idtamanho) {
        this.idtamanho = idtamanho;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Tamanho{" + "idTamanho=" + idtamanho + ", nome=" + nome + '}';
    }
}
