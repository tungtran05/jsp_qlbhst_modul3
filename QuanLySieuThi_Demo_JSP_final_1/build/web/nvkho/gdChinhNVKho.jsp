<%-- 
    Document   : gdchinhnvkho
    Created on : Nov 26, 2020, 6:19:18 PM
    Author     : Xuan Toog
--%>

<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<%
    NhanVien nv = (NhanVien) session.getAttribute("nvkho");
    SieuThi sieuthi = (SieuThi) session.getAttribute("sieuthi");
//    out.println(tv);
//    out.println(sieuthi.getId());
%>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhân viên kho Home's Page</title>
    </head>
    <body>
        <div class="container">
            <br>
            <div class="text-center mb-3">
                <a href="gdQuanLyNCC.jsp?action=gdNVKho"><button class="btn btn-danger">Quản lý thông tin nhà cung cấp</button></a>
            </div>
            <div class="text-center mb-3">
                <a href="gdTimVaChonNCC.jsp?action=gdNVKho"><button class="btn btn-danger">Nhập hàng từ nhà cung cấp</button></a>
            </div>
        </div>
        
    </body>
</html>
