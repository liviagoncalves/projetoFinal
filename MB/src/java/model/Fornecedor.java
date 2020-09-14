package model;

public class Fornecedor {
    private int idfornecedor;
    private String razao_social;
    private String cnpj;
    private String inscricao_estadual;
    private String telefone;
    private String cep;
    private String endereco;
    private int numero;
    private String complemento;
    private String bairro;
    private String cidade;
    private String uf;

    public Fornecedor() {
    }

    public Fornecedor(int idfornecedor, String razao_social, String cnpj, String inscricao_estadual, String telefone, String cep, String endereco, int numero, String complemento, String bairro, String cidade, String uf) {
        this.idfornecedor = idfornecedor;
        this.razao_social = razao_social;
        this.cnpj = cnpj;
        this.inscricao_estadual = inscricao_estadual;
        this.telefone = telefone;
        this.cep = cep;
        this.endereco = endereco;
        this.numero = numero;
        this.complemento = complemento;
        this.bairro = bairro;
        this.cidade = cidade;
        this.uf = uf;
    }

    public int getIdfornecedor() {
        return idfornecedor;
    }

    public void setIdfornecedor(int idfornecedor) {
        this.idfornecedor = idfornecedor;
    }

    public String getRazao_social() {
        return razao_social;
    }

    public void setRazao_social(String razao_social) {
        this.razao_social = razao_social;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getInscricao_estadual() {
        return inscricao_estadual;
    }

    public void setInscricao_estadual(String inscricao_estadual) {
        this.inscricao_estadual = inscricao_estadual;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    @Override
    public String toString() {
        return "Fornecedor{" + "idFornecedor=" + idfornecedor + ", razao_social=" + razao_social + ", cnpj=" + cnpj + ", inscricao_estadual=" + inscricao_estadual + ", telefone=" + telefone + ", cep=" + cep + ", endereco=" + endereco + ", numero=" + numero + ", complemento=" + complemento + ", bairro=" + bairro + ", cidade=" + cidade + ", uf=" + uf + '}';
    }
    
}
