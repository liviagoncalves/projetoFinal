package model;

import java.util.ArrayList;
import java.util.Date;

public class Vendas {
    private int idvendas;
    private Date data_venda;
    private double vlr_total;
    private Usuario usuario;
    private Cliente cliente;
    private ArrayList<ItensVendas> carrinho;
    private ItensVendas itensVendas;

    public Vendas() {
    }

    public Vendas(int idvendas, Date data_venda, double vlr_total, Usuario usuario, Cliente cliente, ArrayList<ItensVendas> carrinho, ItensVendas itensVendas) {
        this.idvendas = idvendas;
        this.data_venda = data_venda;
        this.vlr_total = vlr_total;
        this.usuario = usuario;
        this.cliente = cliente;
        this.carrinho = carrinho;
        this.itensVendas = itensVendas;
    }

    public int getIdvendas() {
        return idvendas;
    }

    public void setIdvendas(int idvendas) {
        this.idvendas = idvendas;
    }

    public Date getData_venda() {
        return data_venda;
    }

    public void setData_venda(Date data_venda) {
        this.data_venda = data_venda;
    }

    public double getVlr_total() {
        return vlr_total;
    }

    public void setVlr_total(double vlr_total) {
        this.vlr_total = vlr_total;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public ArrayList<ItensVendas> getCarrinho() {
        return carrinho;
    }

    public void setCarrinho(ArrayList<ItensVendas> carrinho) {
        this.carrinho = carrinho;
    }

    public ItensVendas getItensVendas() {
        return itensVendas;
    }

    public void setItensVendas(ItensVendas itensVendas) {
        this.itensVendas = itensVendas;
    }

    @Override
    public String toString() {
        return "Vendas{" + "idvendas=" + idvendas + ", data_venda=" + data_venda + ", vlr_total=" + vlr_total + ", usuario=" + usuario + ", cliente=" + cliente + ", carrinho=" + carrinho + ", itensVendas=" + itensVendas + '}';
    }

}