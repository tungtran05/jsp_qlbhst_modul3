<%-- 
    Document   : gdDangNhap
    Created on : Nov 25, 2020, 10:56:09 AM
    Author     : Xuan Toog
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dang Nhap Page</title>
    </head>
    <body>
        <div class="container w-25">
            <form action="doDangNhap.jsp" method="POST">
                <div class="mb-3">
                    <label for="username" class="form-label">Tên đăng nhập:</label>
                    <input type="text" name="username" placeholder="Tên đăng nhập" class="form-control">
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu:</label>
                    <input type="password" name="password" placeholder="Mật khẩu" class="form-control">
                </div>
                <div class="mb-3 text-center">
                <input type="submit" value="Đăng nhập" class="btn btn-danger">
                </div>
            </form>
        </div>
    </body>
</html>
