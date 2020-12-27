<%-- 
    Document   : doSuaNCC
    Created on : Dec 11, 2020, 11:25:18 PM
    Author     : Xuan Toog
--%>

<%@page import="dao.NhaCungCapDAO"%>
<%@page import="model.NhaCungCap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>doSuaNCC Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String ten = request.getParameter("ten");
            String diachi = request.getParameter("diachi");
            String sdt = request.getParameter("sdt");
            String mota = request.getParameter("mota");
            NhaCungCap ncc = new NhaCungCap();
            ncc.setId(id);
            ncc.setTen(ten);
            ncc.setDiaChi(diachi);
            ncc.setSdt(sdt);
            ncc.setMoTa(mota);
            
            NhaCungCapDAO nccDAO = new NhaCungCapDAO();
            int status = nccDAO.updateNCC(ncc);
            if(status==1) {
        %>
                <script type="text/javascript">
                    if(confirm("Sửa nhà cung cấp thành công! Bạn có muốn trở về trang chủ?")){
                        window.location.href = "<%= request.getContextPath() %>/nvkho/gdChinhNVKho.jsp";
                    }
                </script>
        <%
            }
            if(status==0) {
        %>
                <script type="text/javascript">
                    if(confirm("Sửa nhà cung cấp thất bại! Bạn có muốn quay lại trang quản lý thông tin nhà cung cấp?")){
                        window.location.href = "<%= request.getContextPath() %>/nvkho/gdSuaNCC.jsp?action=gdQuanLyNCC&&nccid_str=<%=id%>";
                    }
                </script>
        <%
            }
        %>
    </body>
</html>
