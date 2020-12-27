<%-- 
    Document   : doXoaNCC.jsp
    Created on : Dec 11, 2020, 11:46:53 PM
    Author     : Xuan Toog
--%>

<%@page import="model.NhaCungCap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.NhaCungCapDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>doXoaNCC Page</title>
    </head>
    <body>
        <%
            int index = Integer.parseInt(request.getParameter("index"));
            ArrayList<NhaCungCap> nccs = (ArrayList<NhaCungCap>)session.getAttribute("nccs");
            int id = nccs.get(index).getId();
            
            NhaCungCapDAO nccDAO = new NhaCungCapDAO();
            int status = nccDAO.deleteNCC(id);
            
            if(status==1) {
        %>
                <script type="text/javascript">
                    if(confirm("Xóa nhà cung cấp thành công! Bạn có muốn trở về trang quản lý nhà cung cấp?")){
                        window.location.href = "<%= request.getContextPath() %>/nvkho/gdQuanLyNCC.jsp?action=gdNVKho";
                    }
                </script>
        <%
            }
            if(status==0) {
        %>
                <script type="text/javascript">
                    if(confirm("Xóa nhà cung cấp thất bại! Bạn có muốn quay lại trang quản lý thông tin nhà cung cấp?")){
                        window.location.href = "<%= request.getContextPath() %>/nvkho/gdQuanLyNCC.jsp?action=doXoaNCC";
                    }
                </script>
        <%
            }
        %>
    </body>
</html>
