<%-- 
    Document   : forgotPass
    Created on : Jul 13, 2024, 4:32:03 PM
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
                display: flex;
            }

            .form-group i {
                padding-top: 10px;
                margin-top: 8px;
                padding-right: 10px;
                padding-left: 10px;
                background-color: #ddd;
                height: 40px;
                width: 10%;
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
            .hidden {
                display: none;
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
<!--            <div class="form-container sign-in-container" id="otpForm">
                <form action="#" onsubmit="return verifyOTP(event)">
                    <h1>Quên mật khẩu</h1>
                    <br>
                    <span>Nhập mã OTP mà chúng tôi vừa gửi bạn qua email</span>
                    <div class="form-group">
                        <i><img src="https://cdn-icons-png.flaticon.com/512/6690/6690133.png" alt="" style="width: 100%"></i>
                        <input type="text" style="width: 330px;" placeholder="Mã OTP" name="OTP" required />
                    </div>
                    <button type="submit" style="cursor: pointer;">Xác nhận</button>
                    <p>Muốn quay lại ? <a href="auth.jsp">Đăng nhập</a></p>
                </form>
            </div>-->
            
            <div class="form-container sign-in-container" id="passwordForm">
                <form action="forgot" method="POST">
                    <input type="hidden" name="otpRight" value="${otp}"/>
                    <input type="hidden" name="userID" value="${userID}"/>
                    <h1>Quên mật khẩu</h1>
                    <br>
                    <span>Nhập mã OTP mà chúng tôi vừa gửi bạn qua email</span>
                    <div class="form-group">
                        <i style="margin-left:4%;"><img src="https://cdn-icons-png.flaticon.com/512/6690/6690133.png" alt="" style="width: 100%"></i>
                        <input type="number" style="width: 330px;" placeholder="Mã OTP" name="OTP" required />
                    </div>
                    <span style="margin-left: -55%; font-weight: bold; font-size: 14px; color: #544e4e;">Nhập mật khẩu mới</span>
                    <div class="form-group">
                        <i class="fas fa-key"></i>
                        <input type="password" style="width: 330px;" placeholder="Mật khẩu mới" name="newPass" required />
                    </div>
                    <button style="cursor: pointer;" type="submit">Xác nhận</button>
                    <p>Muốn quay lại ? <a href="auth.jsp">Đăng nhập</a></p>
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
                    if (notifyAuth === "saiOtp") {
                        alert("Sai mã otp! nhập lại mã!");
                    }
                    // Remove the hidden input field after alert
                    notifyForgotField.remove();
                }
            };
        </script>
        
<!--        <script>
            function verifyOTP(event) {
                event.preventDefault(); // Ngăn chặn việc gửi form

                const enteredOTP = document.querySelector('input[name="OTP"]').value;
                const correctOTP = "123456"; // Mã OTP chính xác, thay đổi theo thực tế

                if (enteredOTP === correctOTP) {
                    document.getElementById('otpForm').classList.add('hidden');
                    document.getElementById('passwordForm').classList.remove('hidden');
                } else {
                    alert('Mã OTP không chính xác, vui lòng thử lại.');
                }
            }
        </script>-->
    </body>
</html>
