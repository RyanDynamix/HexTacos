<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f8fafc 0%, #e0ecfa 100%);
            min-height: 100vh;
        }
        .payment-result {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .result-card {
            max-width: 440px;
            padding: 2.5rem 2rem 2rem 2rem;
            border-radius: 22px;
            background: #fff;
            box-shadow: 0 8px 32px 0 rgba(60,60,140,0.10), 0 2px 4px 0 rgba(60,60,140,0.08);
            border-left: 6px solid #28a745;
            animation: popIn .5s cubic-bezier(.26,1.44,.43,.97);
            transition: border-color .3s;
        }
        .result-card.failed { border-left: 6px solid #dc3545; }
        .result-card.error { border-left: 6px solid #ffc107; }
        @keyframes popIn {
            0% { transform: scale(0.95) translateY(30px); opacity: 0; }
            100% { transform: scale(1) translateY(0); opacity: 1; }
        }
        .result-icon {
            font-size: 4.6rem;
            margin-bottom: .3rem;
            text-shadow: 0 4px 20px rgba(50,160,110,.06);
            animation: bounce .6s;
        }
        @keyframes bounce {
            0% { transform: scale(0.7);}
            70% { transform: scale(1.10);}
            100% { transform: scale(1);}
        }
        .result-title {
            font-weight: bold;
            font-size: 2rem;
            margin-top: .5rem;
            letter-spacing: .01em;
        }
        .info-list {
            border-top: 1px solid #eee;
            margin-top: 1.2rem;
            padding-top: 1.2rem;
        }
        .info-row {
            margin-bottom: 0.5rem;
        }
        .amount-box {
            font-size: 1.3rem;
            font-weight: bold;
            color: #005a9e;
            background: #f5fafd;
            padding: .4rem 0.7rem;
            border-radius: 7px;
            margin-bottom: 1rem;
            display: inline-block;
        }
        .btn-primary, .btn-outline-primary { border-radius: 2rem; padding-left: 1.3em; padding-right: 1.3em; }
        .btn-primary { box-shadow: 0 2px 8px rgba(30, 110, 180, 0.13);}
        .text-small { font-size: .96rem; color: #888;}
    </style>
</head>
<body>
<div class="payment-result">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-auto">
                <div class="result-card 
                    <c:choose>
                        <c:when test="${paymentStatus == 'failed'}">failed</c:when>
                        <c:when test="${paymentStatus == 'error'}">error</c:when>
                        <c:otherwise>success</c:otherwise>
                    </c:choose>
                ">
                    <div class="text-center">
                        <c:choose>
                            <c:when test="${paymentStatus == 'success'}">
                                <i class="fas fa-check-circle text-success result-icon"></i>
                                <div class="result-title text-success">Thanh toán thành công!</div>
                            </c:when>
                            <c:when test="${paymentStatus == 'failed'}">
                                <i class="fas fa-times-circle text-danger result-icon"></i>
                                <div class="result-title text-danger">Thanh toán thất bại!</div>
                            </c:when>
                            <c:otherwise>
                                <i class="fas fa-exclamation-triangle text-warning result-icon"></i>
                                <div class="result-title text-warning">Có lỗi xảy ra!</div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="mt-3">
                        <p class="lead text-center text-small">
                            <c:out value="${message}" default="Không có thông báo." />
                        </p>
                        <div class="info-list">
                            <c:if test="${not empty orderID}">
                                <div class="row info-row">
                                    <div class="col-5 fw-bold">Mã đơn hàng:</div>
                                    <div class="col-7">${orderID}</div>
                                </div>
                            </c:if>
                            <c:if test="${not empty transactionId}">
                                <div class="row info-row">
                                    <div class="col-5 fw-bold">Mã giao dịch:</div>
                                    <div class="col-7">${transactionId}</div>
                                </div>
                            </c:if>
                            <c:if test="${not empty amount}">
                                <div class="row info-row">
                                    <div class="col-5 fw-bold">Số tiền:</div>
                                    <div class="col-7">
                                        <span class="amount-box">
                                            <fmt:formatNumber value="${amount}" type="currency" currencySymbol="₫"/>
                                        </span>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${not empty payDate}">
                                <div class="row info-row">
                                    <div class="col-5 fw-bold">Thời gian thanh toán:</div>
                                    <div class="col-7">${payDate}</div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <c:choose>
                            <c:when test="${paymentStatus == 'success'}">
                                <a href="homePage" class="btn btn-primary me-2 px-4">Tiếp tục mua sắm</a>
                                <a href="deliveryList" class="btn btn-outline-primary px-4">Xem đơn hàng</a>
                            </c:when>
                            <c:otherwise>
                                <a href="shopping" class="btn btn-primary me-2 px-4">Quay lại giỏ hàng</a>
                                <a href="homePage" class="btn btn-outline-primary px-4">Trang chủ</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
