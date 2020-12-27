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
public class ThongKeNhaCungCap extends NhaCungCap{
    private int soluonghang;
    private float tongtien;

    public ThongKeNhaCungCap(int soluonghang) {
        this.soluonghang = soluonghang;
    }
    
    public ThongKeNhaCungCap(int soluonghang, float tongtien, String ten, String diaChi, String sdt, String moTa) {
        super(ten, diaChi, sdt, moTa);
        this.soluonghang = soluonghang;
        this.tongtien = tongtien;
    }

    public int getSoluonghang() {
        return soluonghang;
    }

    public void setSoluonghang(int soluonghang) {
        this.soluonghang = soluonghang;
    }

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }
}
