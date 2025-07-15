//package controller.payment;
//
//import dal.OrderDAO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import model.Orders;
//import model.Users;
//import java.io.IOException;
//import java.net.URLEncoder;
//import java.nio.charset.StandardCharsets;
//import java.util.*;
//
//@WebServlet("/VnpayReturn")
//public class VnpayReturn extends HttpServlet {
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        Map<String, String> fields = new HashMap<>();
//        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
//            String key = params.nextElement();
//            String value = request.getParameter(key);
//            if (value != null && !value.isEmpty()) {
//                fields.put(key, value);
//            }
//        }
//
//        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
//        // Loại bỏ SecureHash khỏi fields để verify
//        fields.remove("vnp_SecureHash");
//        fields.remove("vnp_SecureHashType");
//
//        // Tạo hash để verify theo cách giống như khi tạo
//        String rawData = Config.hashAllFields(fields);
//        String signValue = Config.sign(rawData); // ensure same hashing logic
//        boolean isValidSignature = signValue.equals(vnp_SecureHash);
//        boolean isSuccessCode = "00".equals(request.getParameter("vnp_ResponseCode"));
//        boolean isSuccess = isValidSignature && isSuccessCode;
//
//        HttpSession session = request.getSession();
//        String message;
//        OrderDAO dao = new OrderDAO();
//
//        // --- THU THẬP THÔNG TIN TỪ SESSION ---
//        Integer orderID = (Integer) session.getAttribute("pendingOrderID");
//        Double totalMoney = (Double) session.getAttribute("pendingAmount");
//        String nameOrder = (String) session.getAttribute("pendingNameOrder");
//        String phone = (String) session.getAttribute("pendingPhone");
//        String address = (String) session.getAttribute("pendingDeliveryLocation");
//
//        // --- FALLBACK TỪ REQUEST NẾU MẤT SESSION ---
//        if (orderID == null) {
//            try {
//                orderID = Integer.parseInt(request.getParameter("vnp_TxnRef"));
//            } catch (Exception e) {
//                orderID = null;
//            }
//        }
//
//        if (orderID != null && (totalMoney == null || nameOrder == null || phone == null || address == null)) {
//            // fallback từ database
//            Orders order = dao.getOrderById(orderID);
//            if (order != null) {
//                totalMoney = order.getTotalMoney();
//                nameOrder = order.getNameOrder();
//                phone = order.getPhone();
//                address = order.getDeliveryLocation();
//            }
//        }
//
//        // Debug log để kiểm tra
//        System.out.println("=== VNPay Return Debug ===");
//        System.out.println("Received signature: " + vnp_SecureHash);
//        System.out.println("Calculated signature: " + signValue);
//        System.out.println("Signature valid: " + isValidSignature);
//        System.out.println("Response code: " + request.getParameter("vnp_ResponseCode"));
//        System.out.println("OrderID: " + orderID);
//
//        // --- XÁC NHẬN VÀ CẬP NHẬT ĐƠN HÀNG ---
//        if (isSuccess && orderID != null && totalMoney != null && nameOrder != null) {
//            Orders order = new Orders();
//            order.setOrderID(orderID);
//            order.setOrderConfirmed(true);
//            order.setPaymentType("VNPAY");
//            order.setPaymentStatus("Paid");
//            order.setOrderDate(new java.sql.Date(System.currentTimeMillis()));
//            order.setTotalMoney(totalMoney);
//            order.setNameOrder(nameOrder);
//            order.setPhone(phone);
//            order.setDeliveryLocation(address);
//            order.setDeliveryStatus("Processing");
//
//            dao.updateOrderAfterPayment(order);
//            message = "Thanh toán thành công!";
//        } else {
//            isSuccess = false;
//            message = "Thanh toán thất bại hoặc thiếu thông tin đơn hàng!";
//            if (!isValidSignature) {
//                message += " (Lỗi chữ ký)";
//            }
//        }
//
//        // XÓA SESSION CŨ
//        session.removeAttribute("pendingOrderID");
//        session.removeAttribute("pendingAmount");
//        session.removeAttribute("pendingNameOrder");
//        session.removeAttribute("pendingPhone");
//        session.removeAttribute("pendingDeliveryLocation");
//
//        // TRUYỀN THÔNG TIN TỚI TRANG JSP
//        request.setAttribute("paymentStatus", isSuccess ? "success" : "failed");
//        request.setAttribute("message", message);
//        request.setAttribute("orderID", request.getParameter("vnp_TxnRef"));
//        request.setAttribute("transactionId", request.getParameter("vnp_TransactionNo"));
//        request.setAttribute("vnp_Amount", request.getParameter("vnp_Amount"));
//        request.setAttribute("vnp_BankCode", request.getParameter("vnp_BankCode"));
//        request.setAttribute("vnp_PayDate", request.getParameter("vnp_PayDate"));
//
//        request.getRequestDispatcher("payment-result.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse res)
//            throws ServletException, IOException {
//        processRequest(req, res);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse res)
//            throws ServletException, IOException {
//        processRequest(req, res);
//    }
//}
