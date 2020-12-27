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
public class NhaCungCap {
    private int id;
    private String ten, diaChi, sdt, moTa;
    
    public NhaCungCap(){
        
    }

    public NhaCungCap(String ten, String diaChi, String sdt, String moTa) {
        this.ten = ten;
        this.diaChi = diaChi;
        this.sdt = sdt;
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

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    @Override
    public String toString() {
        return "NhaCungCap{" + "id=" + id + ", ten=" + ten + ", diaChi=" + diaChi + ", sdt=" + sdt + ", moTa=" + moTa + '}';
    }
    
}
