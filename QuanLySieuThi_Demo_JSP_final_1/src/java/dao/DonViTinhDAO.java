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

/**
 *
 * @author Xuan Toog
 */
public class DonViTinhDAO extends DAO {
    
    public DonViTinhDAO() {
        super();
    }
    
    
    public DonViTinh getDonViTinhTheoId(int DVTid){
        DonViTinh dvt = new DonViTinh();
        try {
            
            PreparedStatement ps = con.prepareStatement("select * from donvitinh where id=?");
            ps.setInt(1, DVTid);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                dvt.setId(rs.getInt(1));
                dvt.setTen(rs.getString(2));
                dvt.setMoTa(rs.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
            dvt = null;
        }
        return dvt;
    }
    
    public ArrayList<DonViTinh> getAllDonViTinh() {
        ArrayList<DonViTinh> dvts = new ArrayList<DonViTinh>();
        try {
            
            Statement st = con.createStatement();
            
            ResultSet rs = st.executeQuery("select * from donvitinh");
            while(rs.next()) {
                DonViTinh dvt = new DonViTinh();
                dvt.setId(rs.getInt(1));
                dvt.setTen(rs.getString(2));
                dvt.setMoTa(rs.getString(3));
                dvts.add(dvt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dvts;
    }
}
