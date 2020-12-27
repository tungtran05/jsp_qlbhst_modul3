<%-- 
    Document   : doDangNhap
    Created on : Nov 26, 2020, 9:43:10 PM
    Author     : Xuan Toog
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
    import="java.util.*, dao.*, model.*"   
        %>
<%
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");
    
    ThanhVien tv = new ThanhVien();
    tv.setUsername(username);
    tv.setPassword(password);
    
    ThanhVienDAO tvDAO = new ThanhVienDAO();
    boolean check = tvDAO.kiemtraDangNhap(tv);
    out.println(check);
    
    if(check){
        tv = tvDAO.getThanhVienByUsernameAndPass(username, password); // get thông tin nhân viên
        out.println(tv);
        SieuThiDAO sieuthiDAO = new SieuThiDAO();
        SieuThi sieuthi = sieuthiDAO.getSieuThiByThanhVienId(tv.getId()); // lấy thông tin siêu thị qua id nhân viên
        session.setAttribute("sieuthi", sieuthi);
        
        NhanVienDAO nvDAO = new NhanVienDAO();
        NhanVien nv = nvDAO.getNhanVienByUsernameAndPass(username, password);
        if(nv.getViTri().equals("nvkho")){
            session.setAttribute("nvkho", nv);
            response.sendRedirect("nvkho\\gdChinhNVKho.jsp");
        }
        if(nv.getViTri().equals("nvquanly")){
            session.setAttribute("nvquanly", nv);
            response.sendRedirect("nvquanly\\gdChinhNVQuanLy.jsp");
        }
    }
    else {
        out.println("Username or password failed!");
        response.sendRedirect("gdDangNhap.jsp");
    }
    
%>
