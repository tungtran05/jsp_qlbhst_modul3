<%-- 
    Document   : doThemMH
    Created on : Dec 9, 2020, 6:21:39 PM
    Author     : Xuan Toog
--%>

<%@page import="model.DonViTinh"%>
<%@page import="dao.DonViTinhDAO"%>
<%@page import="model.MatHang"%>
<%@page import="dao.MatHangDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>doThemMatHang Page</title>
    </head>
    <body>
        <%
            String tenMH = request.getParameter("tenMH");
            Float giaBan = Float.parseFloat(request.getParameter("giaBan"));
            String moTa = request.getParameter("mota");
            int lmh_id = Integer.parseInt(request.getParameter("lmh_id"));
            int dvt_id = Integer.parseInt(request.getParameter("dvt_id"));
            DonViTinhDAO dvtDAO = new DonViTinhDAO();
            DonViTinh dvt = dvtDAO.getDonViTinhTheoId(dvt_id);
            MatHang mh = new MatHang(tenMH, giaBan, moTa, dvt);
            
            MatHangDAO mhDAO = new MatHangDAO();
            int status = mhDAO.addMatHang(mh, lmh_id);
            if(status==1) {
        %>
                <script type="text/javascript">
                    if(confirm("Thêm mặt hàng thành công! Bạn có muốn trở về trang chủ?")){
                        window.location.href = "<%= request.getContextPath() %>/nvkho/gdChinhNVKho.jsp";
                    }
                </script>
        <%
            }
            if(status==0) {
        %>
                <script type="text/javascript">
                    if(confirm("Thêm nhà cung cấp thất bại! Bạn có muốn quay lại trang thêm mặt hàng?")){
                        window.location.href = "<%= request.getContextPath() %>/nvkho/gdThemMH.jsp";
                    }
                </script>
        <%
            }
        %>
    </body>
</html>
