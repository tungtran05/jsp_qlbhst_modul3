<%-- 
    Document   : doNhapHang
    Created on : Nov 28, 2020, 5:52:46 PM
    Author     : Xuan Toog
--%>

<%@page import="dao.HoaDonNhapDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MatHangDAO"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    NhanVien nv = (NhanVien) session.getAttribute("nvkho"); // lấy thông tin nhân viên kho
    int nvkhoID = nv.getId(); // lấy id của nhân viên kho

    SieuThi sieuthi = (SieuThi) session.getAttribute("sieuthi"); // lấy thông tin siêu thị
    int sieuthiID = sieuthi.getId(); // lấy id của siêu thị

    NhaCungCap ncc = (NhaCungCap) session.getAttribute("ncc"); // lấy thông tin nhà cung cấp
    int nccID = Integer.parseInt(session.getAttribute("nccID").toString()); // lấy id của nhà cung cấp

    HoaDonNhap hoadonnhap = (HoaDonNhap) session.getAttribute("hoadonnhap"); // lấy hóa đơn nhập từ gdNhapHang.jsp ra

    ArrayList<HoaDonNhap_MatHang> list_mathangnhap
            = (ArrayList<HoaDonNhap_MatHang>) session.getAttribute("list_mathangnhap");
//    out.println(list_mathangnhap);

    hoadonnhap.setThoiGianXuat(new java.util.Date());
    hoadonnhap.setHinhThucThanhToan(request.getParameter("hinhthucthanhtoan"));
    hoadonnhap.setGhiChu(request.getParameter("ghichu"));
    hoadonnhap.setTongtien(Float.parseFloat(session.getAttribute("tongtien").toString()));
    out.println(Float.parseFloat(session.getAttribute("tongtien").toString()));
    hoadonnhap.setNhanVien(nv);
    hoadonnhap.setSieuThi(sieuthi);
    hoadonnhap.setNhaCungCap(ncc);
    hoadonnhap.setListHoaDonNhap_MatHang(list_mathangnhap);

    boolean status = false;
    if(list_mathangnhap.size() > 0){ // nếu danh sách mặt hàng nhập không rỗng
        HoaDonNhapDAO hdnDAO = new HoaDonNhapDAO();
        status = hdnDAO.luuHoaDonNhap(hoadonnhap);
    }
//    out.println(status);

    if(status == true) {
%>
        <script type="text/javascript">
            if (confirm("Thêm hóa đơn thành công! Bạn có muốn trở về trang chủ?")) {
                window.location.href = "<%= request.getContextPath() %>/nvkho/gdChinhNVKho.jsp";
            }
        </script>
<%
    }
    if(status == false ) {
%>
        <script type="text/javascript">
            if (confirm("Thêm hóa đơn thất bại! Bạn có muốn quay lại trang tìm nhà cung cấp để nhập hàng?")) {
                window.location.href = "<%= request.getContextPath() %>/nvkho/gdTimVaChonNCC.jsp?action=gdNVKho";
            }
        </script>
<%
    }
%>
