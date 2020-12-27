/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Xuan Toog
 */
public class HoaDonNhap {
    private int id;
    private Date thoiGianXuat;
    private String hinhThucThanhToan, ghiChu;
    private float tongtien;
    private NhanVien nhanVien;
    private SieuThi sieuThi;
    private NhaCungCap nhaCungCap;
    private ArrayList<HoaDonNhap_MatHang> listHoaDonNhap_MatHang;
    
    public HoaDonNhap(){
        
    }

    public HoaDonNhap(Date thoiGianXuat, String hinhThucThanhToan, String ghiChu, float tongtien, NhanVien nhanVien, SieuThi sieuThi, NhaCungCap nhaCungCap, ArrayList<HoaDonNhap_MatHang> listHoaDonNhap_MatHang) {
        this.thoiGianXuat = thoiGianXuat;
        this.hinhThucThanhToan = hinhThucThanhToan;
        this.ghiChu = ghiChu;
        this.tongtien = tongtien;
        this.nhanVien = nhanVien;
        this.sieuThi = sieuThi;
        this.nhaCungCap = nhaCungCap;
        this.listHoaDonNhap_MatHang = listHoaDonNhap_MatHang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getThoiGianXuat() {
        return thoiGianXuat;
    }

    public void setThoiGianXuat(Date thoiGianXuat) {
        this.thoiGianXuat = thoiGianXuat;
    }

    public String getHinhThucThanhToan() {
        return hinhThucThanhToan;
    }

    public void setHinhThucThanhToan(String hinhThucThanhToan) {
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public NhanVien getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVien nhanVien) {
        this.nhanVien = nhanVien;
    }

    public SieuThi getSieuThi() {
        return sieuThi;
    }

    public void setSieuThi(SieuThi sieuThi) {
        this.sieuThi = sieuThi;
    }

    public NhaCungCap getNhaCungCap() {
        return nhaCungCap;
    }

    public void setNhaCungCap(NhaCungCap nhaCungCap) {
        this.nhaCungCap = nhaCungCap;
    }

    public ArrayList<HoaDonNhap_MatHang> getListHoaDonNhap_MatHang() {
        return listHoaDonNhap_MatHang;
    }

    public void setListHoaDonNhap_MatHang(ArrayList<HoaDonNhap_MatHang> listHoaDonNhap_MatHang) {
        this.listHoaDonNhap_MatHang = listHoaDonNhap_MatHang;
    }

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    
    
}
