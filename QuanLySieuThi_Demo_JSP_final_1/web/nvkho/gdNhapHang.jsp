<%-- 
    Document   : gdNhapHang
    Created on : Nov 27, 2020, 8:07:21 AM
    Author     : Xuan Toog
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*, dao.*, model.*"    
        %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhập hàng Page</title>
        <%
            NhanVien nv = (NhanVien) session.getAttribute("nvkho");
            SieuThi sieuthi = (SieuThi) session.getAttribute("sieuthi");
            NhaCungCap ncc = new NhaCungCap();

            HoaDonNhap hoadonnhap; // khai báo hóa đơn nhập

            String tenMH = ""; // khai báo tên mặt hàng cần tìm
            ArrayList<MatHang> mhs = new ArrayList<MatHang>();; // khai báo danh sách mặt hàng chứa tên mặt hàng cần tìm
            ArrayList<HoaDonNhap_MatHang> list_mathangnhap = new ArrayList<HoaDonNhap_MatHang>(); // khai báo danh sách HoaDonNhap_MatHang

            String action = (String) request.getParameter("action"); // kiểm tra xem được gọi từ trang nào?
            if (action.equals("gdTimNCC")) {
                ArrayList<NhaCungCap> nccs = (ArrayList<NhaCungCap>) session.getAttribute("nccs");
                int index = Integer.parseInt(request.getParameter("index"));
                // lấy id nhà cung cấp mà người dùng đã chọn
                int nccID = nccs.get(index).getId();
                session.setAttribute("nccID", nccID); // thêm nccID vào session
//                out.println(nccID);

                ncc = nccs.get(index);
                session.setAttribute("ncc", ncc); // thêm ncc vào session
//                out.println("<br>" + ncc);

                // khởi tạo hóa đơn nhập
                hoadonnhap = new HoaDonNhap();
                session.setAttribute("hoadonnhap", hoadonnhap); // gán hoadonnhap vào session

                // tạo 1 danh sách nhập hàng nhập mới
                list_mathangnhap = new ArrayList<HoaDonNhap_MatHang>();
                session.setAttribute("list_mathangnhap", list_mathangnhap);

//                out.println(list_mathangnhap);
            }
            if (action.equals("timMH")) {
                // lấy nccID từ session
                int nccID = Integer.parseInt(session.getAttribute("nccID").toString());
//                out.println(nccID);
                // lấy thông từ ncc từ session
                ncc = (NhaCungCap) session.getAttribute("ncc");
//                out.println("<br>" + ncc);

                tenMH = request.getParameter("tenMH");
                session.setAttribute("tenMH", tenMH);
                
                MatHangDAO mathangDAO = new MatHangDAO();
                mhs = mathangDAO.searchMHTheoTen(tenMH);
                session.setAttribute("mhs", mhs);

                // lấy danh sách mặt hàng đã nhập
                list_mathangnhap = (ArrayList<HoaDonNhap_MatHang>) session.getAttribute("list_mathangnhap");

//                out.println(list_mathangnhap);
            }
            if (action.equals("themMHnhap")) {
                // lấy nccID từ session
                int nccID = Integer.parseInt(session.getAttribute("nccID").toString());
//                out.println(nccID);
                // lấy thông từ ncc từ session
                ncc = (NhaCungCap) session.getAttribute("ncc");
//                out.println("<br>" + ncc);

                // hiển thị phần tìm kiếm mặt hàng
                tenMH = session.getAttribute("tenMH").toString();
                MatHangDAO mathangDAO = new MatHangDAO();
                mhs = mathangDAO.searchMHTheoTen(tenMH);
                session.setAttribute("mhs", mhs);

                // lấy danh sách mặt hàng đã nhập
                list_mathangnhap = (ArrayList<HoaDonNhap_MatHang>) session.getAttribute("list_mathangnhap");

                int index = Integer.parseInt(request.getParameter("index"));

                MatHang mh = mhs.get(index);
                float giaNhap = 0;
                int soLuong = 0;
                float khuyenMai = 0;
                if (request.getParameter("giaNhap") != "") {
                    giaNhap = Float.parseFloat(request.getParameter("giaNhap"));
                }
                if (request.getParameter("soLuong") != "") {
                    soLuong = Integer.parseInt(request.getParameter("soLuong"));
                }
                if (request.getParameter("khuyenMai") != "") {
                    khuyenMai = Float.parseFloat(request.getParameter("khuyenMai"));
                }
                list_mathangnhap.add(new HoaDonNhap_MatHang(giaNhap, soLuong, khuyenMai, mh));

                session.setAttribute("list_mathangnhap", list_mathangnhap); // cập nhật lại ds mặt hàng nhập

//                out.println(list_mathangnhap);
            }
            if (action.equals("xoaMHnhap")) {
                // lấy nccID từ session
                int nccID = Integer.parseInt(session.getAttribute("nccID").toString());
//                out.println(nccID);
                // lấy thông từ ncc từ session
                ncc = (NhaCungCap) session.getAttribute("ncc");
//                out.println("<br>" + ncc);

                // hiển thị phần tìm kiếm mặt hàng
                tenMH = session.getAttribute("tenMH").toString();
                MatHangDAO mathangDAO = new MatHangDAO();
                mhs = mathangDAO.searchMHTheoTen(tenMH);
                session.setAttribute("mhs", mhs);

                // lấy danh sách mặt hàng đã nhập
                list_mathangnhap = (ArrayList<HoaDonNhap_MatHang>) session.getAttribute("list_mathangnhap");

                int index = Integer.parseInt(request.getParameter("index"));
                list_mathangnhap.remove(index);
                session.setAttribute("list_mathangnhap", list_mathangnhap); // cập nhật lại ds mặt hàng nhập

//                out.println(list_mathangnhap);
            }


        %>
    </head>
    <style>
        input:required {
            outline: none;
        }
        input:required:focus {
            border: 2px solid;
        }
    </style>

    <body>
        <div class="container">
            <h3 style="text-align: center;">Nhập hàng</h3>
            <a href="gdThemMH.jsp" target="_blank"><button class="btn btn-danger">Thêm mặt hàng mới</button></a>

            <br><br><hr>
            <h4 style="text-align: center;">Tìm kiếm mặt hàng + Nhập hàng</h4>
            <form action="gdNhapHang.jsp" method="POST">
                <input type="hidden" name="action" value="timMH"/>
                <input type="text" name="tenMH" placeholder="Tên mặt hàng..." value="<%= tenMH%>"/>
                <input type="submit" value="Tìm" class="btn-danger">
            </form>

            <br>
            <table class="table table-hover">
                <tr class="table-danger">
                    <th>ID</th>
                    <th>Tên mặt hàng</th>
                    <th>Giá nhập (VNĐ)</th>
                    <th>Số lượng</th>
                    <th>Khuyến mãi %</th>
                    <th>Đơn vị tính</th>
                    <th>Action</th>
                </tr>
                <% for (int i = 0; i < mhs.size(); i++) {%>    
                <tr>
                <form action="gdNhapHang.jsp" method="post">
                    <input type="hidden" name="action" value="themMHnhap"/>
                    <td>
                        <%= mhs.get(i).getId()%>
                        <input type="hidden" name="index" value="<%= i%>"/>
                    </td>
                    <td><%= mhs.get(i).getTen()%></td>
                    <td><input type="text" name="giaNhap" required/></td>
                    <td><input type="text" name="soLuong" required/></td>
                    <td><input type="text" name="khuyenMai"/></td>
                    <td><%= mhs.get(i).getDonViTinh().getTen()%></td>
                    <td>
                        <input type="submit" value="Thêm vào danh sách hàng nhập"/>
                    </td>
                </form> 
                </tr>
                <% } %>
            </table>

            <br><br><hr>

            <%
                list_mathangnhap = (ArrayList<HoaDonNhap_MatHang>) session.getAttribute("list_mathangnhap");

                float tongtien = 0; // tổng tiền của tất cả các mặt hàng nhập
                ArrayList<Float> thanhtiens = new ArrayList<Float>(); // thành tiền của từng mặt hàng nhập

                for (HoaDonNhap_MatHang mhnhap : list_mathangnhap) {
                    if (mhnhap.getKhuyenMai() == 0) {
                        float tmp = mhnhap.getGiaNhap() * mhnhap.getSoLuong();
                        thanhtiens.add(tmp);
                        tongtien += tmp;
                    } else {
                        float tmp = mhnhap.getGiaNhap() * mhnhap.getSoLuong()
                                - (mhnhap.getGiaNhap() * mhnhap.getSoLuong() * mhnhap.getKhuyenMai() / 100);
                        thanhtiens.add(tmp);
                        tongtien += tmp;
                    }
                }

                session.setAttribute("tongtien", tongtien);

            %>

            <h4 style="text-align: center;">Danh sách hàng nhập</h4>
            <table class="table table-hover">
                <tr class="table-danger">
                    <th>TT</th>
                    <th>ID</th>
                    <th>Tên mặt hàng</th>
                    <th>Giá nhập (VNĐ)</th>
                    <th>Số lượng</th>
                    <th>Khuyến mãi %</th>
                    <th>Thành tiền (VNĐ)</th>
                    <th>Action</th>
                </tr>

                <% for (int i = 0; i < list_mathangnhap.size(); i++) {%>    
                <tr>

                <form action="gdNhapHang.jsp" method="post">
                    <input type="hidden" name="action" value="xoaMHnhap"/>
                    <td>
                        <%= i + 1%>
                        <input type="hidden" name="index" value="<%=i%>"/>
                    </td>
                    <td><%= list_mathangnhap.get(i).getMatHang().getId()%></td>
                    <td><%= list_mathangnhap.get(i).getMatHang().getTen()%></td>
                    <td><%= list_mathangnhap.get(i).getGiaNhap()%></td>
                    <td><%= list_mathangnhap.get(i).getSoLuong()%></td>
                    <td><%= list_mathangnhap.get(i).getKhuyenMai()%></td>
                    <td><%= thanhtiens.get(i)%></td>
                    <td>
                        <input type="submit" value="Xóa khỏi danh sách hàng nhập"/>
                    </td>
                </form> 
                </tr>
                <% }%>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>Tổng tiền = <%= tongtien%></td>
                    <td></td>
                </tr>    
            </table>

            <div class="justify-content-center text-center">
                <p>Nhà cung cấp: <%= ncc.getTen() %></p>
                <p>Siêu thị: <%= sieuthi.getTen() %></p>
                <p>Nhân viên kho: <%= nv.getName() %></p>
            </div>

            <div class="d-flex justify-content-center">
                <form action="doNhapHang.jsp" method="POST" class="form-inline ">
                    <label for="hinhthucthanhtoan">Hình thức thanh toán:</label>
                    <select name="hinhthucthanhtoan" id="hinhthucthanhtoan">
                        <option value="Tiền mặt">Tiền mặt</option>
                        <option value="Thẻ tín dụng">Thẻ tín dụng</option>
                    </select>
                    <label for="ghichu">Ghi chú</label>
                    <input type="text" name="ghichu" id="ghichu"/>
                    <input type="submit" value="Lưu hóa đơn" class="btn-danger"/>
                </form>
            </div>
            
            <br><br>
        </div>
    </body>
</html>
