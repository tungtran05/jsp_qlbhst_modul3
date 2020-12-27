/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import model.NhanVien;
import model.ThanhVien;

/**
 *
 * @author Xuan Toog
 */
public class NhanVienDAO extends DAO{
    public NhanVienDAO() {
        super();
    }
    
    public NhanVien getNhanVienByUsernameAndPass(String username, String password) {
        NhanVien nv = null;
        try {
            PreparedStatement ps = con.prepareStatement("select * from thanhvien where username=? and pass=?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                nv = new NhanVien();
                nv.setId(rs.getInt(1));
                nv.setUsername(rs.getString(2));
                nv.setPassword(rs.getString(3));
                nv.setName(rs.getString(4));
                nv.setNgaySinh(rs.getDate(5));
                System.out.println(nv.getNgaySinh());
                nv.setDiaChi(rs.getString(6));
                nv.setEmail(rs.getString(7));
                nv.setSdt(rs.getString(8));
                nv.setGhiChu(rs.getString(9));
                nv.setVaiTro(rs.getString(10));
                nv.setViTri(rs.getString(11));
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nv;
    }
    
    public NhanVien getNhanVienTheoId(int id) {
        NhanVien nv = null;
        try {
            PreparedStatement ps = con.prepareStatement("select * from thanhvien where id = ?");
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                nv = new NhanVien();
                nv.setId(rs.getInt(1));
                nv.setUsername(rs.getString(2));
                nv.setPassword(rs.getString(3));
                nv.setName(rs.getString(4));
                nv.setNgaySinh(StringToDatetime(rs.getString(5)));
                nv.setDiaChi(rs.getString(6));
                nv.setEmail(rs.getString(7));
                nv.setSdt(rs.getString(8));
                nv.setGhiChu(rs.getString(9));
                nv.setVaiTro(rs.getString(10));
                nv.setViTri(rs.getString(11));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nv;
    }
    
    public java.util.Date StringToDatetime(String datetime_str) throws Exception{
        java.util.Date datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime_str);
        return datetime;
    }
}
