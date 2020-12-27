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
import java.util.ArrayList;
import model.DonViTinh;
import model.LoaiMatHang;

/**
 *
 * @author Xuan Toog
 */
public class LoaiMatHangDAO extends DAO{
    
    public LoaiMatHangDAO() {
        super();
    }
    
    public LoaiMatHang getLoaiMatHangTheoId(int LMHid){
        LoaiMatHang lmh = null;
        try {
            PreparedStatement ps = con.prepareStatement("select * from loaimathang where id=?");
            ps.setInt(1, LMHid);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                lmh.setId(rs.getInt(1));
                lmh.setTen(rs.getString(2));
                lmh.setMoTa(rs.getString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
            lmh = null;
        }
        return lmh;
    }
    
    public ArrayList<LoaiMatHang> getAllLoaiMatHang() {
        ArrayList<LoaiMatHang> lmhs = new ArrayList<LoaiMatHang>();
        try {
            Statement st = con.createStatement();
            
            ResultSet rs = st.executeQuery("select * from loaimathang;");
            
            while(rs.next()) {
                LoaiMatHang lmh = new LoaiMatHang();
                lmh.setId(rs.getInt(1));
                lmh.setTen(rs.getString(2));
                lmh.setMoTa(rs.getString(3));
//                int nhomMH_id = rs.getInt(4);
                lmhs.add(lmh);
            }
        } catch (Exception e) {
            e.printStackTrace();
            lmhs = null;
        }
        
        return lmhs;
    }
}
