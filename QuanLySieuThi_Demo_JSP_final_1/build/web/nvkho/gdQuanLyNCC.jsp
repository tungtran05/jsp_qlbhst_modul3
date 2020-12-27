<%-- 
    Document   : gdQuanLyNCC
    Created on : Dec 10, 2020, 6:47:00 PM
    Author     : Xuan Toog
--%>

<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String action = request.getParameter("action");
//    out.print(action);
    String tenNCC = "";
    ArrayList<NhaCungCap> nccs = new ArrayList<NhaCungCap>();
    if (action.equals("timNCC")) {
        tenNCC = request.getParameter("tenNCC");
        NhaCungCapDAO nccDAO = new NhaCungCapDAO();
        nccs = nccDAO.searchNCCTheoTen(tenNCC);
        session.setAttribute("nccs", nccs);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/yourcode.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý nhà cung cấp Page</title>
    </head>
    <body>
        <div class="container">
            <br>
            <div class="mb-3">
                <a href="gdThemNCC.jsp"><button class="btn btn-danger">Thêm nhà cung cấp mới</button></a>
            </div>


            <br><br>


            <p>Để <span class="text-danger">Sửa</span> hoặc <span class="text-danger">Xóa</span> 
                nhà cung cấp, vui lòng nhập tên nhà cung cấp cần sửa (xóa) vào ô nhập dưới đây + click 
                <span class="text-danger">Tìm</span>
            </p>
            <form action="gdQuanLyNCC.jsp" method="POST">
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
                    <td>
                        <a href="gdSuaNCC.jsp?action=gdQuanLyNCC&&index=<%=i%>">Sửa</a> | 
                        <a href="doXoaNCC.jsp?action=gdQuanLyNCC&&index=<%=i%>">Xóa</a>
                    </td>
                </tr>
                <% }%>
            </table>

        </div>
    </body>
</html>
