/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Xuan Toog
 */
public class SieuThi {
    private int id;
    private String ten, diaChi, sdt, mota;
    private ArrayList<ThanhVien> listThanhVien;
    
    public SieuThi(){
        
    }

    public SieuThi(String ten, String diaChi, String sdt, String mota, ArrayList<ThanhVien> listThanhVien) {
        this.ten = ten;
        this.diaChi = diaChi;
        this.sdt = sdt;
        this.mota = mota;
        this.listThanhVien = listThanhVien;
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

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public ArrayList<ThanhVien> getListThanhVien() {
        return listThanhVien;
    }

    public void setListThanhVien(ArrayList<ThanhVien> listThanhVien) {
        this.listThanhVien = listThanhVien;
    }
    
}
