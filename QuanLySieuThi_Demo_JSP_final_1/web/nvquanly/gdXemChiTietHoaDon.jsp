<%-- 
    Document   : gdXemChiTietHoaDon
    Created on : Dec 12, 2020, 2:10:33 PM
    Author     : Xuan Toog
--%>

<%@page import="dao.HoaDonNhapDAO"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem chi tiết hóa đơn Page</title>
    </head>
    <body>
        <%
            int index = Integer.parseInt(request.getParameter("index"));
            ArrayList<HoaDonNhap> hds = (ArrayList<HoaDonNhap>) session.getAttribute("hds");
            HoaDonNhap hd = hds.get(index);
//            out.println(hd);
            HoaDonNhapDAO hdnDAO = new HoaDonNhapDAO();
            ArrayList<HoaDonNhap_MatHang> ds_mhn = hdnDAO.getHoaDonNhapTheoId(hd.getId());
        %>
        <div class="container">
            <div class="d-flex justify-content-center">
                <h3>Xem chi tiết hóa đơn</h3>
            </div>

            <p>ID hóa đơn: <%= hd.getId()%></p>
            <p>Siêu thị: <%= hd.getSieuThi().getTen()%></p>
            <p>Nhà cung cấp: <%= hd.getNhaCungCap().getTen()%></p>
            <p>Người tạo đơn: <%= hd.getNhanVien().getName()%></p>
            <p>Hình thức thanh toán: <%= hd.getHinhThucThanhToan()%></p>
            <p>Ghi chú: <%= hd.getGhiChu()%></p>

            <table class="table table-hover">
                <tr class="table-danger">
                    <td>ID mặt hàng</td>
                    <td>Tên mặt hàng</td>
                    <td>Giá nhập</td>
                    <td>Số lượng</td>
                    <td>Khuyến mãi %</td>
                    <td>Đơn vị tính</td>
                    <td>Thành tiền</td>
                </tr>
                <%
                    for (int i = 0; i < ds_mhn.size(); i++) {
                %>
                <tr>
                    <td><%= ds_mhn.get(i).getMatHang().getId()%></td>
                    <td><%= ds_mhn.get(i).getMatHang().getTen()%></td>
                    <td><%= ds_mhn.get(i).getGiaNhap()%></td>
                    <td><%= ds_mhn.get(i).getSoLuong()%></td>
                    <td><%= ds_mhn.get(i).getKhuyenMai()%></td>
                    <td><%= ds_mhn.get(i).getMatHang().getDonViTinh().getTen()%></td>
                    <td><%= (ds_mhn.get(i).getGiaNhap() * ds_mhn.get(i).getSoLuong()) - (ds_mhn.get(i).getGiaNhap() * ds_mhn.get(i).getSoLuong() * ds_mhn.get(i).getKhuyenMai() / 100)%></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>Tổng tiền: <%= hd.getTongtien()%></td>
                </tr>
            </table>
        </div>
    </body>
</html>
