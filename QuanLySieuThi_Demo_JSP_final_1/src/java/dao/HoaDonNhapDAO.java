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
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.HoaDonNhap;
import model.HoaDonNhap_MatHang;

/**
 *
 * @author Xuan Toog
 */
public class HoaDonNhapDAO extends DAO{

    public HoaDonNhapDAO() {
        super();
    }

    public boolean luuHoaDonNhap(HoaDonNhap hoadonnhap) throws SQLException {
        boolean status = false;
        Connection con = DAO.con;
        try {
            
            con.setAutoCommit(false);

            PreparedStatement ps1 = con.prepareStatement("insert into hoadonnhap (thoigianxuat, hinhthucthanhtoan, ghichu,"
                    + " tongtien, sieuthi_id, nhacungcap_id, thanhvien_id) values (?,?,?,?,?,?,?);",
                    Statement.RETURN_GENERATED_KEYS);
            ps1.setString(1, DatetimeToString(hoadonnhap.getThoiGianXuat()));
            ps1.setString(2, hoadonnhap.getHinhThucThanhToan());
            ps1.setString(3, hoadonnhap.getGhiChu());
            ps1.setFloat(4, hoadonnhap.getTongtien());
            ps1.setInt(5, hoadonnhap.getSieuThi().getId());
            ps1.setInt(6, hoadonnhap.getNhaCungCap().getId());
            ps1.setInt(7, hoadonnhap.getNhanVien().getId());

            int rowAffected = ps1.executeUpdate();

            // lấy id của hóa đơn vào tạo
            ResultSet rs = ps1.getGeneratedKeys();
            int hoadonnhap_id = 0;
            if (rs.next()) {
                hoadonnhap_id = rs.getInt(1);
            }

            if (rowAffected == 1) { // nếu thêm được hóa đơn
                ArrayList<HoaDonNhap_MatHang> list_mathangnhap = hoadonnhap.getListHoaDonNhap_MatHang();
                for (int i = 0; i < list_mathangnhap.size(); i++) {
                    String sql = "insert into hoadonnhap_mathang (giaNhap, soluong, khuyenmai, hoadonnhap_id, mathang_id) "
                            + "values (" + list_mathangnhap.get(i).getGiaNhap() + ", "
                            + list_mathangnhap.get(i).getSoLuong() + ", "
                            + list_mathangnhap.get(i).getKhuyenMai() + ", "
                            + hoadonnhap_id + ", "
                            + list_mathangnhap.get(i).getMatHang().getId() + ");";
                    Statement st = con.createStatement();
                    st.execute(sql);
                }
            }
            
            con.commit();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
            con.rollback();
        }
        return status;
    }

    public String DatetimeToString(java.util.Date datetime) {
        String res = null;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        res = format.format(datetime);
        return res;
    }
    
    public java.util.Date StringToDatetime(String datetime_str) throws Exception{
        java.util.Date datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime_str);
        return datetime;
    }
    
    public ArrayList<HoaDonNhap> TKCacLanNhapHangCuaMotNCC(String ngayBD, String ngayKT, int nccid) {
        ArrayList<HoaDonNhap> arr = new ArrayList<>();
        try {
            
            PreparedStatement ps = con.prepareStatement("select * from hoadonnhap where nhacungcap_id = ?"
                    + " and date(thoigianxuat) >= ? and date(thoigianxuat) <= ?;");
            ps.setInt(1, nccid);
            ps.setString(2, ngayBD);
            ps.setString(3, ngayKT);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                HoaDonNhap hd = new HoaDonNhap();
                hd.setId(rs.getInt(1));
                hd.setThoiGianXuat(StringToDatetime(rs.getString(2)));
//                System.out.println(hd.getThoiGianXuat());
                hd.setHinhThucThanhToan(rs.getString(3));
                hd.setGhiChu(rs.getString(4));
                hd.setTongtien(rs.getFloat(5));
                SieuThiDAO stDAO = new SieuThiDAO();
                hd.setSieuThi(stDAO.getSieuThiTheoId(rs.getInt(6)));
                NhaCungCapDAO nccDAO = new NhaCungCapDAO();
                hd.setNhaCungCap(nccDAO.getNCCTheoId(rs.getInt(7)));
                NhanVienDAO nvDAO = new NhanVienDAO();
                hd.setNhanVien(nvDAO.getNhanVienTheoId(rs.getInt(8)));
                arr.add(hd);
            }
        } catch (Exception e) {
            e.printStackTrace();
            arr = null;
        }
        return arr;
    }
    
    public ArrayList<HoaDonNhap_MatHang> getHoaDonNhapTheoId(int id) {
        ArrayList<HoaDonNhap_MatHang> ds_mhn = new ArrayList<HoaDonNhap_MatHang>();
        try {
            PreparedStatement ps = con.prepareStatement("select * from hoadonnhap_mathang where hoadonnhap_id = ?;");
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                HoaDonNhap_MatHang mnh = new HoaDonNhap_MatHang();
                mnh.setId(rs.getInt(1));
                mnh.setGiaNhap(rs.getFloat(2));
                mnh.setSoLuong(rs.getInt(3));
                mnh.setKhuyenMai(rs.getFloat(4));
                
                MatHangDAO dao = new MatHangDAO();
                mnh.setMatHang(dao.getMatHangTheoId(rs.getInt(6)));
                ds_mhn.add(mnh);
            }
        } catch (Exception e) {
            e.printStackTrace();
            ds_mhn = null;
        }
        return ds_mhn;
    }
}
