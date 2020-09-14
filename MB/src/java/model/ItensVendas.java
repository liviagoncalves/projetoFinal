package model;
public class ItensVendas {
    private int iditens;
    private double vlr_venda;
    private int qtde;
    private double vlr_total;
    private Produto produto;
    private Vendas vendas;

    public ItensVendas() {
    }

    public ItensVendas(int iditens, double vlr_venda, int qtde, double desconto, double vlr_total, Produto produto, Vendas vendas) {
        this.iditens = iditens;
        this.vlr_venda = vlr_venda;
        this.qtde = qtde;
        this.vlr_total = vlr_total;
        this.produto = produto;
        this.vendas = vendas;
    }

    public int getIditens() {
        return iditens;
    }

    public void setIditens(int iditens) {
        this.iditens = iditens;
    }

    public double getVlr_venda() {
        return vlr_venda;
    }

    public void setVlr_venda(double vlr_venda) {
        this.vlr_venda = vlr_venda;
    }

    public int getQtde() {
        return qtde;
    }

    public void setQtde(int qtde) {
        this.qtde = qtde;
    }

    public double getVlr_total() {
        return vlr_total;
    }

    public void setVlr_total(double vlr_total) {
        this.vlr_total = vlr_total;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Vendas getVendas() {
        return vendas;
    }

    public void setVendas(Vendas vendas) {
        this.vendas = vendas;
    }

    @Override
    public String toString() {
        return "ItensVendas{" + "iditens=" + iditens + ", vlr_venda=" + vlr_venda + ", qtde=" + qtde + ", vlr_total=" + vlr_total + ", produto=" + produto + ", vendas=" + vendas + '}';
    }

    
}
