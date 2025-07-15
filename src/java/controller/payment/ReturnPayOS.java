package controller.payment;

import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/returnPayOS")
public class ReturnPayOS extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderCode = request.getParameter("orderCode");
        String status = request.getParameter("status");

        String paymentStatus = "error";
        String message = "Có lỗi xảy ra, không xác định được trạng thái thanh toán.";

        // Đảm bảo orderCode là số hợp lệ
        if (orderCode != null && orderCode.matches("\\d+")) {
            int orderID = Integer.parseInt(orderCode);
            OrderDAO dao = new OrderDAO();

            if ("PAID".equalsIgnoreCase(status)) {
                paymentStatus = "success";
                message = "Thanh toán thành công! Cảm ơn bạn đã mua hàng.";
                dao.confirmOrder(orderID, "PAYOS", "Paid");
            } 
            // Lấy cả CANCEL, CANCELLED, FAILED đều trả về Unpaid
            else if ("CANCEL".equalsIgnoreCase(status) 
                  || "CANCELLED".equalsIgnoreCase(status)
                  || "FAILED".equalsIgnoreCase(status)) {
                paymentStatus = "failed";
                if ("CANCEL".equalsIgnoreCase(status) || "CANCELLED".equalsIgnoreCase(status)) {
                    message = "Giao dịch bị hủy. Đơn hàng chưa được thanh toán.";
                } else {
                    message = "Thanh toán thất bại! Vui lòng thử lại hoặc liên hệ hỗ trợ.";
                }
                dao.confirmOrder(orderID, "PAYOS", "Unpaid"); // <--- Cập nhật DB
            }
        }

        request.setAttribute("paymentStatus", paymentStatus);
        request.setAttribute("message", message);
        request.setAttribute("orderID", orderCode);

        request.getRequestDispatcher("/payment/payment-result.jsp").forward(request, response);
    }
}

