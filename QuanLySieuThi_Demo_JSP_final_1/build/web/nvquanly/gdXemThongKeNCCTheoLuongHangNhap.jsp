<%-- 
    Document   : gdXemThongKeNCCTheoLuongHangNhap
    Created on : Dec 12, 2020, 12:13:24 AM
    Author     : Xuan Toog
--%>

<%@page import="dao.ThongKeNhaCungCapDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<%
    NhanVien nv = (NhanVien) session.getAttribute("nvquanly");
    SieuThi sieuthi = (SieuThi) session.getAttribute("sieuthi");
//    out.println(tv);
//    out.println(sieuthi.getId());
    String action = request.getParameter("action");
    String ngayBD = "";
    String ngayKT = "";
    ArrayList<ThongKeNhaCungCap> tknccs = new ArrayList<ThongKeNhaCungCap>();
    if (action.equals("gdXemThongKeNCCTheoLuongHangNhap")) {
        ngayBD = request.getParameter("ngayBD");
        ngayKT = request.getParameter("ngayKT");
//        out.println(ngayBD);
//        out.println(ngayKT);
        ThongKeNhaCungCapDAO tknccDAO = new ThongKeNhaCungCapDAO();
        
        tknccs = tknccDAO.getTKNCCTheoLuongHangNhap(ngayBD, ngayKT);
        session.setAttribute("tknccs", tknccs);
//        out.println(tknccs);
    }


%>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem thống kê nhà cung cấp theo lượng hàng nhập Page</title>
    </head>
    <body>
        <div class="container">
            <div class="d-flex justify-content-center">
                <h3>Xem thống kê nhà cung cấp theo lượng hàng nhập</h3>
            </div>

            <br>

            <div class="text-center">
                <form action="gdXemThongKeNCCTheoLuongHangNhap.jsp" method="post">
                    <input type="hidden" name="action" value="gdXemThongKeNCCTheoLuongHangNhap"/>
                    <div class="form-group">
                        <label for="ngayBD" class="col-md-2 col-form-label">Ngày bắt đầu:</label>
                        <input type="date" id="ngayBD" name="ngayBD" value="<%= ngayBD%>"/><br>
                    </div>
                    <div class="form-group">
                        <label for="ngayKT" class="col-md-2 col-form-label">Ngày kết thúc:</label>
                        <input type="date" id="ngayKT" name="ngayKT" value="<%=ngayKT%>"/><br>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 col-form-label"></label>
                        <input type="submit" value="Thống kê" class="btn-danger btn"/>
                    </div>
                </form>
            </div>

            <br><br>

            <table class="table table-hover">
                <tr class="table-danger">
                    <td>ID NCC</td>
                    <td>Tên NCC</td>
                    <td>Tổng lượng hàng</td>
                    <td>Action</td>
                </tr>
                <%
                    for (int i = 0; i < tknccs.size(); i++) {
                %>
                <tr>
                    <td><%= tknccs.get(i).getId()%></td>
                    <td><%= tknccs.get(i).getTen()%></td>
                    <td><%= tknccs.get(i).getSoluonghang()%></td>
                    <td><a href="gdXemThongKeCacLanNhapHangCuaNhaCungCap.jsp?index=<%=i%>&&ngayBD=<%=ngayBD%>&&ngayKT=<%=ngayKT%>">Xem chi tiết</a></td>
                </tr>
                <%
                    }

                %>
            </table>
        </div>
    </body>
</html>
