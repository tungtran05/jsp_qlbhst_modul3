<%-- 
    Document   : gdXemThongKeCacLanNhapHangCuaNhaCungCap
    Created on : Dec 12, 2020, 11:10:39 AM
    Author     : Xuan Toog
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem thống kê các lần nhập hàng của 1 nhà cung cấp Page</title>
    </head>
    <body>
        <%
            String ngayBD = request.getParameter("ngayBD");
            String ngayKT = request.getParameter("ngayKT");
            int index = Integer.parseInt(request.getParameter("index"));
            ArrayList<ThongKeNhaCungCap> tknccs = (ArrayList<ThongKeNhaCungCap>) session.getAttribute("tknccs");
            int ncc_id = tknccs.get(index).getId();

            HoaDonNhapDAO hdnDAO = new HoaDonNhapDAO();
            ArrayList<HoaDonNhap> hds = hdnDAO.TKCacLanNhapHangCuaMotNCC(ngayBD, ngayKT, ncc_id);
            session.setAttribute("hds", hds);
        %>

        <%!
            public static String DatetimeToString(java.util.Date datetime) {
                String res = null;
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                res = format.format(datetime);
                return res;
            }
        %>
        <div class="container">
            <div class="d-flex justify-content-center">
                <h3>Xem thống kê các lần nhập hàng của nhà cung cấp</h3>
            </div>
            <br>
            <table class="table table-hover">
                <tr class="table-danger">
                    <td>ID hóa đơn</td>
                    <td>Siêu thị</td>
                    <td>Nhà cung cấp</td>
                    <td>Người lập hóa đơn</td>
                    <td>Thời gian xuất</td>
                    <td>Hình thức thanh toán</td>
                    <td>Ghi chú</td>
                    <td>Tổng tiền</td>
                    <td>Action</td>
                </tr>
                <%
                    for (int i = 0; i < hds.size(); i++) {
                %>
                <tr>
                    <td><%= hds.get(i).getId()%></td>
                    <td><%= hds.get(i).getSieuThi().getTen()%></td>
                    <td><%= hds.get(i).getNhaCungCap().getTen()%></td>
                    <td><%= hds.get(i).getNhanVien().getName()%></td>
                    <td><%= DatetimeToString(hds.get(i).getThoiGianXuat())%></td>
                    <td><%= hds.get(i).getHinhThucThanhToan()%></td>
                    <td><%= hds.get(i).getGhiChu()%></td>
                    <td><%= hds.get(i).getTongtien()%></td>
                    <td><a href="gdXemChiTietHoaDon.jsp?hdnid_str=<%=hds.get(i).getId()%>&&index=<%=i%>">Xem chi tiết</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
