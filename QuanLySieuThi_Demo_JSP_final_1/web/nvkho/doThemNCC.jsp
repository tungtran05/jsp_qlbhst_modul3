<%-- 
    Document   : doThemNCC
    Created on : Dec 9, 2020, 4:46:30 PM
    Author     : Xuan Toog
--%>

<%@page import="model.NhaCungCap"%>
<%@page import="dao.NhaCungCapDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>doThemNCC Page</title>
    </head>

    <body>
        <%
            String ten = request.getParameter("tenNCC");
            String diaChi = request.getParameter("diachi");
            String sdt = request.getParameter("sdt");
            String moTa = request.getParameter("mota");

            NhaCungCapDAO nccDAO = new NhaCungCapDAO();
            int status = nccDAO.addNCC(new NhaCungCap(ten, diaChi, sdt, moTa));

            if(status==1) {
        %>
                <script type="text/javascript">
                    if(confirm("Thêm nhà cung cấp thành công! Bạn có muốn trở về trang chủ?")){
                        window.location.href = "<%= request.getContextPath() %>/nvkho/gdChinhNVKho.jsp";
                    }
                </script>
        <%
            }
            if(status==0) {
        %>
                <script type="text/javascript">
                    if(confirm("Thêm nhà cung cấp thất bại! Bạn có muốn quay lại thêm nhà cung cấp?")){
                        window.location.href = "<%= request.getContextPath() %>/nvkho/gdThemNCC.jsp";
                    }
                </script>
        <%
            }
        %>
        
        
    </body>
</html>
