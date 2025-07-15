<%-- 
    Document   : emailAuth
    Created on : Jul 13, 2024, 4:24:43 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quên mật khẩu</title>
        <link rel="shortcut icon" href="./img_svg/mainPage/logo-color.png">
        <link rel="stylesheet" href="./css/authCss/cssAuth.css">
        <script src="https://kit.fontawesome.com/54f0cb7e4a.js" crossorigin="anonymous"></script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');

            .form-group {
                padding-bottom: 10px;
                margin-top: 15px;
                display: flex;
            }

            .form-group i {
                padding-top: 13px;
                margin-top: 8px;
                padding-right: 10px;
                padding-left: 10px;
                background-color: #ddd;
                height: 40px;
            }
            .container{
                width: 500px;
            }
            .sign-in-container{
                width: 100%;
            }
            .back-btn {
                position: relative;
                right: 12%;
                top: 50px;
                z-index: 999;
            }
        </style>
    </head>
    <body>
        <%-- Thông báo lỗi --%>
        <c:if test="${not empty notifyForgot}">
            <input type="hidden" id="notifyForgot" value="${notifyForgot}" />
            <c:remove var="notifyForgot" scope="request" />
        </c:if>
        
        <h2 class="pacifico-regular">HexTech - Công nghệ thay đổi cuộc sống</h2>
        <a class="back-btn" href="homePage"><i class="fas fa-backward"></i> Trang chủ</a>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <form action="forgot" method="GET">
                    <input type="hidden" name="action" value="email"/>
                    <h1>Quên mật khẩu</h1>
                    <br>
                    <span>Cung cấp tài khoản email của bạn</span>
                    <div class="form-group">
                        <i class="fas fa-envelope"></i>
                        <input type="text" style="width: 330px;" placeholder="Email của bạn" name="email" required />
                    </div>
                    <button style="cursor: pointer;" type="submit">Gửi yêu cầu</button>
                    <p>Muốn quay lại ? <a href="auth.jsp" style="color: blue">Đăng nhập</a></p>
                </form>
            </div>
        </div>


        <footer>
            <p>
                Created with <i class="fa fa-heart"></i> by
                Hoang Nam & Trung Kien & Khanh Nhan & Ngoc Trung & Huu Quang
            </p>
        </footer>

        <script src="./myJs/authJs/myCodeAuth.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        <script>
            window.onload = function () {
                var notifyForgotField = document.getElementById('notifyForgot');
                if (notifyForgotField) {
                    var notifyAuth = notifyForgotField.value;
                    if (notifyAuth === "NotFound") {
                        alert("Không tìm thấy tài khoản trên!");
                    }
                    // Remove the hidden input field after alert
                    notifyForgotField.remove();
                }
            };
        </script>
        
    </body>
</html>
