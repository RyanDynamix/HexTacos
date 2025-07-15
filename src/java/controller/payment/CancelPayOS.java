//package controller.payment;
//
//import dal.OrderDAO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
///**
// *
// * @author ASUS
// */
//@WebServlet("/cancelPayOS")
//public class CancelPayOS extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException, IOException {
//        String orderCode = request.getParameter("orderCode");
//        if (orderCode != null) {
//            try {
//                int orderID = Integer.parseInt(orderCode);
//                OrderDAO dao = new OrderDAO();
//                dao.updatePaymentStatus(orderID, "Unpaid"); // hoặc "Canceled"
//            } catch (Exception e) {
//                // Log nếu cần
//            }
//        }
//        // Sau đó về trang thông báo đẹp:
//        request.setAttribute("paymentStatus", "failed");
//        request.setAttribute("orderID", orderCode);
//        request.setAttribute("message", "Bạn đã hủy thanh toán, đơn hàng chưa được thanh toán.");
//        request.getRequestDispatcher("return.jsp").forward(request, response);
//    }
//}
