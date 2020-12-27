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
import model.MatHang;

/**
 *
 * @author Xuan Toog
 */
public class MatHangDAO extends DAO{
    
    public MatHangDAO() {
        super();
    }
    
    public ArrayList<MatHang> searchMHTheoTen(String tenMH){
        ArrayList<MatHang> results = new ArrayList<MatHang>();
        try {
            
            String query = "select * from mathang where ten like '%"+tenMH+"%'";
            Statement statement = con.createStatement();
            
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                MatHang mh = new MatHang();
                mh.setId(rs.getInt(1));
                mh.setTen(rs.getString(2));
                mh.setGiaBan(rs.getFloat(3));
                mh.setMoTa(rs.getString(4));
                
                DonViTinhDAO dao = new DonViTinhDAO();
                DonViTinh dvt = dao.getDonViTinhTheoId(rs.getInt(6));
                mh.setDonViTinh(dvt);
                results.add(mh);
            }
        } catch (Exception e) {
            e.printStackTrace();
            results = null;
        }
        return results;
    }
    
    public MatHang getMatHangTheoId(int id){
        MatHang mh = new MatHang();
        try {
            PreparedStatement ps = con.prepareStatement("select * from mathang where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                mh.setId(rs.getInt(1));
                mh.setTen(rs.getString(2));
                mh.setGiaBan(rs.getFloat(3));
                mh.setMoTa(rs.getString(4));
                
                DonViTinhDAO dao = new DonViTinhDAO();
                DonViTinh dvt = dao.getDonViTinhTheoId(rs.getInt(6));
                mh.setDonViTinh(dvt);
            }

        } catch (Exception e) {
            e.printStackTrace();
            mh = null;
        }
        return mh;
    }
    
    public int addMatHang(MatHang mh, int lmh_id) {
        int status = 0;
        try {
            PreparedStatement ps = con.prepareStatement("insert into mathang (ten, giaban, mota, loaimathang_id, donvitinh_id)"
                    + " values (?,?,?,?,?);");
            ps.setString(1, mh.getTen());
            ps.setFloat(2, mh.getGiaBan());
            ps.setString(3, mh.getMoTa());
            ps.setInt(4, lmh_id);
            ps.setInt(5, mh.getDonViTinh().getId());
            
            status = ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
