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
public class MatHang {
    private int id;
    private String ten;
    private float giaBan;
    private String moTa;
    private DonViTinh donViTinh;
    
    public MatHang(){
        
    }

    public MatHang(String ten, float giaBan, String moTa, DonViTinh donViTinh) {
        this.ten = ten;
        this.giaBan = giaBan;
        this.moTa = moTa;
        this.donViTinh = donViTinh;
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

    public float getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(float giaBan) {
        this.giaBan = giaBan;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public DonViTinh getDonViTinh() {
        return donViTinh;
    }

    public void setDonViTinh(DonViTinh donViTinh) {
        this.donViTinh = donViTinh;
    }
      
}
