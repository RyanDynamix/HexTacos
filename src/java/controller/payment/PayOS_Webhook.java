package controller.payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/payosWebhook")
public class PayOS_Webhook extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đọc raw body JSON
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String requestBody = sb.toString();

        // Lấy signature (có thể ở header hoặc trong body)
        String signature = request.getHeader("x-payos-hmac-signature");
        // Nếu signature nằm trong body, bạn phải lấy nó từ JSON, ví dụ:
        // String signature = new JSONObject(requestBody).getString("signature");

        boolean isValid = PayOS_Helper.isValidSignature(requestBody, signature);

        if (isValid) {
            // Đúng signature, xử lý cập nhật trạng thái đơn hàng tại đây
            // Bạn parse JSON và update DB tùy logic của bạn

            response.setStatus(200);
            response.getWriter().write("OK");
        } else {
            // Sai signature, báo lỗi
            response.setStatus(401);
            response.getWriter().write("Invalid signature");
        }
    }
}
