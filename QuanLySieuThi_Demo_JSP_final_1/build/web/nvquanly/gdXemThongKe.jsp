<%-- 
    Document   : gdXemThongKe
    Created on : Dec 12, 2020, 12:11:17 AM
    Author     : Xuan Toog
--%>

<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<%
    NhanVien nv = (NhanVien) session.getAttribute("nvquanly");
    SieuThi sieuthi = (SieuThi) session.getAttribute("sieuthi");
//    out.println(tv);
//    out.println(sieuthi.getId());
%>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem thống kê Page</title>
    </head>
    <body>
        <br>
        <div class="d-flex justify-content-center">
            <a href="gdXemThongKeNCCTheoLuongHangNhap.jsp?action=gdXemThongKe"><button class="btn btn-danger">
                Xem thống kê nhà cung cấp theo lượng hàng nhập</button></a>
        </div>
    </body>
</html>
