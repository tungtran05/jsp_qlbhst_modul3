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
import java.sql.Statement;
import model.SieuThi;

/**
 *
 * @author Xuan Toog
 */
public class SieuThiDAO extends DAO{
    public SieuThiDAO() {
        super();
    }
    
    public SieuThi getSieuThiByThanhVienId(int tvID) {
        SieuThi sieuthi = null;
        try {
            PreparedStatement ps = con.prepareStatement("select sieuthi.id, sieuthi.ten, sieuthi.diachi, sieuthi.sdt, "
                    + "sieuthi.mota from sieuthi join thanhvien where sieuthi.id = ?");
            ps.setInt(1, tvID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                sieuthi = new SieuThi();
                sieuthi.setId(rs.getInt(1));
                System.out.println(sieuthi.getId());
                sieuthi.setTen(rs.getString(2));
                sieuthi.setDiaChi(rs.getString(3));
                sieuthi.setMota(rs.getString(4));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return sieuthi;
    }
    
    public SieuThi getSieuThiTheoId(int id) {
        SieuThi sieuthi = null;
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from sieuthi where id = " + id);
            if(rs.next()) {
                sieuthi = new SieuThi();
                sieuthi.setId(rs.getInt(1));
                sieuthi.setTen(rs.getString(2));
                sieuthi.setDiaChi(rs.getString(3));
                sieuthi.setMota(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sieuthi;
    }
}
