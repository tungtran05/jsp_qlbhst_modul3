/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Xuan Toog
 */
public class NhanVien extends ThanhVien{
    private String viTri;
    public NhanVien() {
        super();
    }

    public NhanVien(String viTri, String username, String password, String name, String diaChi, String email, String sdt, String ghiChu, String vaiTro, Date ngaySinh) {
        super(username, password, name, diaChi, email, sdt, ghiChu, vaiTro, ngaySinh);
        this.viTri = viTri;
    }

    public String getViTri() {
        return viTri;
    }

    public void setViTri(String viTri) {
        this.viTri = viTri;
    }
    
    
}
