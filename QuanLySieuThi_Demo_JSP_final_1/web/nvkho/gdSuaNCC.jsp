<%-- 
    Document   : gdSuaNCC
    Created on : Dec 10, 2020, 7:10:16 PM
    Author     : Xuan Toog
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.NhaCungCap"%>
<%@page import="dao.NhaCungCapDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa nhà cung cấp Page</title>
    </head>
    <body>
        <%
            ArrayList<NhaCungCap> nccs = (ArrayList<NhaCungCap>) session.getAttribute("nccs");
            NhaCungCap ncc = nccs.get(Integer.parseInt(request.getParameter("index")));
        %>
        <div class="container">
            <form action="doSuaNCC.jsp" method="post">
                <div class="form-group">
                    <label for="id" class="col-md-2 col-form-label">ID:</label>
                    <label><%= ncc.getId()%></label>
                    <input type="hidden" name="id" value="<%= ncc.getId()%>"/>
                </div>
                <div class="form-group">
                    <label for="ten" class="col-md-2 col-form-label">Tên nhà cung cấp:</label>
                    <input type="text" id="ten" name="ten" value="<%= ncc.getTen()%>">
                </div>
                <div class="form-group">
                    <label for="diachi" class="col-md-2 col-form-label">Địa chỉ:</label>
                    <input type="text" id="diachi" name="diachi" value="<%= ncc.getDiaChi()%>">
                </div>
                <div class="form-group">
                    <label for="sdt" class="col-md-2 col-form-label">Số điện thoại:</label>
                    <input type="text" id="sdt" name="sdt" value="<%= ncc.getSdt()%>">
                </div>
                <div class="form-group">
                    <label for="mota" class="col-md-2 col-form-label">Mô tả:</label>
                    <input type="text" id="mota" name="mota" value="<%= ncc.getMoTa()%>">
                </div>
                
                <div class="form-group">
                    <label for="mota" class="col-md-2 col-form-label"></label>
                    <input type="submit" value="Sửa" class="btn btn-danger"/>
                <div class="form-group">
            </form>
        </div>
    </body>
</html>
