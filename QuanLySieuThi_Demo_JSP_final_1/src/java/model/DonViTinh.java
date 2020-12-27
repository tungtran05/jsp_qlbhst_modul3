/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Xuan Toog
 */
public class DonViTinh {
    private int id;
    private String ten, moTa;
    
    public DonViTinh(){
        
    }

    public DonViTinh(String ten, String moTa) {
        this.ten = ten;
        this.moTa = moTa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    @Override
    public String toString() {
        return "DonViTinh{" + "id=" + id + ", ten=" + ten + ", moTa=" + moTa + '}';
    }
    
}
