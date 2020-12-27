<%-- 
    Document   : gdThemMH
    Created on : Dec 9, 2020, 6:21:15 PM
    Author     : Xuan Toog
--%>

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
        <title>Thêm mặt hàng Page</title>
    </head>
    <body>
        <%
            LoaiMatHangDAO lmhDAO = new LoaiMatHangDAO();
            ArrayList<LoaiMatHang> lmhs = lmhDAO.getAllLoaiMatHang();
            DonViTinhDAO dvtDAO = new DonViTinhDAO();
            ArrayList<DonViTinh> dvts = dvtDAO.getAllDonViTinh();
        %>
        <div class="container">
            <h3>Thêm mặt hàng</h3>
            <form action="doThemMH.jsp" method="post">
                <div class="form-group">
                    <label for="tenMH" class="col-md-2 col-form-label">Tên mặt hàng: </label>
                    <input type="text" name="tenMH" id="tenMH"/>
                </div>
                <div class="form-group">
                    <label for="giaBan" class="col-md-2 col-form-label">Giá bán: </label>
                    <input type="text" name="giaBan" id="giaBan"/>
                </div>
                <div class="form-group">
                    <label for="mota" class="col-md-2 col-form-label">Mô tả: </label>
                    <input type="text" name="mota" id="mota"/>
                </div>
                <div class="form-group">
                    <label for="lmh" class="col-md-2 col-form-label">Loại mặt hàng:</label>
                    <select name="lmh_id" id="lmh">
                        <%
                            for (int i = 0; i < lmhs.size(); i++) {

                        %>      <option value="<%= lmhs.get(i).getId()%>"><%= lmhs.get(i).getTen()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="dvt" class="col-md-2 col-form-label">Đơn vị tính:</label>
                    <select name="dvt_id" id="dvt">
                        <%
                            for (int i = 0; i < dvts.size(); i++) {

                        %>      <option value="<%= dvts.get(i).getId()%>"><%= dvts.get(i).getTen()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label class="col-md-2 col-form-label"></label>
                    <input type="submit" value="Thêm" class="btn-danger"/>
                </div>
            </form>
        </div>
    </body>
</html>
