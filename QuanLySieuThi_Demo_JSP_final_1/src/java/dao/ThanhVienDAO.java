/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import model.ThanhVien;

/**
 *
 * @author Xuan Toog
 */
public class ThanhVienDAO extends DAO{
    
    public ThanhVienDAO() {
        super();
    }

    public boolean kiemtraDangNhap(ThanhVien tv) {
        boolean status = false;
        try {
            PreparedStatement ps = con.prepareStatement("select * from thanhvien where username=? and pass=?");
            ps.setString(1, tv.getUsername());
            ps.setString(2, tv.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public ThanhVien getThanhVienByUsernameAndPass(String username, String password) {
        ThanhVien tv = null;
        try {
            PreparedStatement ps = con.prepareStatement("select * from thanhvien where username=? and pass=?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tv = new ThanhVien();
                tv.setId(rs.getInt(1));
                tv.setUsername(rs.getString(2));
                tv.setPassword(rs.getString(3));
                tv.setName(rs.getString(4));
                tv.setNgaySinh(rs.getDate(5));
                System.out.println(tv.getNgaySinh());
                tv.setDiaChi(rs.getString(6));
                tv.setEmail(rs.getString(7));
                tv.setSdt(rs.getString(8));
                tv.setGhiChu(rs.getString(9));
                tv.setVaiTro(rs.getString(10));
//                tv.setViTri(rs.getString(11));
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tv;
    }
    
    public ThanhVien getThanhVienTheoId(int id) {
        ThanhVien tv = null;
        try {
            PreparedStatement ps = con.prepareStatement("select * from thanhvien where id = ?");
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                tv = new ThanhVien();
                tv.setId(rs.getInt(1));
                tv.setUsername(rs.getString(2));
                tv.setPassword(rs.getString(3));
                tv.setName(rs.getString(4));
                tv.setNgaySinh(StringToDatetime(rs.getString(5)));
                tv.setDiaChi(rs.getString(6));
                tv.setEmail(rs.getString(7));
                tv.setSdt(rs.getString(8));
                tv.setGhiChu(rs.getString(9));
                tv.setVaiTro(rs.getString(10));
//                tv.setViTri(rs.getString(11));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tv;
    }
    
    public java.util.Date StringToDatetime(String datetime_str) throws Exception{
        java.util.Date datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime_str);
        return datetime;
    }

}
