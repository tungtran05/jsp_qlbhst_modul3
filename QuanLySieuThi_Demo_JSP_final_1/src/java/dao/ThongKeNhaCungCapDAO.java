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
import java.util.ArrayList;
import model.ThongKeNhaCungCap;

/**
 *
 * @author Xuan Toog
 */
public class ThongKeNhaCungCapDAO extends DAO{
    public ThongKeNhaCungCapDAO() {
        super();
    }
    
    public ArrayList<ThongKeNhaCungCap> getTKNCCTheoLuongHangNhap(String ngayBD, String ngayKT) {
        ArrayList<ThongKeNhaCungCap> arrTK = new ArrayList<ThongKeNhaCungCap>();
        try {
            PreparedStatement ps = 
                con.prepareStatement("select nhacungcap.id, nhacungcap.ten, sum(soluong) from hoadonnhap "
                    + "join hoadonnhap_mathang on hoadonnhap.id = hoadonnhap_mathang.hoadonnhap_id "
                    + "join nhacungcap on nhacungcap_id = nhacungcap.id "
                    + "where date(thoigianxuat) >= ? and date(thoigianxuat) <= ? "
                    + "group by nhacungcap_id "
                    + "order by sum(soluong) desc;");
            ps.setString(1, ngayBD);
            ps.setString(2, ngayKT);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ThongKeNhaCungCap tkncc = new ThongKeNhaCungCap(rs.getInt(3));
                tkncc.setId(rs.getInt(1));
                tkncc.setTen(rs.getString(2));
                arrTK.add(tkncc);
            }
        } catch (Exception e) {
            e.printStackTrace();
            arrTK = null;
        }
        return arrTK;
    }
    
}
