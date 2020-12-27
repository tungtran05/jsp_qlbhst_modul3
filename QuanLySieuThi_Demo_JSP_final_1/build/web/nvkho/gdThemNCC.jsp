<%-- 
    Document   : gdThemNhaCungCap
    Created on : Dec 9, 2020, 4:21:44 PM
    Author     : Xuan Toog
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm nhà cung cấp Page</title>
    </head>
    <body>
        <div class="container">
            <h3>Thêm nhà cung cấp</h3>
            <form action="doThemNCC.jsp" method="post">
                <div class="form-group">
                    <label for="tenNCC" class="col-md-2 col-form-label">Tên nhà cung cấp:</label>
                    <input type="text" name="tenNCC" id="tenNCC"/>
                </div>
                <div class="form-group">
                    <label for="diachi" class="col-md-2 col-form-label">Địa chỉ:</label>
                    <input type="text" name="diachi" id="diachi"/>
                </div>
                <div class="form-group">
                    <label for="sdt" class="col-md-2 col-form-label">Số điện thoại:</label>
                    <input type="text" name="sdt" id="sdt"/>
                </div>
                <div class="form-group">
                    <label for="mota" class="col-md-2 col-form-label">Mô tả:</label>
                    <input type="text" name="mota" id="mota"/>
                </div>
                <div class="form-group">
                    <label class="col-md-2 col-form-label"></label>
                    <input type="submit" value="Thêm" class="btn-danger"/>
                </div>
            </form>
        </div>
    </body>
</html>
