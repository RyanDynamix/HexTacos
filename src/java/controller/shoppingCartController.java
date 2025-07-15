package controller;

import controller.payment.Config;
import dal.OrderDAO;
import feature.sendEmail.Email;
import java.io.IOException;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Users;
import model.gioHang;
import util.Validate;
import vn.payos.PayOS;
import vn.payos.type.CheckoutResponseData;
import vn.payos.type.ItemData;
import vn.payos.type.PaymentData;

@WebServlet(name = "shoppingCartController", urlPatterns = {"/shopping"})
public class shoppingCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users acc = (Users) session.getAttribute("account");

        if (acc == null) {
            response.sendRedirect("auth");
            return;
        }

        OrderDAO dao = new OrderDAO();
        int orderID = dao.findOrderIdNotConfirmed(acc.getUserID());
        List<gioHang> cart = dao.showShoppingCartByID(orderID);

        if (cart != null) {
            cart.forEach(item -> {
                item.setDisString(Validate.doubleToMoney(item.getPrice()));
                item.setTotalString(Validate.doubleToMoney(item.getTotalMoney()));
            });
        }

        request.setAttribute("allProductShopping", cart);
        request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("orderSubmit".equals(action)) {
            handleOrderSubmit(request, response);
        } else if ("changeQuantity".equals(action)) {
            handleChangeQuantity(request);
            response.sendRedirect("shopping");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void handleOrderSubmit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users acc = (Users) session.getAttribute("account");

        if (acc == null) {
            response.sendRedirect("auth");
            return;
        }

        OrderDAO dao = new OrderDAO();
        int orderID = dao.findOrderIdNotConfirmed(acc.getUserID());

        if (orderID == 0) {
            orderID = dao.createNewOrder(acc.getUserID());
        }

        String nameOrder = request.getParameter("nameOrder");
        String phone = request.getParameter("phone");
        String deliveryLocation = request.getParameter("deliveryLocation");
        String paymentMethod = request.getParameter("paymentMethod");

        List<gioHang> cart = dao.showShoppingCartByID(orderID);
        double totalAmount = cart.stream().mapToDouble(g -> g.getTotalMoney()).sum();

        dao.updateOrderConfirmedDB(orderID, nameOrder, phone, deliveryLocation, paymentMethod, totalAmount);

        if ("COD".equalsIgnoreCase(paymentMethod)) {
            dao.confirmOrder(orderID, "COD", "Paid");
            sendOrderEmail(acc.getEmail(), nameOrder, phone, deliveryLocation, cart);
            response.sendRedirect("shopping?notifyOrder=success");

        } else if ("PAYOS".equalsIgnoreCase(paymentMethod)) {
            try {
                String clientId = Config.CLIENT_ID;
                String apiKey = Config.API_KEY;
                String checksumKey = Config.CHECKSUM_KEY;
                PayOS payOS = new PayOS(clientId, apiKey, checksumKey);

                long orderCode = orderID; // hoặc System.currentTimeMillis()/1000 nếu muốn luôn duy nhất
                int amount = (int) Math.round(totalAmount);

                // Nếu muốn liệt kê nhiều item, bạn có thể duyệt cart thành List<ItemData>
                ItemData itemData = ItemData.builder()
                        .name("Đơn hàng #" + orderID)
                        .quantity(1)
                        .price(amount)
                        .build();

                PaymentData paymentData = PaymentData.builder()
                        .orderCode(orderCode)
                        .amount(amount)
                        .description("Thanh toán đơn hàng #" + orderID)
                        .returnUrl(Config.RETURN_URL)
                        .cancelUrl(Config.CANCEL_URL)
                        .item(itemData)
                        .build();

                CheckoutResponseData result = payOS.createPaymentLink(paymentData);

                // Lưu trạng thái đơn hàng là "Chờ thanh toán"
                dao.confirmOrder(orderID, "PAYOS", "Pending");
                response.sendRedirect(result.getCheckoutUrl());

            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendRedirect("shopping?notifyOrder=failed");
                return;
            }

        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Phương thức thanh toán không hợp lệ");
        }
    }

    //    private String generateVnpayUrl(int orderID, double totalAmount, HttpServletRequest request) throws IOException {
    //        HttpSession session = request.getSession();
    //        Users acc = (Users) session.getAttribute("account");
    //
    //        // Lưu thông tin đơn hàng vào session
    //        session.setAttribute("pendingOrderID", orderID);
    //        session.setAttribute("pendingAmount", totalAmount);
    //        session.setAttribute("pendingNameOrder", request.getParameter("nameOrder"));
    //        session.setAttribute("pendingPhone", request.getParameter("phone"));
    //        session.setAttribute("pendingDeliveryLocation", request.getParameter("deliveryLocation"));
    //
    //        Map<String, String> vnp_Params = new HashMap<>();
    //        vnp_Params.put("vnp_Version", "2.1.0");
    //        vnp_Params.put("vnp_Command", "pay");
    //        vnp_Params.put("vnp_TmnCode", Config.vnp_TmnCode);
    //        vnp_Params.put("vnp_Amount", String.valueOf((long) (totalAmount * 100)));
    //        vnp_Params.put("vnp_CurrCode", "VND");
    //        vnp_Params.put("vnp_TxnRef", String.valueOf(orderID)); // Sử dụng orderID thực tế
    //        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang #" + orderID);
    //        vnp_Params.put("vnp_OrderType", "other");
    //        vnp_Params.put("vnp_Locale", "vn");
    //        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
    //        vnp_Params.put("vnp_IpAddr", Config.getIpAddress(request));
    //
    //        // Add timestamp
    //        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
    //        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    //        String vnp_CreateDate = formatter.format(cld.getTime());
    //        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
    //
    //        cld.add(Calendar.MINUTE, 15); // 15 minutes expiry
    //        String vnp_ExpireDate = formatter.format(cld.getTime());
    //        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
    //
    //        // Build hash và query string theo cách chuẩn
    //        String vnp_SecureHash = Config.hashAllFields(vnp_Params);
    //        vnp_Params.put("vnp_SecureHash", vnp_SecureHash);
    //
    //        // Build final URL
    //        StringBuilder query = new StringBuilder();
    //        for (Map.Entry<String, String> entry : vnp_Params.entrySet()) {
    //            query.append(URLEncoder.encode(entry.getKey(), "UTF-8"));
    //            query.append("=");
    //            query.append(URLEncoder.encode(entry.getValue(), "UTF-8"));
    //            query.append("&");
    //        }
    //        query.setLength(query.length() - 1); // remove last '&'
    //
    //        return Config.vnp_PayUrl + "?" + query.toString();
    //    }
    private void handleChangeQuantity(HttpServletRequest request) {
        OrderDAO dao = new OrderDAO();
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        int totalItems = Integer.parseInt(request.getParameter("totalItems"));

        for (int i = 0; i < totalItems; i++) {
            int pid = Integer.parseInt(request.getParameter("productID_" + i));
            int qty = Integer.parseInt(request.getParameter("quantity_" + i));
            String color = request.getParameter("color_" + i);
            dao.updateOrderDetailsByOrderID(orderID, pid, qty, color);
        }
    }

    private void sendOrderEmail(String email, String nameOrder, String phone,
            String deliveryLocation, List<gioHang> cart) {
        double sumMoney = 0;
        StringBuilder detail = new StringBuilder();

        for (gioHang item : cart) {
            item.setDisString(Validate.doubleToMoney(item.getPrice()));
            item.setTotalString(Validate.doubleToMoney(item.getTotalMoney()));
            sumMoney += item.getTotalMoney();
            detail.append("<p>")
                    .append(item.getProductName())
                    .append(" – Số lượng: ").append(item.getQuantity())
                    .append(", Màu: ").append(item.getColor())
                    .append(", Thành tiền: ").append(item.getTotalString())
                    .append("</p><hr>");
        }

        detail.append("<h3>Tổng đơn hàng: ")
                .append(Validate.doubleToMoney(sumMoney))
                .append("đ</h3>");

        String subject = "Cảm ơn " + nameOrder + " đã đặt hàng tại HexTech!";
        String html = "<h2>Đơn hàng của bạn</h2>"
                + "<p>Người nhận: " + nameOrder + "</p>"
                + "<p>Điện thoại: " + phone + "</p>"
                + "<p>Địa chỉ: " + deliveryLocation + "</p>"
                + detail
                + "<p>HexTech cảm ơn bạn!</p>";

        Email.sendEmail(email, subject, html);
    }

    @Override
    public String getServletInfo() {
        return "ShoppingCartController handling COD and VNPAY";
    }
}
