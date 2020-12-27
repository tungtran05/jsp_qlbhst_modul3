<%-- 
    Document   : gdTimVaChonNCC
    Created on : Nov 26, 2020, 10:56:19 PM
    Author     : Xuan Toog
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*, dao.*, model.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
    NhanVien nv = (NhanVien) session.getAttribute("nvkho");
    SieuThi sieuthi = (SieuThi) session.getAttribute("sieuthi");
//    out.println(sieuthi.getId());
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm và chọn nhà cung cấp Page</title>
        <%
            String action = request.getParameter("action");
//            out.print(action);
            String tenNCC = "";
            ArrayList<NhaCungCap> nccs = new ArrayList<NhaCungCap>();
            if (action.equals("timNCC")) {
                tenNCC = request.getParameter("tenNCC");
                NhaCungCapDAO nccDAO = new NhaCungCapDAO();
                nccs = nccDAO.searchNCCTheoTen(tenNCC);
                session.setAttribute("nccs", nccs);
            }
        %>
    </head>
    <body>
        <div class="container">
            <br>
            <a href="gdThemNCC.jsp" target="_blank"><button class="btn btn-danger">Thêm nhà cung cấp mới</button></a>
            <br><br><hr>
            <form action="gdTimVaChonNCC.jsp" method="POST">
                <input type="hidden" name="action" value="timNCC"/>
                <input type="text" name="tenNCC" placeholder="Tên nhà cung cấp..." value="<%= tenNCC%>"/>
                <input type="submit" value="Tìm" class="btn-danger">
            </form>

            <br>

            <table class="table table-hover">
                <tr class="table-danger">
                    <th>ID</th>
                    <th>Tên nhà cung cấp</th>
                    <th>Địa chỉ</th>
                    <th>Số điện thoại</th>
                    <th>Mô tả</th>
                    <th>Action</th>
                </tr>
                <% for (int i = 0; i < nccs.size(); i++) {%>
                <tr>
                    <td><%= nccs.get(i).getId()%></td>
                    <td><%= nccs.get(i).getTen()%></td>
                    <td><%= nccs.get(i).getDiaChi()%></td>
                    <td><%= nccs.get(i).getSdt()%></td>
                    <td><%= nccs.get(i).getMoTa()%></td>
                    <td><a href="gdNhapHang.jsp?action=gdTimNCC&&index=<%= i %>">Nhập hàng</a></td>
                </tr>
                <% }%>
            </table>
        </div>
    </body>
</html>
