package model;

import java.util.ArrayList;

public class Perfil {
    private int idperfil;
    private String nome;
    private ArrayList<Menu> menu;
    private ArrayList<Menu> naoMenu;

    public Perfil() {
    }

    public Perfil(int idperfil, String nome) {
        this.idperfil = idperfil;
        this.nome = nome;
    }

    public ArrayList<Menu> getMenu() {
        return menu;
    }

    public void setMenu(ArrayList<Menu> menu) {
        this.menu = menu;
    }

    public ArrayList<Menu> getNaoMenu() {
        return naoMenu;
    }

    public void setNaoMenu(ArrayList<Menu> naoMenu) {
        this.naoMenu = naoMenu;
    }

    public int getIdperfil() {
        return idperfil;
    }

    public void setIdperfil(int idperfil) {
        this.idperfil = idperfil;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Perfil{" + "idPerfil=" + idperfil + ", nome=" + nome + '}';
    }   
}