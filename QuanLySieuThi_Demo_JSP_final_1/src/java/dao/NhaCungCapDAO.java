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
import model.NhaCungCap;

/**
 *
 * @author Xuan Toog
 */
public class NhaCungCapDAO extends DAO{
    
    public NhaCungCapDAO() {
        super();
    }
    
    public ArrayList<NhaCungCap> searchNCCTheoTen(String tenNCC){
        ArrayList<NhaCungCap> results = new ArrayList<NhaCungCap>();
        try {
            
            String query = "select * from nhacungcap where ten like '%"+tenNCC+"%'";
            Statement statement = con.createStatement();
            
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                NhaCungCap ncc = new NhaCungCap();
                ncc.setId(rs.getInt(1));
                ncc.setTen(rs.getString(2));
                ncc.setDiaChi(rs.getString(3));
                ncc.setSdt(rs.getString(4));
                ncc.setMoTa(rs.getString(5));
                results.add(ncc);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
    
    public NhaCungCap getNCCTheoId (int nccID) {
        NhaCungCap ncc = null;
        try {
            PreparedStatement ps = con.prepareStatement("select * from nhacungcap where id=?");
            ps.setInt(1, nccID);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                ncc = new NhaCungCap();
                ncc.setId(rs.getInt(1));
                ncc.setTen(rs.getString(2));
                ncc.setDiaChi(rs.getString(3));
                ncc.setSdt(rs.getString(4));
                ncc.setMoTa(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ncc;
    }
    
    public int addNCC(NhaCungCap ncc) {
        int status = 0;
        try {

            PreparedStatement ps = con.prepareStatement("insert into nhacungcap (ten, diachi, sdt, mota) values (?,?,?,?);");
            ps.setString(1, ncc.getTen());
            ps.setString(2, ncc.getDiaChi());
            ps.setString(3, ncc.getSdt());
            ps.setString(4, ncc.getMoTa());
            
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public int updateNCC(NhaCungCap ncc) {
        int status = 0;
        try {
            PreparedStatement ps = con.prepareStatement("update nhacungcap set ten=?, diachi=?, sdt=?, mota=? where id=?");
            ps.setString(1, ncc.getTen());
            ps.setString(2, ncc.getDiaChi());
            ps.setString(3, ncc.getSdt());
            ps.setString(4, ncc.getMoTa());
            ps.setInt(5, ncc.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public int deleteNCC(int id) {
        int status = 0;
        try {
            PreparedStatement ps = con.prepareStatement("delete from nhacungcap where id=?");
            ps.setInt(1, id);
            
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
