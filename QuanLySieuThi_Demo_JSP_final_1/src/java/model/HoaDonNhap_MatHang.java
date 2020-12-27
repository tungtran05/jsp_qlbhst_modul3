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
public class HoaDonNhap_MatHang {
    private int id;
    private float giaNhap;
    private int soLuong;
    private float khuyenMai;
    private MatHang matHang;
    
    public HoaDonNhap_MatHang(){
        
    }

    public HoaDonNhap_MatHang(float giaNhap, int soLuong, float khuyenMai, MatHang matHang) {
        this.giaNhap = giaNhap;
        this.soLuong = soLuong;
        this.khuyenMai = khuyenMai;
        this.matHang = matHang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(float giaNhap) {
        this.giaNhap = giaNhap;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public float getKhuyenMai() {
        return khuyenMai;
    }

    public void setKhuyenMai(float khuyenMai) {
        this.khuyenMai = khuyenMai;
    }

    public MatHang getMatHang() {
        return matHang;
    }

    public void setMatHang(MatHang matHang) {
        this.matHang = matHang;
    }

    @Override
    public String toString() {
        return "HoaDonNhap_MatHang{" + "id=" + id + ", giaNhap=" + giaNhap + ", soLuong=" + soLuong + ", khuyenMai=" + khuyenMai + ", matHang=" + matHang + '}';
    }
    
}
